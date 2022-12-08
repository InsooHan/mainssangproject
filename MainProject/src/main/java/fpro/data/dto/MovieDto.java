package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("moviedto")
public class MovieDto {
	
	private String num;
	private String name;
	private String age;
	private String genre;
	private String poster;
	private String content;
	private String actor;
	private int likes;
	private int bookcount;
	private String runtime;
	private Timestamp opendate;
	private int sang;
	private double ticket;
	
}
