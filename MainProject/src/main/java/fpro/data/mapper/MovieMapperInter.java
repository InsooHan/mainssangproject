package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MovieDto;
import fpro.data.dto.MovieReviewDto;

@Mapper
public interface MovieMapperInter {
	
	public List<MovieDto> getSomeDatas();
	//전체리스트
	public List<MovieDto> getAllDatas();
	//최신영화 전체개수
	public int getNewTotalCount();
	//상영예정 전체개수
	public int getCommingTotalCount();
	//상영예정 가나다순
	public List<MovieDto> getDatasAsc();
	//detail페이지에 필요한 데이터
	public MovieDto getData(String num);
	//영화 likes 증가
	public void mlikesUpdate(String num);
	//영화 likes 감소
	public void mlikesCancel(String num);
	
	//관람평등록
	public void insertReview(MovieReviewDto mrdto);
	//관람평 목록(최신순)
	public List<MovieReviewDto> getReviewList(String num);
	//관람평 목록(공감순)
	public List<MovieReviewDto> getReviewListChu(String num);
	//관람평 목록(최신순)
	public List<MovieReviewDto> getReviewListGrade(String num);
	//관람평 데이터
	public MovieReviewDto getReviewData(String idx);
	//관람평 수정
	public void updateReview(MovieReviewDto mrdto);
	//관람평 삭제
	public void deleteReview(String idx);
}
