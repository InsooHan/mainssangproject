package fpro.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieController {

	@GetMapping("/movie/list")
	public ModelAndView movielist() {
		
		ModelAndView mview = new ModelAndView();
		mview.setViewName("/movie/movielist");
		
		return mview;
	}
}
