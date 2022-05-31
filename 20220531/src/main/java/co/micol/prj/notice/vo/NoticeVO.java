package co.micol.prj.notice.vo;

import java.sql.Date;

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
private int noticeId;
private String noticeName;
private String noticeTitle;
private String noticeContents;

private Date noticeDate;
private int noticeHit;
private String noticeAttech;
private String noticeDir;
}
