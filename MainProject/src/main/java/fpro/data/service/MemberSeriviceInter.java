package fpro.data.service;

import java.util.List;
import java.util.Map;

import fpro.data.dto.MemberDto;

public interface MemberSeriviceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id);
	public int getIdPassCheck(String id,String pass);
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public MemberDto getDataByNum(String num);
	public void updatePhoto(String num,String photo);
	public void updateMember(MemberDto dto);
}
