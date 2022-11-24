package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("badto")
public class BoardAnswerDto {
	private int idx;
	private int num;
	private String content;
	private Timestamp writeday;
	private int ans_regroup;
	private int ans_restep;
	private int ans_relevel;

	
}
