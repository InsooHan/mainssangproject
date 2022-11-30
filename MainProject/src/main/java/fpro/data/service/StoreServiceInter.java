package fpro.data.service;

import java.util.List;
import java.util.Map;

import fpro.data.dto.CartDto;
import fpro.data.dto.MemberDto;
import fpro.data.dto.StoreDto;

public interface StoreServiceInter {

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
	//admin일 때 store 수정
	public void updateStore(StoreDto dto);
	//admin일 때 store 삭제
	public void deleteStore(String store_num);
	
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
	public void updateCartCnt(int cart_cnt, String cart_idx);
	//기존에 장바구니에 있는 상품인지 확인 - 있으면 cnt만 추가, 없으면 새로 장바구니 추가하게..
	public int checkCart(String store_num, String member_num);
	//상품이 있으면 cnt만 추가
	public void plusCartCnt(int cart_cnt, String store_num);
	//장바구니 결제 완료하면 해당 회원의 cart 목록 삭제
	public void deleteCartByMem(String member_num);
	
}
