package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.AdminDto;

@Mapper
public interface AdminMapperInter {

	public int getTotalCount(Map<String, String> map);
	public int getSystemCount(Map<String, String> map);
	public int getTheaterCount(Map<String, String> map);
	public int getOtherCount(Map<String, String> map);
	public void insertAdmin(AdminDto dto);
	public List<AdminDto> getList(Map<String, Object> map);
	public void updateReadcount(int num);
	public AdminDto getData(int num);
	public int getMaxNum();
	public void updateAdmin(AdminDto dto);
	public void deleteAdmin(int num);
}
