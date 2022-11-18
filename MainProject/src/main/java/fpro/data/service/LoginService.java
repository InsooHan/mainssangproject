package fpro.data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.mapper.LoginMapperInter;

@Service
public class LoginService implements LoginServiceInter {

	@Autowired
	LoginMapperInter mapperInter;
	
	//아이디로 이름 가져오기
	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getName(id);
	}

	//아이디/비밀번호 확인 후 숫자 0이나 1 반환
	@Override
	public int getIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		return mapperInter.getIdPassCheck(map);
	}

}
