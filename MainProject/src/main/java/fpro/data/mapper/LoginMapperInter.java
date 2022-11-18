package fpro.data.mapper;

import java.util.Map;

public interface LoginMapperInter {

	public String getName(String id); //아이디에 해당하는 이름 가져오기
	public int getIdPassCheck(Map<String, String> map); //아이디, 비밀번호 일치하는 데이터 찾기, 보내야 하는 parameter가 2개(아이디, 패스워드)니까 map으로 묶어야 한다. 
}
