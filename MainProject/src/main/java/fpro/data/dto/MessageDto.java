package fpro.data.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("msg")
public class MessageDto {
	private int ms_num;
	private String ms_content;
	private String receiver_name;
	private int gubun;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp send_date;
	private String sender_name;
	private int read_yn;
}
