package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("community")
public class CommunityDto {
	private int num;
	private int readcount;
	private int likes;
	private int regroup;
	private int relevel;
	private int restep;
	private int notice;
	private String id;
	private String name;
	private String subject;
	private String content;
	private String category;
	private Timestamp writeday;
	
}
