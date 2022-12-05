package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.CommunityDto;
import fpro.data.dto.EventDto;

@Mapper
public interface HomeMapperInter {

	//커뮤니티 게시물 리스트 가져오기
	public List<CommunityDto> getCommunityToMain();
	//이벤트 게시물 가져오기
	public List<EventDto> getEventToMain();
}
