package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.DemovieDto;

@Mapper
public interface DemovieMapperInter {
	public List<DemovieDto> getSomeDatas(Map<String, String> map);
}
