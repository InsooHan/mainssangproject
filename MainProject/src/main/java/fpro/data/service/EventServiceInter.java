package fpro.data.service;

import java.util.List;

import fpro.data.dto.EventDto;

public interface EventServiceInter {

	public int getTotalCount(String searchcolumn,String searchword);
	public void insertEvent(EventDto dto);
	public List<EventDto> getListAll(String searchcolumn,String searchword, int start,int perpage);
	public EventDto getData(int num);
	public int getMaxNum();
	public void updateEvent(EventDto dto);
	public void deleteEvent(int num);
	
	public int getMegapickCount(String searchcolumn,String searchword);
	public int getMovieCount(String searchcolumn,String searchword);
	public int getTheaterCount(String searchcolumn,String searchword);
	public int getDiscountCount(String searchcolumn,String searchword);
	public int getPreviewCount(String searchcolumn,String searchword);
	
	public List<EventDto> getListMegapick(String searchcolumn,String searchword, int start,int perpage);
	public List<EventDto> getListMovie(String searchcolumn,String searchword, int start,int perpage);
	public List<EventDto> getListTheater(String searchcolumn,String searchword, int start,int perpage);
	public List<EventDto> getListDiscount(String searchcolumn,String searchword, int start,int perpage);
	public List<EventDto> getListPreview(String searchcolumn,String searchword, int start,int perpage);
}
