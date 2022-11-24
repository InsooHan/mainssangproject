package fpro.data.service;

import java.util.List;
import java.util.Map;

import fpro.data.dto.BoardAnswerDto;
import fpro.data.dto.CommunityDto;

public interface CommunityServiceInter {
	public int getTotalCount(String searchcolumn,String searchword);	//서치워드, 서치컬럼
	public int getTotalCountMovieTalk(String searchcolumn,String searchword);
	public int getTotalCountMovieReport(String searchcolumn,String searchword);
	public int getMaxNum();
	public int getMaxIdx();
	public String getMaxCategory(int num);
	public void updateRestep(int regroup,int restep);
	public void updateAnRestep(int ans_regroup,int ans_restep);
	public void insertBoard(CommunityDto dto);
	public List<CommunityDto> getList(String searchcolumn,String searchword,int start,int perPage);	//서치단어, perPage, start
	public List<CommunityDto> getListMovieTalk(String searchcolumn,String searchword,int start,int perPage);
	public List<CommunityDto> getListMovieReport(String searchcolumn,String searchword,int start,int perPage);
	public List<CommunityDto> getListBest(String searchcolumn,String searchword,int start,int perPage);	//카테고리-베스트 리스트
	public void updateReadCount(int num);
	public CommunityDto getData(int num);
	public void updateBoard(CommunityDto dto);
	public void deleteBoard(int num);
	public void likesUpdate(int num);
	public void likesMinusUpdate(int num);
	public void insertAnswer(BoardAnswerDto bdto);
	public List<BoardAnswerDto> getAlist();
}
