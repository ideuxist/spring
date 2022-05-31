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
			<h1>게시글 등록</h1>
		</div>
		<div>
			<form id="frm" action="noticeInsert.do" method="post" enctype="multipart/form-data">
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150"><input type="text" id="noticeName"
								name="noticeName"></td>
							<th width="100">작성일자</th>
							<td width="150"><input type="date" id="noticeDate"
								name="noticeDate"></td>
						</tr>
						<tr>
							<th width="100">제목</th>
							<td colspan="3"><input type="text" size="100"
								id="noticeTitle" name="noticeTitle"></td>
						</tr>
						<tr>
							<th width="100">내용</th>
							<td colspan="3"><textarea rows="10" cols="100"
									id="noticeContents" name="noticeContents"></textarea></td>
						</tr>
						<tr>
							<th width="100">첨부파일</th>
							<td>
								<input type="file" id="file" name="file" multiple="multiple">
							</td>
						</tr>
					</table><br>
					<input type="submit" value="저장">&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					<input type="submit" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
 