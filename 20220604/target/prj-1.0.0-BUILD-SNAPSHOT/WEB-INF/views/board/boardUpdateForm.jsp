<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<div align="center">
<h1>게시글 수정</h1>
		<form id="frm" action ="boardUpdate.do" method="post">
		<table id="table" border="1">
			<tr>
				<th width="100">작성자</th>
				<td width="900">
				<input type="text" id="boardName" name="boardName" value="${content.boardName }">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" id="boardTitle" name="boardTitle" value="${content.boardTitle }">
				</td>
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
				<td><input type="password" id="boardPassword" name="boardPassword" value="${content.boardPassword }" readonly></td>			
			</tr>
		</table><br/>
		<input type="hidden" id = "boardId" name="boardId" value="${content.boardId }">
 		<input type ="submit" onclick="updateCheck()" value="수정하기">
 		<input type = "reset" value="취소">
		</form>
</div>
</body>
<script type="text/javascript">
function updateCheck(){
	let result = confirm('수정하시겠습니까?');
	console.log(result);
	if(result===true){
		frm.submit();
	}	else{
		
	}
}
</script>
</html>