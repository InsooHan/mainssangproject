package fpro.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.BoardAnswerDto;
import fpro.data.dto.CommunityDto;
import fpro.data.service.CommunityService;
import fpro.data.service.LoginService;



@Controller
public class CommunityController {
	@Autowired
	CommunityService ser;
	
	@Autowired
	LoginService lser;
	
	@GetMapping("/community/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw
			) {	//required = false => null값일때
		ModelAndView mview=new ModelAndView();
				
		
		//페이징에 필요한 변수
				int totalCount=ser.getTotalCount(sc, sw);
				int totalPage;	//총 페이지수
				int startPage;	//각 블럭의 시작페이지
				int endPage;	//각 블럭의 끝페이지
				int start;	//각 페이지의 시작번호
				int perPage=6;	//한 페이지에 보여질 글의 갯수
				int perBlock=5;	//한 블럭당 보여지는 페이지개수
				
				
				//총 페이지개수
				totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

				//각 블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
				startPage=(currentPage-1)/perBlock*perBlock+1;
				endPage=startPage+perBlock-1;

				//총 페이지수가 8... 2번째 블럭은 startpage가 6, endpage가 10... endpage는 8로 수정해줘야함
				if(endPage>totalPage)
					endPage=totalPage;


				//각 페이지에서 불러올 시작번호
				//현재페이지가 1일경우 start는 1,현재페이지가 2일경우 6
				start=(currentPage-1)*perPage;

				//각 페이지에서 필요한 게시글 불러오기
				List<CommunityDto>list =ser.getList(sc, sw, start, perPage);
				
				
				//댓글개수
				for(CommunityDto d:list) {
					d.setAnscount(ser.getAlist(d.getNum()).size());
				}



				//각 글 앞에 붙힐 시작번호
				//총 글이 만약 20... 1페이지는 20부터 2페이지는 15부터
				//출력해서 1씩 감소하면서 출력
				int no=totalCount-(currentPage-1)*perPage;


				//출력에 필요한 변수들을 request에 저장
				mview.addObject("list", list);
				mview.addObject("totalPage", totalPage);
				mview.addObject("startPage", startPage);
				mview.addObject("endPage", endPage);
				mview.addObject("currentPage", currentPage);
				mview.addObject("no", no);
				mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/community/list");
		return mview;
	}
	
	@GetMapping("/community/movietalk")
	public ModelAndView movietalk(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw, String category
			) {	//required = false => null값일때
		ModelAndView mview=new ModelAndView();
	
		
		int totalCount=ser.getTotalCountMovieTalk(sc, sw);
		int totalPage;	//총 페이지수
		int startPage;	//각 블럭의 시작페이지
		int endPage;	//각 블럭의 끝페이지
		int start;	//각 페이지의 시작번호
		int perPage=6;	//한 페이지에 보여질 글의 갯수
		int perBlock=5;	//한 블럭당 보여지는 페이지개수
		
		
		//총 페이지개수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총 페이지수가 8... 2번째 블럭은 startpage가 6, endpage가 10... endpage는 8로 수정해줘야함
		if(endPage>totalPage)
			endPage=totalPage;


		//각 페이지에서 불러올 시작번호
		//현재페이지가 1일경우 start는 1,현재페이지가 2일경우 6
		start=(currentPage-1)*perPage;

		//각 페이지에서 필요한 게시글 불러오기
		List<CommunityDto>list =ser.getListMovieTalk(sw, category, start, perPage);

		//댓글개수
		for(CommunityDto d:list) {
			d.setAnscount(ser.getAlist(d.getNum()).size());
		}


		//각 글 앞에 붙힐 시작번호
		//총 글이 만약 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;


		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);
		mview.addObject("totalCount", totalCount);

		
		mview.setViewName("/community/movietalk");
		return mview;
	}
	
	
	@GetMapping("/community/moviereport")
	public ModelAndView moviereport(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw
			) {	//required = false => null값일때
		ModelAndView mview=new ModelAndView();

		
		int totalCount=ser.getTotalCountMovieReport(sc, sw);
		int totalPage;	//총 페이지수
		int startPage;	//각 블럭의 시작페이지
		int endPage;	//각 블럭의 끝페이지
		int start;	//각 페이지의 시작번호
		int perPage=6;	//한 페이지에 보여질 글의 갯수
		int perBlock=5;	//한 블럭당 보여지는 페이지개수
		
		
		//총 페이지개수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총 페이지수가 8... 2번째 블럭은 startpage가 6, endpage가 10... endpage는 8로 수정해줘야함
		if(endPage>totalPage)
			endPage=totalPage;


		//각 페이지에서 불러올 시작번호
		//현재페이지가 1일경우 start는 1,현재페이지가 2일경우 6
		start=(currentPage-1)*perPage;

		//각 페이지에서 필요한 게시글 불러오기

		List<CommunityDto>list =ser.getListMovieReport(sc, sw, start, perPage);
		
		//댓글개수
		for(CommunityDto d:list) {
			d.setAnscount(ser.getAlist(d.getNum()).size());
		}


		//각 글 앞에 붙힐 시작번호
		//총 글이 만약 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;


		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);
		mview.addObject("totalCount", totalCount);

		
		mview.setViewName("/community/moviereport");
		return mview;
	}
	
	@GetMapping("/community/best")
	public ModelAndView best(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw
			) {	//required = false => null값일때
		ModelAndView mview=new ModelAndView();

		
		int totalCount=ser.getTotalCount(sc, sw);
		int totalPage;	//총 페이지수
		int startPage;	//각 블럭의 시작페이지
		int endPage;	//각 블럭의 끝페이지
		int start;	//각 페이지의 시작번호
		int perPage=6;	//한 페이지에 보여질 글의 갯수
		int perBlock=5;	//한 블럭당 보여지는 페이지개수
		
		
		//총 페이지개수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총 페이지수가 8... 2번째 블럭은 startpage가 6, endpage가 10... endpage는 8로 수정해줘야함
		if(endPage>totalPage)
			endPage=totalPage;


		//각 페이지에서 불러올 시작번호
		//현재페이지가 1일경우 start는 1,현재페이지가 2일경우 6
		start=(currentPage-1)*perPage;

		//각 페이지에서 필요한 게시글 불러오기

		List<CommunityDto>list =ser.getListBest(sc, sw, start, perPage);
		
		//댓글개수
		for(CommunityDto d:list) {
			d.setAnscount(ser.getAlist(d.getNum()).size());
		}


		//각 글 앞에 붙힐 시작번호
		//총 글이 만약 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;


		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);
		mview.addObject("totalCount", totalCount);

		
		mview.setViewName("/community/best");
		return mview;
	}
	
	
	
	@GetMapping("/community/writeform")
	public String form(@RequestParam(defaultValue = "0") int num,@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,Model model) {
		
		
		//답글일 경우에만 넘어오는 값들
		//새 글일 경우에는 모두 null이므로 defaultvalue값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		//model.addAttribute("category", category);
		
		return "/community/smartform";
	}
	
	
	@PostMapping("/community/insert")
	public String insert(@ModelAttribute CommunityDto dto, HttpSession session,int currentPage) {
		String id=(String)session.getAttribute("myid");
		String name=lser.getName(id);
		dto.setId(id);
		dto.setName(name);
		
		//관리자가 글을 쓸때에는 notice에 1이 들어오게함
		if(dto.getId().equals("admin")) {
			dto.setNotice(1);
		}
		
	
		
		//insert
		ser.insertBoard(dto);
		
		return "redirect:list?currnetPage="+currentPage;	
	}
	
	
	
	@GetMapping("/community/detail")
	public ModelAndView detail(@RequestParam int currentPage,int num) {
		ModelAndView model=new ModelAndView();
		CommunityDto dto=ser.getData(num);
		ser.updateReadCount(num);


		model.addObject("num", num);
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		model.setViewName("/community/detail");
		
		return model;
	}
	
	@GetMapping("/community/uform")
	public String uform(Model model,int num,int currentPage) {
		CommunityDto dto=ser.getData(num);

		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);	
		return "/community/updateform";
	}
	
	
		
	@PostMapping("/community/update")
	public String update(@ModelAttribute CommunityDto dto, HttpSession session,int currentPage) {
		
		//update
		ser.updateBoard(dto);
		
		
		return "redirect:detail?num="+dto.getNum()+"&currentPage="+currentPage;	
	}
		

	
	@GetMapping("/community/delete")
	@ResponseBody
	public void delete(int num) {
		ser.deleteBoard(num);
	}
	
	
	@GetMapping("/community/likes")
	@ResponseBody
	public Map<String, Integer> likes(int num) {
		ser.likesUpdate(num);
		int likes=ser.getData(num).getLikes();
		
		Map<String, Integer> map=new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
	
	
	@PostMapping("/community/ainsert")
	@ResponseBody
	public void ainsert(BoardAnswerDto bdto,HttpSession session) {
		String id=(String)session.getAttribute("myid");
		String name=lser.getName(id);
		bdto.setId(id);
		bdto.setName(name);
		ser.insertAnswer(bdto);
	}
	
	@GetMapping("/community/alist")
	@ResponseBody
	public List<BoardAnswerDto> alist(int num) {
		//Map<String, Object>map=new HashMap<>();
		List<BoardAnswerDto> list=ser.getAlist(num);
		return list;
	}
	
	@GetMapping("/community/adelete")
	@ResponseBody
	public void answerdelete(int idx) {
		ser.deleteAnswer(idx);
	}
	
	@GetMapping("/community/auform")
	@ResponseBody
	public BoardAnswerDto auform(int idx){
		BoardAnswerDto bdto=ser.getAnsData(idx);
		return bdto;
	}
	
	@PostMapping("/community/aupdate")
	@ResponseBody
	public void aupdate(BoardAnswerDto bdto){
		ser.updateAnswer(bdto);
	}
	
}
