package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.AdminDto;

@Mapper
public interface AdminMapperInter {

	public int getTotalCount(Map<String, String> map);
	public void insertBoard(AdminDto dto);
	public List<AdminDto> getList(Map<String, Object> map);
	public void updateReadcount(int num);
	public AdminDto getData(int num);
}
