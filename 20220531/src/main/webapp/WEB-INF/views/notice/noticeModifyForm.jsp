<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 수정</h1>
		</div>
		<div>
			<form id="frm" action="noticeModify.do" method="post" enctype="multipart/form-data">
					<input type="hidden" id="noticeId" name="noticeId" value=${content.noticeId}>
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150">${content.noticeName }</td>
							<th width="100">작성일자</th>
							<td width="150">${content.noticeDate }</td>
						</tr>
						<tr>
							<th width="100">제목</th>
							<td colspan="3"><input type="text" size="100"
								id="noticeTitle" name="noticeTitle" value="${content.noticeTitle }" ></td>
						</tr>
						<tr>
							<th width="100">내용</th>
							<td colspan="3"><textarea rows="10" cols="100"
									id="noticeContents" name="noticeContents">${content.noticeContents }</textarea></td>
						</tr>
						<tr>
							<th width="100">첨부파일</th>
							<td>
								<input type="file" id="file" name="file" multiple="multiple">
							</td>
						</tr>
					</table><br>
					<input type="submit" value="수정">&nbsp;&nbsp;
					<input type="submit" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>