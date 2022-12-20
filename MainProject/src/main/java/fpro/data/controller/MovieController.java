package fpro.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.MessageDto;
import fpro.data.dto.MovieDto;
import fpro.data.dto.MovieReviewDto;
import fpro.data.service.MemberService;
import fpro.data.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	MovieService service;
	@Autowired
	MemberService mservice;

	@GetMapping("/movie/list")
	public ModelAndView movielist() {
		
		ModelAndView mview = new ModelAndView();
		//총 글의 개수
		int newtotalCount = service.getNewTotalCount();
		int commingtotalCount = service.getCommingTotalCount();
		//전체리스트
		List<MovieDto> list = service.getAllDatas();
		//상영예정리스트
		List<MovieDto> clistasc = service.getDatasAsc();
		//예매율순 리스트
		List<MovieDto> ticketlist = service.getticketDatas();
		//누적관객순 리스트
		List<MovieDto> acclist = service.getaccDatas();
		
		mview.addObject("newtotalCount", newtotalCount);
		mview.addObject("commingtotalCount", commingtotalCount);
		mview.addObject("list", list);
		mview.addObject("clist", clistasc);
		mview.addObject("ticketlist", ticketlist);
		mview.addObject("acclist", acclist);
		
		mview.setViewName("/movie/movielist");
		
		return mview;
	}
	
	@GetMapping("/book/listmovie")
	@ResponseBody
	public List<MovieDto> showMovieList(){
		return service.getSomeDatas();
	}
	
	@GetMapping("/movie/msearch")
	public ModelAndView moviesearchlist(@RequestParam(value = "ibxMovieNmSearch", required = false) String sc) {
		
		ModelAndView mview = new ModelAndView();
		
		//전체리스트
		List<MovieDto> list = service.getSearch(sc);
		mview.addObject("list", list);
		mview.addObject("totCount", list.size());
		
		mview.setViewName("/movie/moviesearch");
		
		return mview;
	}
	
	@GetMapping("/movie/detail")
	public ModelAndView moviedetail(String num, String idx, HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		MovieDto dto = service.getData(num);
		mview.addObject("dto", dto);
		
		//로그인한 id
		String myid = (String)session.getAttribute("myid");
		//로그인한 id에서 이름 얻어오기
		String name = mservice.getName(myid);
		
		//num에 해당하는 관람평
		List<MovieReviewDto> rvlist = service.getReviewList(num);
		List<MovieReviewDto> rvchulist = service.getReviewListChu(num);
		List<MovieReviewDto> rvgradelist = service.getReviewListGrade(num);
				
		mview.addObject("rvcount", rvlist.size()); //관람평 개수
		mview.addObject("rvlist", rvlist); //관람평 리스트(최신순)
		mview.addObject("rvchulist", rvchulist); //관람평 리스트(공감순)
		mview.addObject("rvgradelist", rvgradelist); //관람평 리스트(평점순)
		mview.addObject("rvname", name); //로그인한 회원이름
		mview.addObject("rvmyid", myid); //로그인한 id
		
		mview.setViewName("/movie/moviedetail");
		
		return mview;
	}
	
	@GetMapping("/movie/chulist")
	@ResponseBody
	public String rvchulist() {
		
		return "/movie/moviedetail";
	}

	//영화 like 증가
	@GetMapping("/movie/likes")
	@ResponseBody
	public Map<String, Integer> likes(String num) {
		
		//영화 like 증가sql
		service.mlikesUpdate(num);
		int likes = service.getData(num).getLikes();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
	//영화 like 감소
	@GetMapping("/movie/nolikes")
	@ResponseBody
	public Map<String, Integer> nolikes(String num) {
		
		//영화 like 증가sql
		service.mlikesCancel(num);
		int likes = service.getData(num).getLikes();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}

	
	//관람평 등록
	@PostMapping("/movie/rvinsert")
	public String reviewinsert(@ModelAttribute MovieReviewDto mrdto,HttpSession session) {
		
		//로그인한 id
		String myid = (String)session.getAttribute("myid");
		mrdto.setMyid(myid); //DB에 id저장
				
		//로그인한 id에서 이름 얻어오기
		String name = mservice.getName(myid);
		mrdto.setName(name); //DB에 이름 저장
		
		//DB에 추가
		service.insertReview(mrdto);
		
		//내용보기로 리다이렉트
		return "redirect:/movie/detail?num="+mrdto.getNum();
	}
	
	//관람평 수정폼
	@GetMapping("/movie/rvupdateform")
	public ModelAndView reviewupdateform(String num, String idx) {
		
		ModelAndView mview = new ModelAndView();
		
		MovieDto dto = service.getData(num);
		mview.addObject("dto", dto);
		
		//num에 해당하는 관람평
		List<MovieReviewDto> rvlist = service.getReviewList(num);
		mview.addObject("rvcount", rvlist.size()); //관람평 개수
		mview.addObject("rvlist", rvlist); //관람평 리스트
		
		MovieReviewDto rvdto = service.getReviewData(idx);
		mview.addObject("rvdto", rvdto);
		
		mview.setViewName("/movie/moviereviewupdate");
		
		return mview;
	}
	//관람평 수정(수정폼에서 수정)
	@PostMapping("/movie/rvupdate")
	public String reviewupdate(@ModelAttribute MovieReviewDto mrdto,HttpSession session) {
		
		//DB수정
		service.updateReview(mrdto);
		
		//내용보기로 리다이렉트
		return "redirect:/movie/detail?num="+mrdto.getNum()+"#nav-tab";
	}
	
	//수정모달
	@GetMapping("/movie/rvup")
	@ResponseBody
	public MovieReviewDto rvupdatemodal(String num, String idx) {
		MovieReviewDto rvudto = service.getReviewData(idx);
		return rvudto;
	}
	//관람평수정완료(모달)
	@PostMapping("/movie/rvupdatem")
	@ResponseBody
	public void rvupdatem(MovieReviewDto mrdto,HttpSession session) {
		
		service.updateReview(mrdto);
	}
	
	//관람평 삭제
	@GetMapping("/movie/rvdelete")
	@ResponseBody
	public void deletereview(String idx, HttpSession session) {
			
		service.deleteReview(idx);
	}
	
	//관람평 like 증가
	@GetMapping("/movie/rlikes")
	@ResponseBody
	public Map<String, Integer> rlikes(String idx) {
		
		//영화 like 증가sql
		service.rvlikesUpdate(idx);
		int likes = service.getReviewData(idx).getLikes();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
	//관람평 like 감소
	@GetMapping("/movie/rnolikes")
	@ResponseBody
	public Map<String, Integer> rnolikes(String idx) {
		
		//영화 like 증가sql
		service.rvlikesCancel(idx);
		int likes = service.getReviewData(idx).getLikes();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
}
