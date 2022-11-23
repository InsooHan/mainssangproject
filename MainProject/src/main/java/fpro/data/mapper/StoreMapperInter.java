package fpro.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.StoreDto;

@Mapper
public interface StoreMapperInter {
	
	//store 추가
	public void insertStore(StoreDto dto);
	//store 전체 갯수
	public int getTotalCount();
	//store 전체 목록 조회
	public List<StoreDto> getAllStores();
	//메가티겟 목록 조회
	public List<StoreDto> getMegaticket();
	//store_num에 맞는 데이터 조회
	public StoreDto getStore(String store_num);
}
