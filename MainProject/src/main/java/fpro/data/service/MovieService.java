package fpro.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.MovieDto;
import fpro.data.mapper.MovieMapperInter;

@Service
public class MovieService implements MovieServiceInter {
	
	@Autowired
	MovieMapperInter mapperInter;

	@Override
	public List<MovieDto> getSomeDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getSomeDatas();
	}
	
	//전체리스트
	@Override
	public List<MovieDto> getAllDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getAllDatas();
	}
	//최신영화 전체개수
	@Override
	public int getNewTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getNewTotalCount();
	}
	//상영예정 전체개수
	@Override
	public int getCommingTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getCommingTotalCount();
	}
	//상영예정 가나다순
	@Override
	public List<MovieDto> getDatasAsc() {
		// TODO Auto-generated method stub
		return mapperInter.getDatasAsc();
	}

}
