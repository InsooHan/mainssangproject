package fpro.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.MovieDto;
import fpro.data.dto.StoreDto;
import fpro.data.service.MovieService;
import fpro.data.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired
	MovieService mservice;
	
	@Autowired
	StoreService sservice;
	
	@GetMapping("/")
	public ModelAndView start() {

		ModelAndView mview = new ModelAndView();
		
		//영화 리스트
		List<MovieDto> mlist = mservice.getAllDatas();
		mview.addObject("mlist", mlist);
		
		//스토어 리스트
		List<StoreDto> slist = sservice.getAllStores();
		mview.addObject("slist", slist);
		
		mview.setViewName("/layout/main");
		
		return mview;
	}
	
	
	
	
	
	
	
}
