package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("addto")
public class AdminDto {

	private int  num;
	private String  division;
	private String  subject;
	private String  photo;
	private String  content;
	private int readcount;
	private Timestamp  writeday;
}
