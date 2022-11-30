package fpro.data.service;

import java.util.List;

import fpro.data.dto.AdminDto;

public interface AdminServiceInter {

	public int getTotalCount(String searchcolumn,String searchword);
	public int getSystemCount(String searchcolumn,String searchword);
	public int getTheaterCount(String searchcolumn,String searchword);
	public int getOtherCount(String searchcolumn,String searchword);
	public void insertAdmin(AdminDto dto);
	public List<AdminDto> getListAll(String searchcolumn,String searchword, int start,int perpage); 
	public List<AdminDto> getListSystem(String searchcolumn,String searchword, int start,int perpage); 
	public List<AdminDto> getListTheater(String searchcolumn,String searchword, int start,int perpage); 
	public List<AdminDto> getListOther(String searchcolumn,String searchword, int start,int perpage); 
	public void updateReadcount(int num);
	public AdminDto getData(int num);
	public int getMaxNum();
	public void updateAdmin(AdminDto dto);
	public void deleteAdmin(int num);
}
