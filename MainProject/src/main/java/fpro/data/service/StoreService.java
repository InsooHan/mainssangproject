package fpro.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.dto.CartDto;
import fpro.data.dto.MemberDto;
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

	@Override
	public String getNumById(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getNumById(id);
	}

	@Override
	public void insertCart(CartDto cdto) {
		// TODO Auto-generated method stub
		mapperInter.insertCart(cdto);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public CartDto getCart(String cart_idx) {
		// TODO Auto-generated method stub
		return mapperInter.getCart(cart_idx);
	}

	@Override
	public List<CartDto> getCartById(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getCartById(id);
	}

	@Override
	public void deleteCart(String cart_idx) {
		// TODO Auto-generated method stub
		mapperInter.deleteCart(cart_idx);
	}

	@Override
	public void updateCartCnt(int cart_cnt, String cart_idx) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		map.put("cart_idx", cart_idx);
		map.put("cart_cnt", cart_cnt);
		
		mapperInter.updateCartCnt(map);
	
	}

	@Override
	public int checkCart(String store_num, String member_num) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		
		map.put("store_num", store_num);
		map.put("member_num", member_num);
		
		return mapperInter.checkCart(map);
	}

	@Override
	public void plusCartCnt(int cart_cnt, String store_num) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("cart_cnt", cart_cnt);
		map.put("store_num", store_num);
		
		mapperInter.plusCartCnt(map);
	}

	@Override
	public void updateStore(StoreDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateStore(dto);
	}

	@Override
	public void deleteStore(String store_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteStore(store_num);
	}

	@Override
	public void deleteCartByMem(String member_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteCartByMem(member_num);
	}

	@Override
	public void deleteBuyByMaxNum(String cart_idx) {
		// TODO Auto-generated method stub
		mapperInter.deleteBuyByMaxNum(cart_idx);
	}
	

}
