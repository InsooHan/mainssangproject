package fpro.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.StoreDto;
import fpro.data.mapper.StoreMapperInter;

@Service
public class StoreService implements StoreServiceInter {

	@Autowired
	StoreMapperInter mapperInter;
	
	@Override
	public void insertStore(StoreDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertStore(dto);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public List<StoreDto> getAllStores() {
		// TODO Auto-generated method stub
		return mapperInter.getAllStores();
	}

	@Override
	public List<StoreDto> getMegaticket() {
		// TODO Auto-generated method stub
		return mapperInter.getMegaticket();
	}

	@Override
	public StoreDto getStore(String store_num) {
		// TODO Auto-generated method stub
		return mapperInter.getStore(store_num);
	}

}
