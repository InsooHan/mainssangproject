package fpro.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MemberDto;
import fpro.data.dto.MessageDto;


@Mapper
public interface MessageMapperInter {
	public int countMessageView(String user_id);
	public int countSendView(String sender_name);
	public void insertMessage(MessageDto dto);
	public List<MemberDto> finduserlist();
	public List<MessageDto> MessageList();
	public MessageDto replyMsg(int ms_num);
}
