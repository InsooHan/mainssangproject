package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.TheaterDto;

@Mapper
public interface TheaterMapperInter {
	public List<TheaterDto> getSomeDatas(String city);
}
