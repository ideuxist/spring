<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table id="tb" border="1">
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
	<button type="button" onclick="location.href='boardList.do'">목록보기</button>
 	<button type="button" onclick="callAjax()">ajax목록 불러오기</button>
 	</div>
 	<div align="center" id ="list">
 		<table id ="table" border="1">
 		
 		</table>
 	</div>
		
</body>
<script type = "text/javascript">
function callAjax(){
	$.ajax({
		url:"ajaxList.do",
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.length>0){
				htmlConvert(data);
			}
		},
		error:function(){
			alert('오류발생 다시 시도해주세요')
		}
	});
}
function htmlConvert(data){
	let table = document.getElementById('table')
	let fields=['boardId','boardName','boardTitle','boardDate','boardHit','boardAttach']
	let fields2=['게시글순번','작성자','제목','작성일','조회수','첨부파일']
	let tr= document.createElement('tr')
	for (const field of fields2){
	let th = document.createElement('th');
		th.innerHTML=field
		tr.appendChild(th)
	}
	table.appendChild(tr);
	$.each(data,function(index,b){
	let tr = document.createElement('tr')
		for (const field of fields ){
		td=document.createElement('td')
		td.innerHTML=b[field]
		tr.appendChild(td)			
		}
		table.append(tr);
	})
	list.append(table);
}
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