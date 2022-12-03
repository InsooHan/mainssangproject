package fpro.data.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.DemovieDto;
import fpro.data.dto.MovieDto;
import fpro.data.dto.SangDto;
import fpro.data.dto.TheaterDto;
import fpro.data.service.DemovieService;
import fpro.data.service.MovieService;
import fpro.data.service.TheaterService;

@Controller
public class MoviebookController {
	
	@Autowired
	TheaterService service;
	@Autowired
	MovieService mservice;
	@Autowired
	DemovieService dservice;
	
	@GetMapping("/book/listtwo")
	public ModelAndView moveListTwo(@RequestParam String moviename,@RequestParam String theater,@RequestParam String sangnum,@RequestParam String cartnum) {
		ModelAndView mview=new ModelAndView();
		
		SangDto sdto=dservice.getSangData(sangnum);
		DemovieDto ddto=dservice.getbookedData(cartnum);
		
		int a=ddto.getSeat().length();
		
		String bseat=ddto.getSeat().substring(2,(a-1));
		String [] bseatarr=bseat.split("ll");
		int seatnum=bseatarr.length;
		
		List<String> booklist=new ArrayList<>();
		
//		System.out.println(bseat);
		for(int i=0;i<bseatarr.length;i++) {
			booklist.add(bseatarr[i]);
			
			//System.out.println(booklist.get(i));
		}
		
		int bookednum=booklist.size();
		
		mview.addObject("sdto", sdto);
		mview.addObject("booklist", booklist);
		mview.addObject("bookednum", bookednum);
		mview.addObject("seatnum", seatnum);
		mview.addObject("cartnum", cartnum);
		
		mview.setViewName("/mbook/listtwo");
		
		return mview;
	}
	
	@GetMapping("/book/updatebook")
	public ModelAndView updatebook(@RequestParam String cartnum,@RequestParam String seat) {
		ModelAndView mview=new ModelAndView();
		
		DemovieDto ddto=new DemovieDto();
		
		ddto.setSeat(seat);
		ddto.setCart_num(cartnum);
		
		dservice.updateSeat(ddto);
		
		//System.out.println(seat+","+cartnum);
		
		mview.setViewName("/mbook/listthree");
		
		return mview;
	}
	
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
	
	@GetMapping("book/movielist")
	@ResponseBody
	public List<DemovieDto> movietimelist(@RequestParam String moviename,@RequestParam String theater){
		return dservice.getSomeDatas(theater, moviename);
	}
	
	
	
}
