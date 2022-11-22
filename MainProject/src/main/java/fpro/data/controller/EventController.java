package fpro.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


import fpro.data.service.EventService;


@Controller
public class EventController {

	@Autowired
	EventService service;
	
	@GetMapping("/event/list")
	public ModelAndView adminlist() {
		ModelAndView mview=new ModelAndView();
		
		mview.setViewName("/event/eventlist");
		return mview;
				
	}
	
}
