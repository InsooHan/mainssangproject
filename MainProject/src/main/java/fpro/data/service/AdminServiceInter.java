package fpro.data.service;

import java.util.List;

import fpro.data.dto.AdminDto;

public interface AdminServiceInter {

	public int getTotalCount(String searchcolumn,String searchword);
	public void insertBoard(AdminDto dto);
	public List<AdminDto> getList(String searchcolumn,String searchword, int start,int perpage);  
	public void updateReadcount(int num);
	public AdminDto getData(int num);
}
