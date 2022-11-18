package fpro.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin/list")
	public ModelAndView adminlist() {
		ModelAndView mview=new ModelAndView();
		
		mview.setViewName("/admin/adminlist");
		return mview;
				
	}
	
}
