package fpro.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.MovieDto;
import fpro.data.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	MovieService service;

	@GetMapping("/movie/list")
	public ModelAndView movielist() {
		
		ModelAndView mview = new ModelAndView();
		mview.setViewName("/movie/movielist");
		
		return mview;
	}
	
	@GetMapping("/book/listmovie")
	@ResponseBody
	public List<MovieDto> showMovieList(){
		return service.getSomeDatas();
	}
	
	
}
