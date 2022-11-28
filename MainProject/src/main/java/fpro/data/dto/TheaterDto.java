package fpro.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("tdto")
public class TheaterDto {
	
	private String num;
	private String city;
	private String name;
	
}
