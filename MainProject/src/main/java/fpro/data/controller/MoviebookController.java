package fpro.data.controller;

import java.sql.Timestamp;
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
		DemovieDto dddto=dservice.getbookedData(cartnum);
		
		//값 업데이트(중복된 seat 안들어가도록 나중에 처리 필요) 처리 완료
		if(dddto.getSeat().contains(seat)==false) {
			ddto.setSeat(seat);
			ddto.setCart_num(cartnum);
			
			dservice.updateSeat(ddto);
		}
		
		
		
		//성인, 청소년 수 보내기
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
		
		
		String sangnum=dddto.getSang_num();
		
		SangDto sdto=dservice.getSangData(sangnum);
		
		int capacity=Integer.parseInt(sdto.getCapacity());
		
		//seat 값 보내기
		String realseat="";
		
		if(capacity==32) {
			//System.out.println(bbooklist.size());
			for(int i=0;i<bbooklist.size();i++) {
				
				if((Integer.parseInt(bbooklist.get(i))/8)==0 || Integer.parseInt(bbooklist.get(i))==8) {
					realseat+="A"+bbooklist.get(i)+", ";
				}else if(((Integer.parseInt(bbooklist.get(i))-1)/8)==1) {
					realseat+="B"+((Integer.parseInt(bbooklist.get(i))+1)%9)+", ";
				}else if(((Integer.parseInt(bbooklist.get(i))-1)/8)==2) {
					realseat+="C"+((Integer.parseInt(bbooklist.get(i))+2)%9)+", ";
				}else {
					realseat+="D"+((Integer.parseInt(bbooklist.get(i))+3)%9)+", ";
				}
			}
			
		}
		
		realseat=realseat.substring(0, realseat.length()-2);
		
		mview.addObject("realseat", realseat);
		
		//영화 정보 넣기
		String movienum=dddto.getMovie_num();
		
		MovieDto mdto=mservice.getData(movienum);
		
		String mname=mdto.getName();
		String poster=mdto.getPoster();
		String age=mdto.getAge();
		Timestamp time=dddto.getMovietime();
		String runtime=mdto.getRuntime();
		
		mview.addObject("mname", mname);
		mview.addObject("poster", poster);
		mview.addObject("age", age);
		mview.addObject("time", time);
		mview.addObject("runtime", runtime);
		
		//가격 넣기
		int price=sdto.getPrice();
		
		double realprice=(adult*price)+(youth*price*0.8);
		
		mview.addObject("realprice", realprice);
	
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
