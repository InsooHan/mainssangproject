package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
@Alias("badto")
public class BoardAnswerDto {
	private int idx;
	private int num;
	private String content;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm")
	private Timestamp writeday;
	private String name;
	private String id;

	
}
