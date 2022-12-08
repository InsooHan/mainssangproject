package fpro.data.service;

import java.util.List;
import java.util.Map;

import fpro.data.dto.BoardAnswerDto;
import fpro.data.dto.CommunityDto;

public interface CommunityServiceInter {
	public int getTotalCount(String searchcolumn,String searchword);	//전체리스트 글개수
	public int getTotalCountMovieTalk(String searchcolumn,String searchword);	//영화수다 글개수
	public int getTotalCountMovieReport(String searchcolumn,String searchword);	//영화정보 글개수
	public int getTotalCountBest(String searchcolumn,String searchword);	//인기글 글개수
	public int getMaxNum();	//community 원글 구하기
	public String getMaxCategory(int num);	//community 원글 카테고리 구하기
	public void updateRestep(int regroup,int restep);	
	public void updateAnRestep(int ans_regroup,int ans_restep);	
	public void insertBoard(CommunityDto dto);
	public List<CommunityDto> getList(String searchcolumn,String searchword,int start,int perPage);	//전체리스트
	public List<CommunityDto> getListMovieTalk(String searchcolumn,String searchword,int start,int perPage); //영화수다 리스트
	public List<CommunityDto> getListMovieReport(String searchcolumn,String searchword,int start,int perPage);	//영화정보 리스트
	public List<CommunityDto> getListBest();	//인기글 리스트
	public void updateReadCount(int num);	//조회수
	public CommunityDto getData(int num);	//하나의 데이터값 불러오기(detail)
	public void updateBoard(CommunityDto dto);	//글 수정
	public void deleteBoard(int num);	//글 삭제
	public void likesUpdate(int num);
	public void insertAnswer(BoardAnswerDto bdto);	//댓글인서트
	public List<BoardAnswerDto> getAlist(int num);	//댓글리스트
	public void deleteAnswer(int idx);	//댓글삭제
	public BoardAnswerDto getAnsData(int idx);	//하나의 댓글 데이터값 불러오기
	public void updateAnswer(BoardAnswerDto bdto);	//댓글수정
}
