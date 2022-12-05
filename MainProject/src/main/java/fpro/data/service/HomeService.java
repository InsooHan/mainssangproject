package fpro.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.CommunityDto;
import fpro.data.dto.EventDto;
import fpro.data.mapper.HomeMapperInter;

@Service
public class HomeService implements HomeServiceInter {

	@Autowired
	HomeMapperInter mapperInter;
	
	@Override
	public List<CommunityDto> getCommunityToMain() {
		// TODO Auto-generated method stub
		return mapperInter.getCommunityToMain();
	}

	@Override
	public List<EventDto> getEventToMain() {
		// TODO Auto-generated method stub
		return mapperInter.getEventToMain();
	}

}
