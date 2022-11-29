package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MovieDto;

@Mapper
public interface MovieMapperInter {
	
	public List<MovieDto> getSomeDatas();
	//전체리스트
	public List<MovieDto> getAllDatas();
	//최신영화 전체개수
	public int getNewTotalCount();
	//상영예정 전체개수
	public int getCommingTotalCount();
	//상영예정 가나다순
	public List<MovieDto> getDatasAsc();
}
