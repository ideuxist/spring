package co.micol.prj.notice.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

/*
 * Program Name:공지사항 VO
 * Write by : 홍길동
 * Date :2022.05.31 최초 작성
 * version : 1.0
 */

@Setter
@Getter
public class NoticeVO {
private int noticeId;//순번
private String noticeName;//작성자
private String noticeTitle;//제목
private String noticeContents;//내용 
@JsonFormat(pattern = "yyyy-MM-dd",timezone="Asia/Seoul")
private Date noticeDate;
private int noticeHit;
private String noticeAttech;
private String noticeDir;
}
