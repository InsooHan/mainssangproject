package fpro.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		
		//데이터 출력
		
		List<StoreDto> list = service.getAllStores(); 
		mview.addObject("list", list);
		 
		mview.setViewName("/store/storelist");
		
		return mview;
	}
}
