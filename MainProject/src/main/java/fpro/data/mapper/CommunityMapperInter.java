package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.BoardAnswerDto;
import fpro.data.dto.CommunityDto;

@Mapper
public interface CommunityMapperInter {
	public int getTotalCount(Map<String, String> map);	//서치워드, 서치컬럼
	public int getTotalCountMovieTalk(Map<String, String> map);
	public int getTotalCountMovieReport(Map<String, String> map);
	public int getTotalCountBest(Map<String, String> map);
	public int getMaxNum();
	public String getMaxCategory(int num);
	public void updateRestep(Map<String, Integer> map);
	public void updateAnRestep(Map<String, Integer> map);
	public void insertBoard(CommunityDto dto);
	public List<CommunityDto> getList(Map<String, Object> map);	//서치단어, perPage, start
	public List<CommunityDto> getListMovieTalk(Map<String, Object> map);	//카테고리-영화수다 리스트
	public List<CommunityDto> getListMovieReport(Map<String, Object> map);	//카테고리-영화정보 리스트
	public List<CommunityDto> getListBest();	//카테고리-베스트 리스트
	public void updateReadCount(int num);
	public CommunityDto getData(int num);
	public void updateBoard(CommunityDto dto);
	public void deleteBoard(int num);
	public void likesUpdate(int num);
	public void insertAnswer(BoardAnswerDto bdto);
	public List<BoardAnswerDto> getAlist(int num);
	public void deleteAnswer(int idx);
	public BoardAnswerDto getAnsData(int idx);
	public void updateAnswer(BoardAnswerDto bdto);
}
