package fpro.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.EventDto;
import fpro.data.mapper.EventMapperInter;

@Service
public class EventService implements EventServiceInter {

	@Autowired
	EventMapperInter mapperInter;

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapperInter.getTotalCount(map);
	}

	@Override
	public void insertEvent(EventDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertEvent(dto);
		
	}

	@Override
	public List<EventDto> getListAll(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListAll(map);
	}

	@Override
	public EventDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public void updateEvent(EventDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateEvent(dto);
	}

	@Override
	public void deleteEvent(int num) {
		// TODO Auto-generated method stub
		mapperInter.deleteEvent(num);
	}

	@Override
	public int getMegapickCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getMegapickCount(map);
	}

	@Override
	public int getMovieCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getMovieCount(map);
	}

	@Override
	public int getTheaterCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getTheaterCount(map);
	}

	@Override
	public int getDiscountCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getDiscountCount(map);
	}

	@Override
	public int getPreviewCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getPreviewCount(map);
	}

	@Override
	public List<EventDto> getListMegapick(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListMegapick(map);
	}

	@Override
	public List<EventDto> getListMovie(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListMovie(map);
	}

	@Override
	public List<EventDto> getListTheater(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListTheater(map);
	}

	@Override
	public List<EventDto> getListDiscount(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListDiscount(map);
	}

	@Override
	public List<EventDto> getListPreview(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getListPreview(map);
	}
	

}
