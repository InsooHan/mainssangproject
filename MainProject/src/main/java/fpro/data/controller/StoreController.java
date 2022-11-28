package fpro.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.CartDto;
import fpro.data.dto.StoreDto;
import fpro.data.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService service;
	

	//스토어 상품 추가 폼으로 이동
	@GetMapping("/store/form")
	public String form() {
		return "/store/storeinsertform";
	}
	
	//상품 추가 폼에서 db에 저장
	@PostMapping("/store/insert")
	public String insert(@ModelAttribute StoreDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname="s_"+sdf.format(new Date())+upload.getOriginalFilename();
			
			dto.setStore_photo(photoname);
			
			try {
				upload.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		service.insertStore(dto);
		
		return "redirect:list";
	}
	
	
	
	
	//스토어 상품 리스트 출력
	@GetMapping("/store/list")
	public ModelAndView list() {
		
		ModelAndView mview = new ModelAndView();
		
		//전체 갯수
		int totalCount = service.getTotalCount();
		mview.addObject("totalCount", totalCount);
		
		//전체 데이터 출력
		List<StoreDto> list = service.getAllStores(); 
		mview.addObject("list", list);
		
		//메가티켓 목록만 출력
		List<StoreDto> mtlist = service.getMegaticket();
		mview.addObject("mtlist", mtlist);
		 
		mview.setViewName("/store/storelist");
		
		return mview;
	}
	
	//제품 누르면 디테일 페이지 이동
	@GetMapping("/store/detail")
	public ModelAndView detail(@RequestParam String store_num,
			HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		//디테일 페이지에 dto 값 보내기
		StoreDto dto = service.getStore(store_num);
		mview.addObject("dto", dto);
		
		//로그인 된 아이디에 맞는 num 가져오기
		String id = (String)session.getAttribute("myid");
		String m_num = service.getNumById(id);
		mview.addObject("member_num", m_num);
		
		mview.setViewName("/store/storedetail");
		
		return mview;
			
	}
	
	//구매버튼 누르면 구매 페이지로 이동
	@GetMapping("/store/buy")
	public ModelAndView buy(@RequestParam String store_num) {
		
		ModelAndView mview = new ModelAndView();

		//카트에 가장 최근에 추가된 데이터가 바로 구매 페이지에 뜨게 maxnum 가져오기
		int mnum = service.getMaxNum();
		
		String maxnum = String.valueOf(mnum);

		//Store 테이블의 maxnum 데이터 가져오기
		StoreDto sdto = service.getStore(store_num);
		mview.addObject("sdto", sdto);
		
		//storecart 테이블 가장 최근 주문 정보(수량) 데이터 가져오기
		CartDto cdto = service.getCart(maxnum);
		mview.addObject("cdto", cdto);
		
		mview.setViewName("/store/storebuy");
		
		return mview;
	}
	
	//장바구니 누르면 장바구니로 이동
	@GetMapping("/store/cart")
	public ModelAndView cart(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		String id = (String)session.getAttribute("myid");
		
		List<CartDto> cartlist = service.getCartById(id);

		int cartlistcount = cartlist.size();
		
		mview.addObject("cartlist", cartlist);
		mview.addObject("cartlistcount", cartlistcount);
		
		mview.setViewName("/store/storecart");
		
		return mview;
	}
	
	
	//디테일 페이지에서 제품num, 회원num, cnt 장바구니 테이블에 insert
	@PostMapping("/store/cartinsert")
	@ResponseBody
	public void cartinsert(@ModelAttribute CartDto dto) {
		
		service.insertCart(dto);
		
	}
	
	//장바구니에서 삭제 누르면 삭제
	@GetMapping("/store/cartdelete")
	@ResponseBody
	public void cartdelete(@RequestParam String cart_idx) {
		
		service.deleteCart(cart_idx);
	}
	
	@PostMapping("/store/cartcntupdate")
	@ResponseBody
	public void cartcntupdate(@RequestParam int cart_cnt,
			@RequestParam String cart_idx) {
		service.updateCartCnt(cart_cnt, cart_idx);
	}
	
}
