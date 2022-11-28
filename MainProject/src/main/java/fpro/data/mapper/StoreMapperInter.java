package fpro.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import fpro.data.dto.CartDto;
import fpro.data.dto.MemberDto;
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
	//로그인 된 id에 맞는 num 값 조회
	public String getNumById(String id);
	
	//cart에 추가
	public void insertCart(CartDto cdto);
	//구매페이지 - 가장 최근 cart 추가 데이터 가져오기
	public int getMaxNum();
	//cart_idx에 해당하는 cart 정보 불러오기
	public CartDto getCart(String cart_idx);
	//id에 맞는 storecart 데이터 가져오기
	public List<CartDto> getCartById(String id);
	//storecart 삭제
	public void deleteCart(String cart_idx);
	//storecart 수정
	public void updateCartCnt(Map<String, Object> map);
	
	
}
