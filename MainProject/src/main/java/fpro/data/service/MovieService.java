package fpro.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.MovieDto;
import fpro.data.dto.MovieReviewDto;
import fpro.data.mapper.MovieMapperInter;

@Service
public class MovieService implements MovieServiceInter {
	
	@Autowired
	MovieMapperInter mapperInter;

	@Override
	public List<MovieDto> getSomeDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getSomeDatas();
	}

	//전체리스트
	@Override
	public List<MovieDto> getAllDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getAllDatas();
	}
	//검색리스트
	@Override
	public List<MovieDto> getSearch(String ibxMovieNmSearch) {
		// TODO Auto-generated method stub
		return mapperInter.getSearch(ibxMovieNmSearch);
	}

	//영화 예매율순
	@Override
	public List<MovieDto> getticketDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getticketDatas();
	}
	//영화 누적관객순
	@Override
	public List<MovieDto> getaccDatas() {
		// TODO Auto-generated method stub
		return mapperInter.getaccDatas();
	}
	//최신영화 전체개수
	@Override
	public int getNewTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getNewTotalCount();
	}
	//상영예정 전체개수
	@Override
	public int getCommingTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getCommingTotalCount();
	}
	//상영예정 가나다순
	@Override
	public List<MovieDto> getDatasAsc() {
		// TODO Auto-generated method stub
		return mapperInter.getDatasAsc();
	}
	//detail
	@Override
	public MovieDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}
	//영화 likes증가
	@Override
	public void mlikesUpdate(String num) {
		// TODO Auto-generated method stub
		mapperInter.mlikesUpdate(num);
	}
	//영화 likes감소
	@Override
	public void mlikesCancel(String num) {
		// TODO Auto-generated method stub
		mapperInter.mlikesCancel(num);
	}

	//관람평 등록
	@Override
	public void insertReview(MovieReviewDto mrdto) {
		// TODO Auto-generated method stub
		mapperInter.insertReview(mrdto);
	}
	//관람평 조회(최신순)
	@Override
	public List<MovieReviewDto> getReviewList(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getReviewList(num);
	}
	//관람평 조회(공감순)
	@Override
	public List<MovieReviewDto> getReviewListChu(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getReviewListChu(num);
	}
	//관람평 조회(평점순)
	@Override
	public List<MovieReviewDto> getReviewListGrade(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getReviewListGrade(num);
	}
	//관람평 Data
	@Override
	public MovieReviewDto getReviewData(String idx) {
		// TODO Auto-generated method stub
		return mapperInter.getReviewData(idx);
	}
	//관람평 like증가
	@Override
	public void rvlikesUpdate(String idx) {
		// TODO Auto-generated method stub
		mapperInter.rvlikesUpdate(idx);
	}
	//관람평 like감소
	@Override
	public void rvlikesCancel(String idx) {
		// TODO Auto-generated method stub
		mapperInter.rvlikesCancel(idx);
	}
	//관란평 수정
	@Override
	public void updateReview(MovieReviewDto mrdto) {
		// TODO Auto-generated method stub
		mapperInter.updateReview(mrdto);
	}
	//관람평 삭제
	@Override
	public void deleteReview(String idx) {
		// TODO Auto-generated method stub
		mapperInter.deleteReview(idx);
	}

}
