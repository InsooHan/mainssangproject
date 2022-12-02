package fpro.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.MovieDto;
import fpro.data.service.MovieService;

@Controller
public class HomeController {
	
	@Autowired
	MovieService service;
	
	@GetMapping("/")
	public ModelAndView start() {

		ModelAndView mview = new ModelAndView();
		//영화 리스트
		List<MovieDto> list = service.getAllDatas();
		
		mview.addObject("list", list);
		
		mview.setViewName("/layout/main");
		
		
		return mview;
	}
	
	
	
	
	
}
