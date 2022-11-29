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
		//총 글의 개수
		int newtotalCount = service.getNewTotalCount();
		int commingtotalCount = service.getCommingTotalCount();
		List<MovieDto> clistasc = service.getDatasAsc();
		//전체리스트
		List<MovieDto> list = service.getAllDatas();
		
		mview.addObject("newtotalCount", newtotalCount);
		mview.addObject("commingtotalCount", commingtotalCount);
		mview.addObject("clist", clistasc);
		mview.addObject("list", list);
		
		mview.setViewName("/movie/movielist");
		
		return mview;
	}
	
	@GetMapping("/book/listmovie")
	@ResponseBody
	public List<MovieDto> showMovieList(){
		return service.getSomeDatas();
	}
	
	@GetMapping("/movie/detail")
	public ModelAndView moviedetail() {
		
		ModelAndView mview = new ModelAndView();
		
		mview.setViewName("/movie/moviedetail");
		
		return mview;
	}
}
