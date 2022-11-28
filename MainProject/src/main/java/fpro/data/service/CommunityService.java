package fpro.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.BoardAnswerDto;
import fpro.data.dto.CommunityDto;
import fpro.data.mapper.CommunityMapperInter;

@Service
public class CommunityService implements CommunityServiceInter {
	@Autowired
	CommunityMapperInter inter;

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return inter.getTotalCount(map);

	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return inter.getMaxNum();
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer>map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		inter.updateRestep(map);
	}

	@Override
	public void insertBoard(CommunityDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum();	//0:새글.. 1보다큰값:답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		String category=dto.getCategory();
		
		if(num==0) {	//새글
			regroup=getMaxNum()+1;	//num의 최대값+1
			restep=0;
			relevel=0;
			
		}else {
			//같은 그룹중에서 전달받은 restep보다 큰 글들은 모두 +1
			updateRestep(regroup, restep);
			//전달받은 step과 level은 모두 ++1
			restep++;
			relevel++;
			category=inter.getMaxCategory(dto.getNum());
			
		}
		
		
		
		//바뀐값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);

		
		dto.setCategory(category);
		
		
		//insert
		inter.insertBoard(dto);
	}

	@Override
	public List<CommunityDto> getList(String searchcolumn, String searchword, int start, int perPage) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perPage", perPage);
		return inter.getList(map);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		inter.updateReadCount(num);
	}

	@Override
	public CommunityDto getData(int num) {
		// TODO Auto-generated method stub
		return inter.getData(num);
	}

	@Override
	public void updateBoard(CommunityDto dto) {
		// TODO Auto-generated method stub
		inter.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub
		inter.deleteBoard(num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		inter.likesUpdate(num);
	}

	@Override
	public int getTotalCountMovieTalk(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return inter.getTotalCountMovieTalk(map);
	}

	@Override
	public int getTotalCountMovieReport(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return inter.getTotalCountMovieReport(map);
	}

	@Override
	public List<CommunityDto> getListMovieTalk(String searchcolumn, String searchword, int start, int perPage) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perPage", perPage);
		
		return inter.getListMovieTalk(map);
		
		
	}

	@Override
	public List<CommunityDto> getListMovieReport(String searchcolumn, String searchword, int start, int perPage) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perPage", perPage);
		
		return inter.getListMovieReport(map);
	}

	

	@Override
	public void likesMinusUpdate(int num) {
		// TODO Auto-generated method stub
		inter.likesMinusUpdate(num);
	}

	@Override
	public List<CommunityDto> getListBest(String searchcolumn, String searchword, int start, int perPage) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perPage", perPage);
		
		return inter.getListBest(map);
	}

	@Override
	public String getMaxCategory(int num) {
		// TODO Auto-generated method stub
		return inter.getMaxCategory(num);
	}

	@Override
	public void insertAnswer(BoardAnswerDto bdto) {
		// TODO Auto-generated method stub
		/*int idx=bdto.getIdx(); //0:새글.. 1보다큰값:답글
		int regroup=bdto.getAns_regroup();
		int restep=bdto.getAns_restep();
		int relevel=bdto.getAns_relevel();
		
		if(idx==0) {	//새글
			regroup=getMaxIdx()+1;	//num의 최대값+1
			restep=0;
			relevel=0;
			
		}else {
			//같은 그룹중에서 전달받은 restep보다 큰 글들은 모두 +1
			updateAnRestep(regroup, restep);
			//전달받은 step과 level은 모두 ++1
			restep++;
			relevel++;
		}
			
		
		//바뀐값들을 다시 dto에 담는다
		bdto.setAns_regroup(regroup);
		bdto.setAns_restep(restep);
		bdto.setAns_relevel(relevel);*/

		
		inter.insertAnswer(bdto);
	}

	@Override
	public int getMaxIdx() {
		// TODO Auto-generated method stub
		return inter.getMaxIdx();
	}

	@Override
	public void updateAnRestep(int ans_regroup, int ans_restep) {
		// TODO Auto-generated method stub
		Map<String, Integer>map=new HashMap<>();
		map.put("ans_regroup", ans_regroup);
		map.put("ans_restep", ans_restep);
		inter.updateAnRestep(map);
	}


	@Override
	public List<BoardAnswerDto> getAlist(int num) {
		// TODO Auto-generated method stub
		return inter.getAlist(num);
	}

	@Override
	public void deleteAnswer(int idx) {
		// TODO Auto-generated method stub
		inter.deleteAnswer(idx);
	}

	@Override
	public BoardAnswerDto getAnsData(int idx) {
		// TODO Auto-generated method stub
		return inter.getAnsData(idx);
	}

	@Override
	public void updateAnswer(BoardAnswerDto bdto) {
		// TODO Auto-generated method stub
		inter.updateAnswer(bdto);
	}

	
	
	

	

	

}
