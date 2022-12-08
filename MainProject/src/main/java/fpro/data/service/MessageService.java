package fpro.data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.MemberDto;
import fpro.data.dto.MessageDto;
import fpro.data.mapper.MessageMapperInter;

@Service
public class MessageService implements MessageServiceInter {
	@Autowired
	MessageMapperInter inter;

	@Override
	public int countMessageView(String user_id) {
		// TODO Auto-generated method stub
		return inter.countMessageView(user_id);
	}

	@Override
	public void insertMessage(MessageDto dto) {
		// TODO Auto-generated method stub
		dto.setGubun(0);
		dto.setRead_yn(0);
		inter.insertMessage(dto);
	}


	@Override
	public List<MemberDto> finduserlist() {
		// TODO Auto-generated method stub
		return inter.finduserlist();
	}


	@Override
	public List<MessageDto> MessageList() {
		// TODO Auto-generated method stub
		return inter.MessageList();
	}



	@Override
	public MessageDto replyMsg(int ms_num) {
		// TODO Auto-generated method stub
		return inter.replyMsg(ms_num);
	}

	@Override
	public int countSendView(String sender_name) {
		// TODO Auto-generated method stub
		return inter.countSendView(sender_name);
	}

	


	
	
	
}
