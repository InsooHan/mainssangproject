package fpro.data.service;

import java.util.List;

import fpro.data.dto.StoreDto;

public interface StoreServiceInter {

	//store 추가
	public void insertStore(StoreDto dto);
	//store 전체 갯수
	public int getTotalCount();
	//store 전체 목록 조회
	public List<StoreDto> getAllStores();
}
