package fpro.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fpro.data.dto.CommunityDto;
import fpro.data.dto.MemberDto;
import fpro.data.dto.MessageDto;
import fpro.data.service.MessageService;


@Controller
public class MessageController {
	@Autowired
	MessageService ser;
	
	
	@GetMapping("/message")
	public ModelAndView chat(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String id=(String)session.getAttribute("myid");
		
		List<MemberDto>userlist=ser.finduserlist();
		List<MessageDto> mlist=ser.MessageList();
		
		int scount=ser.countSendView(id);
		int count=ser.countMessageView(id);
		
		mv.addObject("scount", scount);
		mv.addObject("count", count);
		mv.addObject("userlist", userlist);
		mv.addObject("mlist", mlist);

		
		mv.setViewName("/community/message");
		return mv;
	}
	

	
	@PostMapping("/insertmessage")
	@ResponseBody
	public void insermessage(MessageDto dto) {
		ser.insertMessage(dto);
	}
	
	
	@GetMapping("/userlist")
	@ResponseBody
	public List<MemberDto> userlist() {
		List<MemberDto>userlist=ser.finduserlist();
		return userlist;
	}
	
	@GetMapping("/replyid")
	@ResponseBody
	public MessageDto replyid(int ms_num) {
		MessageDto replyid=ser.replyMsg(ms_num);
		return replyid;
	}
	
}
