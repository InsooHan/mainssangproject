package fpro.data.service;

import java.util.List;

import fpro.data.dto.MemberDto;

public interface MemberServiceInter {
	
	public void insertMember(MemberDto dto);
	public String getName(String id);
	public List<MemberDto> getAllMembers();
	public MemberDto getDataById(String id);
	
}
