package fpro.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("store")
public class StoreDto {

	private String store_num;
	private String store_product;
	private String store_photo;
	private String store_category;
	private int store_price;
	private int store_count;
	private String member_num;
	
}
