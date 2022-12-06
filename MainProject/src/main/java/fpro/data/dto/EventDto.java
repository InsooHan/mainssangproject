package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("evdto")
public class EventDto {

	private String  num;
	private String  category;
	private String  subject;
	private String  photo;
	private String  content;
	private String  startday;
	private String  endday;
	private Timestamp  wirteday;
}
