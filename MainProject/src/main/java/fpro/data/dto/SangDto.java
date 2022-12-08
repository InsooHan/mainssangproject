package fpro.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sang")
public class SangDto {
	
	private String num;
	private String sang_name;
	private int price;
	private String capacity;
	
}
