package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.EventDto;

@Mapper
public interface EventMapperInter {

	public int getTotalCount(Map<String, String> map);
	public void insertEvent(EventDto dto);
	public List<EventDto> getListAll(Map<String, Object> map);
	public EventDto getData(int num);
	public int getMaxNum();
	public void updateEvent(EventDto dto);
	public void deleteEvent(int num);
	
	public int getMegapickCount(Map<String, String> map);
	public int getMovieCount(Map<String, String> map);
	public int getTheaterCount(Map<String, String> map);
	public int getDiscountCount(Map<String, String> map);
	public int getPreviewCount(Map<String, String> map);
	
	public List<EventDto> getListMegapick(Map<String, Object> map);
	public List<EventDto> getListMovie(Map<String, Object> map);
	public List<EventDto> getListTheater(Map<String, Object> map);
	public List<EventDto> getListDiscount(Map<String, Object> map);
	public List<EventDto> getListPreview(Map<String, Object> map);
	
}
