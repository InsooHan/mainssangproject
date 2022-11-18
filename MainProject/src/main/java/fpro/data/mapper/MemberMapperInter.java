package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	
	public void insertMember(MemberDto dto);
	public String getName(String id);
	public List<MemberDto> getAllMembers();
	public MemberDto getDataById(String id);

}
