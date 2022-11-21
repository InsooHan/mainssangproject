package fpro.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService service;
	

	//스토어 상품 추가 폼으로 이동
	@GetMapping("/store/form")
	public String form() {
		return "/store/storeinsertform";
	}
	
	
	//스토어 상품 리스트 출력
	@GetMapping("/store/list")
	public ModelAndView list() {
		
		ModelAndView mview = new ModelAndView();
		
		//전체 갯수
		int totalCount = service.getTotalCount();
		mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/store/storelist");
		
		return mview;
	}
}
