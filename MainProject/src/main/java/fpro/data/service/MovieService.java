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

}
