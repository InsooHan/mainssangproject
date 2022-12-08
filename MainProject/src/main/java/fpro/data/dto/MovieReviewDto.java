package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mreviewdto")
public class MovieReviewDto {

	private String idx;
	private String num;
	private String name;
	private String myid;
	private int grade;
	private String content;
	private int likes;
	private Timestamp writeday;
	
}
