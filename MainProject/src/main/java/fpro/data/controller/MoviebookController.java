package fpro.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.MovieDto;
import fpro.data.dto.TheaterDto;
import fpro.data.service.MovieService;
import fpro.data.service.TheaterService;

@Controller
public class MoviebookController {
	
	@Autowired
	TheaterService service;
	@Autowired
	MovieService mservice;
	
	@GetMapping("/book/list")
	public ModelAndView moveList() {
		ModelAndView mview=new ModelAndView();
		
		List<MovieDto> list=mservice.getSomeDatas();
		
		mview.addObject("list", list);
		
		mview.setViewName("/mbook/list");
		
		return mview;
	}
	
	@GetMapping("/book/listcity")
	@ResponseBody
	public List<TheaterDto> noPageList(@RequestParam String city){
		return service.getSomeDatas(city);
	}
	
}
