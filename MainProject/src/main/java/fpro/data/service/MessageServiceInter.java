package fpro.data.service;

import java.util.List;

import fpro.data.dto.MemberDto;
import fpro.data.dto.MessageDto;

public interface MessageServiceInter {
	public int countMessageView(String user_id);
	public int countSendView(String sender_name);
	public void insertMessage(MessageDto dto);
	public List<MemberDto> finduserlist();
	public List<MessageDto> MessageList();
	public MessageDto replyMsg(int ms_num);
}
