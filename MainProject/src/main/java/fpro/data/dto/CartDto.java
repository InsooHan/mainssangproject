package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("cartdto")
public class CartDto {

	private String cart_idx;
	private String store_num;
	private String member_num;
	private int cart_cnt;
	private Timestamp cart_day;
	
	//cart 조회
	private String store_product;
	private String store_price;
	private String store_photo;
	
	
}
