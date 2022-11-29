package fpro.data.service;

import java.util.List;

import fpro.data.dto.MovieDto;

public interface MovieServiceInter {
	
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
