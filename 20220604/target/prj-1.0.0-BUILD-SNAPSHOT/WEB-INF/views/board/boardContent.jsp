<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table id="table" border="1">
			<tr>
				<th width="100">작성자</th>
				<td width="900">${content.boardName }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${content.boardTitle }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${content.boardDate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${content.boardHit }</td>
			</tr>
			<tr>
				<th height="400">내용</th>
				<td>${content.boardContent }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${not empty content.boardAttach}">
				<td><a href="downLoad.do?saveName=${content.boardDir}">
				${content.boardAttach }
				</a></td>
				</c:if>
				<c:if test="${empty content.boardAttach}"> 
				<td>등록된 첨부파일이 없습니다
				</c:if>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="boardPassword" name="boardPassword"></td>			
			</tr>
		</table>
	</div><br/>
	<div align="center">
	<form id = "frm" action ="boardUpdateForm.do" method="post">
		<input type="hidden" id="boardId" name="boardId" value="${content.boardId }">
	</form>
	<form id = "frm2" action ="boardDelete.do" method="post">
		<input type="hidden" id="boardId" name="boardId" value="${content.boardId }">
	</form>
	<button type="button" onclick="updateCheck()">수정</button>
	<button type="button" onclick="removeCheck()">삭제</button>
	<button typt="button" onclick="location.href='boardList.do'">목록보기</button>
 	</div>
		
</body>
<script type = "text/javascript">
function updateCheck(){
	let password = document.getElementById('boardPassword').value;
	console.log(password);
	if(password==${content.boardPassword}){
		frm.submit();
	}else{
		alert('비밀번호를 확인해주세요');
	}
}
function removeCheck(){
	let password = document.getElementById('boardPassword').value;
	let result = confirm('정말로 삭제하시겠습니까?');
	if(result==true){
		if(password==${content.boardPassword}){
			frm2.submit();}
		else{
		alert('비밀번호를 확인해주세요');}
	}else{
	}
}
</script>
</html>