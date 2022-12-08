package fpro.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.CommunityDto;
import fpro.data.dto.EventDto;
import fpro.data.dto.MemberDto;
import fpro.data.dto.MovieDto;
import fpro.data.dto.StoreDto;
import fpro.data.service.HomeService;
import fpro.data.service.MemberService;
import fpro.data.service.MovieService;
import fpro.data.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired
	MovieService mservice;
	
	@Autowired
	StoreService sservice;
	
	@Autowired
	HomeService hservice;
	
	@Autowired
	MemberService memservice;
	
	
	@GetMapping("/")
	public ModelAndView start(HttpSession session) {

		ModelAndView mview = new ModelAndView();
		
		//영화 리스트
		List<MovieDto> mlist = mservice.getAllDatas();
		mview.addObject("mlist", mlist);
		
		//스토어 리스트
		List<StoreDto> slist = sservice.getAllStores();
		mview.addObject("slist", slist);
		
		//커뮤니티 리스트
		List<CommunityDto> clist = hservice.getCommunityToMain();
		mview.addObject("clist", clist);
		
		//이벤트 리스트
		List<EventDto> elist = hservice.getEventToMain();
		mview.addObject("elist", elist);
		
		if(session.getAttribute("loginok")!=null) {
			//마이페이지 넘어갈 멤버 num 받아오기
			String id = (String)session.getAttribute("myid");
			MemberDto memdto = memservice.getDataById(id);
			String memnum = memdto.getNum();
			
			mview.addObject("memnum", memnum);
		}
		
		
		
		mview.setViewName("/layout/main");
		
		return mview;
	}
	
	
	
	
	
	
	
}
