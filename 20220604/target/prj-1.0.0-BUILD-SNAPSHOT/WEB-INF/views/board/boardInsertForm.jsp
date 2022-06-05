<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글작성</title>
</head>
<body>
<div align="center">
	<h1>새글 작성</h1>
	<form id="frm" action ="boardInsert.do" method="post">
		<table id="table" border="1">
			<tr>
				<th width="100">작성자</th>
				<td width="900">
				<input type="text" id="boardName" name="boardName">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" id="boardTitle" name="boardTitle" >
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input type="date" id="boardDate" name="boardDate" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<textarea rows="20" cols="100" id="boardContent" name="boardContent">${content.boardContent }
				</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${not empty content.boardAttach}">
				<td><a href="downLoad.do?saveName=${content.boardDir}">
				${content.boardAttach }
				</a></td>
				</c:if>
				<c:if test="${empty content.boardAttach}"> 
				<td>등록된 첨부파일이 없습니다(미구현)
				</c:if>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="boardPassword" name="boardPassword"></td>			
			</tr>
		</table><br/>
 		<input type ="submit" value="새글 등록">
 		<input type = "reset" value="취소">
		</form>
</div>
</body>
<script>
 window.onload=function(){
	 today=new Date();
	 today = today.toISOString().slice(0, 10);
	 let boardDate=document.getElementById('boardDate');
	 boardDate.value=today;
	 
 }
</script>
</html>