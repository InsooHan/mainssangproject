package fpro.data.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.AdminDto;
import fpro.data.mapper.AdminMapperInter;

@Service
public class AdminService implements AdminServiceInter {

	@Autowired
	AdminMapperInter mapperInter;


	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String , String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapperInter.getTotalCount(map);
	}




	@Override
	public List<AdminDto> getList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getList(map);
	}


	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadcount(num);
	}


	@Override
	public AdminDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}




	@Override
	public void insertAdmin(AdminDto dto) {
		// TODO Auto-generated method stub
		
	
		
		mapperInter.insertAdmin(dto);
	}




	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}




	@Override
	public void updateAdmin(AdminDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateAdmin(dto);
	}




	@Override
	public void deleteAdmin(int num) {
		// TODO Auto-generated method stub
		mapperInter.deleteAdmin(num);
	}






	

}
