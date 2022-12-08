package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id);
	public int getIdPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public MemberDto getDataByNum(String num);
	public void updatePhoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
	public void upPoint(Map<String, Object> map);
	public void downPoint(Map<String, Object> map);
}
