package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("demovie")
public class DemovieDto {
	
	private String cart_num;
	private String movie_num;
	private String sang_num;
	private String theater_num;
	private Timestamp movietime;
	private String seat;
	
	private int capacity;
	private String name;
	private String age;
	private String sang_name;
}
