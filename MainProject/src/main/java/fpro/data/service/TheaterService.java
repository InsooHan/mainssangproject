package fpro.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.TheaterDto;
import fpro.data.mapper.TheaterMapperInter;

@Service
public class TheaterService implements TheaterServiceInter {
	
	@Autowired
	TheaterMapperInter mapperInter;

	@Override
	public List<TheaterDto> getSomeDatas(String city) {
		// TODO Auto-generated method stub
		return mapperInter.getSomeDatas(city);
	}

}
