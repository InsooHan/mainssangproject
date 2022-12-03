package fpro.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.DemovieDto;
import fpro.data.dto.SangDto;
import fpro.data.mapper.DemovieMapperInter;

@Service
public class DemovieService implements DemovieServiceInter {
	
	@Autowired
	DemovieMapperInter mapperInter;

	@Override
	public List<DemovieDto> getSomeDatas(String theater, String moviename) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("theater", theater);
		map.put("moviename", moviename);
		
		return mapperInter.getSomeDatas(map);
	}

	@Override
	public SangDto getSangData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getSangData(num);
	}

	@Override
	public DemovieDto getbookedData(String cartnum) {
		// TODO Auto-generated method stub
		return mapperInter.getbookedData(cartnum);
	}

	@Override
	public void updateSeat(DemovieDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateSeat(dto);
	}
	
	
}
