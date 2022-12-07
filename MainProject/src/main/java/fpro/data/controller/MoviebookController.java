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
		
		int seatnum=0;
		int a=ddto.getSeat().length();
		String bseat=ddto.getSeat();
		List<String> booklist=new ArrayList<>();
		
		if(a!=1) {
			bseat=ddto.getSeat().substring(2,(a-1));
			
			String [] bseatarr=bseat.split("ll");
			
			seatnum=bseatarr.length;
			
			for(int i=0;i<bseatarr.length;i++) {
				booklist.add(bseatarr[i]);
			}
			
		}
		
//		System.out.println(bseat);
		
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
	public ModelAndView updatebook(@RequestParam String cartnum,@RequestParam String seat,@RequestParam int adult,@RequestParam int youth) {
		ModelAndView mview=new ModelAndView();
		
		DemovieDto ddto=new DemovieDto();
		
		ddto.setSeat(seat);
		ddto.setCart_num(cartnum);
		
		dservice.updateSeat(ddto);
		
		mview.addObject("adult", adult);
		mview.addObject("youth", youth);
		
		//seat 구해서 arraylist에 넣기
		int a=seat.length();
		
		List<String> bbooklist=new ArrayList<>();
		
		String bbseat=seat.substring(1,(a-1));
		
		String [] bbseatarr=bbseat.split("ll");
		
		//seatnum=bseatarr.length;
		
		
		for(int i=0;i<bbseatarr.length;i++) {
			bbooklist.add(bbseatarr[i]);
			
		}
		
		//영화관 좌석 배치 구하기 위한 수용인원 구하기
		DemovieDto dddto=dservice.getbookedData(cartnum);
		
		String sangnum=dddto.getSang_num();
		
		SangDto sdto=dservice.getSangData(sangnum);
		
		int capacity=Integer.parseInt(sdto.getCapacity());
		
		//seat 값 보내기
		String realseat="";
		
		if(capacity==32) {
			//System.out.println(bbooklist.size());
			for(int i=0;i<bbooklist.size();i++) {
				
				if((Integer.parseInt(bbooklist.get(i))/8)==0) {
					realseat+="A"+bbooklist.get(i)+", ";
				}else if((Integer.parseInt(bbooklist.get(i))/8)==1) {
					realseat+="B"+((Integer.parseInt(bbooklist.get(i))+1)%9)+", ";
				}else if((Integer.parseInt(bbooklist.get(i))/8)==2) {
					realseat+="C"+((Integer.parseInt(bbooklist.get(i))+2)%9)+", ";
				}else {
					realseat+="D"+((Integer.parseInt(bbooklist.get(i))+3)%9)+", ";
				}
			}
			
		}
		
		realseat=realseat.substring(0, realseat.length()-2);
		
		//영화 정보 넣기
		
		mview.addObject("realseat", realseat);
		
		
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
