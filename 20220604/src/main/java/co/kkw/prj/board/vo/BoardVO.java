package co.kkw.prj.board.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int boardId;
	private String boardName;
	private String boardPassword;
	private String boardTitle;
	private String boardContent;
	private int boardHit;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="Asia/Seoul")
	private Date boardDate;
	private String boardAttach;
	private String boardDir;
}
