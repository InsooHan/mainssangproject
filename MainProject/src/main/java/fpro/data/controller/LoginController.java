package fpro.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpro.data.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session, Model model) {
			
		//로그인 상태인지 아닌지 -> 상태에 따라 나오는 화면이 달라야 하니까
		String loginok = (String)session.getAttribute("loginok"); //session에서 loginok를 가져와서 loginok라고 하겠다.
		
		//폼의 id 얻어오기
		String myid=(String)session.getAttribute("myid"); //세션에 저장한 id를 myid로 저장해놨었는데 그걸 myid로 가져온다.
		
		//cbsave값 가져오기
		String saveok = (String)session.getAttribute("saveok");
		
		
		if(loginok==null) {
			return "/login/loginform";
		}else {
			
			//로그인 중에는 로그인한 계정의 이름을 저장
			String name = service.getName(myid);
			
			//request에 저장하기(model)
			model.addAttribute("name", name);
			
			return "/login/logoutform";
		}
		
	}
	
	//로그인폼에서 로그인하기
	@PostMapping("/login/loginprocess")
	public String loginProc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session) {
		
		//id, pass 일치하는게 있는지 없는지
		int check = service.getIdPassCheck(id, pass);
		
		//check==1인 경우(db에 id, pass 일치 데이터가 있다는 얘기)
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8); //8시간 저장
						
			session.setAttribute("myid", id); //가져온 id를 myid로 저장 
			session.setAttribute("loginok", "yes"); //loginok를 yes로 저장
			session.setAttribute("saveok", cbsave); //cbsave 값을 saveok로 저장, 체크 되어 있으면 'on', 체크 없으면 null
			
			return "redirect:main"; //check==1인 경우에만 main으로 보내야 하니까..!(0이면 로그인 fail)
			
		}else {
			
			return "/login/passfail";
		}
		
	}
	
	 //로그아웃
    @GetMapping("/login/logoutprocess")
	public String logoutProc(HttpSession session) {
		session.removeAttribute("loginok");
		return "redirect:/";
	}
}
