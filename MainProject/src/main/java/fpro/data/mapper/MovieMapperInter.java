package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.MovieDto;

@Mapper
public interface MovieMapperInter {
	public List<MovieDto> getSomeDatas();
}
