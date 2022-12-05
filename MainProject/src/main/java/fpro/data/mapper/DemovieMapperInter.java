package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.DemovieDto;
import fpro.data.dto.SangDto;

@Mapper
public interface DemovieMapperInter {
	public List<DemovieDto> getSomeDatas(Map<String, String> map);
	public SangDto getSangData(String num);
	public void updateSeat(DemovieDto dto);
	public DemovieDto getbookedData(String cartnum);
}
