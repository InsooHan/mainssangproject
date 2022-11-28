package fpro.data.service;

import java.util.List;

import fpro.data.dto.MemberDto;

public interface MemberServieInter {

	void insertMember(MemberDto dto);

	List<MemberDto> getAllMembers();

	int getSearchId(String id);

	String getName(String id);

	int getIdPassCheck(String id, String pass);

	MemberDto getDataById(String id);

	void deleteMember(String num);

	MemberDto getDataByNum(String num);

	void updatePhoto(String num, String photo);

	void updateMember(MemberDto dto);

}
