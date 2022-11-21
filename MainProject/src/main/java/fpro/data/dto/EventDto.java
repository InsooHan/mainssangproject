package fpro.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("evdto")
public class EventDto {

	private String  num;
	private String  category;
	private String  subject;
	private MultipartFile  uploadfile;
	private String  content;
	private Timestamp  eventday;
	private Timestamp  wirteday;
}
