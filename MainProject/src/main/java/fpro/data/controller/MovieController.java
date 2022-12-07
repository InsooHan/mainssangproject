package fpro.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView moviedetail(String num, String idx, HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		MovieDto dto = service.getData(num);
		mview.addObject("dto", dto);
		
		MovieReviewDto rvdto = service.getReviewData(idx);
		mview.addObject("rvdto", rvdto);
		
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

	//추천수 증가
	@GetMapping("/movie/likes")
	@ResponseBody
	public Map<String, Integer> likes(String num) {
		
		//추천수 증가sql
		service.mlikesUpdate(num);
		int likes = service.getData(num).getLikes();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
	//추천수 감소
	@GetMapping("/movie/nolikes")
	@ResponseBody
	public Map<String, Integer> nolikes(String num) {
		
		//추천수 증가sql
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
	@ResponseBody
	public String reviewupdateform(String idx, Model model) {
		
		MovieReviewDto rvdto = service.getReviewData(idx);
		model.addAttribute("rvdto", rvdto);
		
		return "/movie/detail";
	}
	
	//관람평 수정
	@PostMapping("/movie/rvupdate")
	public String reviewupdate(@ModelAttribute MovieReviewDto mrdto,HttpSession session) {
		
		//DB수정
		service.updateReview(mrdto);
		
		//내용보기로 리다이렉트
		return "redirect:/movie/detail?num="+mrdto.getNum();
	}
	
	//관람평 삭제
	@GetMapping("/movie/rvdelete")
	@ResponseBody
	public void deletereview(String idx, HttpSession session) {
			
		service.deleteReview(idx);
			
	}
}
