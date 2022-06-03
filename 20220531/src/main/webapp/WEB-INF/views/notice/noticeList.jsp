<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="javascript" src="resources/jquery-3.6.0.js"></script>

<style>
table tr:hover {
	cursor: pointer;
	background: gray;
}
</style>
</head>
<body>
	<div align="center">
		<div>
			<h1>공지사항 목록</h1>
		</div>
		<div>
			<form id="frm">
				<select id="state" name="state">
					<option value="1">전 체</option>
					<option value="2">작성자</option>
					<option value="3">제 목</option>
					<option value="4">내 용</option>
				</select>&nbsp; <input type="text" id="key" name="key">&nbsp;
				<button type="button" onclick="searchList()">검색</button>
			</form>
		</div>
		<br />
		<div>
			<table id="tb" border="1">
				<thead>
					<tr>
						<th width="70">순 번</th>
						<th width="150">작성자</th>
						<th width="300">제 목</th>
						<th width="150">작성일자</th>
						<th width="70">조회수</th>
						<th width="70">첨부파일</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:if test="${ not empty notices}">
						<c:forEach items="${notices }" var="n">
							<tr onclick="eventList()">
								<td>${n.noticeId }</td>
								<td>${n.noticeName }</td>
								<td>${n.noticeTitle }</td>
								<td>${n.noticeDate }</td>
								<td>${n.noticeHit }</td>
								<td>${n.noticeAttech }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty notices }">
						<tr>
							<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
						</tr>
					</c:if>
				</tbody>

			</table>
			<form id="frm2" action="getContent.do" method="post">
				<input type="hidden" id="noticeId" name="noticeId">
			</form>
		</div>
		<br>
		<div>
			<button type="button" onclick="location.href='noticeInsertForm.do'">글
				등록</button>
		</div>
	</div>
</body>
<script type="text/javascript">
<!-- 그룹이벤트 생성(상세조회) -->
eventList();
function eventList(){
let list =document.querySelector('tbody');
list.addEventListener('click',function(ev){
	if(ev.target.tagName==='TD'){
	//console.log(ev.target.parentNode.children[0].textContent);
	//location.href='getContent.do?noticeId='+ev.target.parentNode.children[0].textContent;
	frm2.noticeId.value=ev.target.parentNode.children[0].textContent;
	frm2.submit();
	}
})
}
	

 function searchList(){
	let state = $("#state").val(); //document.getElementById("state").value;
	let key = $("#key").val();
	console.log('왜 안되냐');
	$.ajax({
		url : "ajaxSearchList.do",
		type : "post",//생략시 get
		data :{"state" : state,"key" : key},//전달할 데이터
		dataType:"json",//돌려받을 결과 html/text/xml/json/jsonp
		sucess:function(data){ //성공시 실행함수 결과는 data에 담김
			//수행할 영역
			console.log(data.length);
			console.log('=============')
			console.log(data);
			if(data.length>0){
			htmlConvert(data);
			}
		},
				
		error:function(){ //실패했을때 수행할 함수
			alert("의도치 않은 오류가 발생 했습니다.")
		}
	});
}
function htmlConvert(data){
	$("tbody").remove;
	data.each(data,function(index,n){
		var row = $("<tr onclick=eventList()>").append(
		$("<td/>").text(n.noticeId),
		$("<td/>").text(n.noticeName),
		$("<td/>").text(n.noticeTitle),
		$("<td/>").text(n.noticeDate),
		$("<td/>").text(n.noticeHit),
		$("<td/>").text(n.noticeAttech),
		);
		tb.append(row);
	})
	$("#tb").append(tb);
} 
</script>
<!-- <script type="text/javascript">
function searchList(){
	let list = document.getElementById('tbody')
	let tb=document.getElementById('tb')
	let tbody=document.createElement('tbody')
	tbody.setAttribute('id','tbody')
	fetch('ajaxSearchList.do',{
	method:'POST',
	body:new FormData(document.getElementById('frm'))
	})
	.then(response=>response.json())
	
	.then(data=>{
	list.remove();
	
	let fields=['noticeId','noticeName','noticeTitle','noticeDate','noticeHit','noticeAttech']
	data.forEach(n=>{
		let tr = document.createElement('tr');
		for (const field of fields){
			let td=document.createElement('td');
			td.innerHTML=n[field];
			tr.appendChild(td);
		}
		tbody.appendChild(tr);
	})
	tb.appendChild(tbody);
	})
}	
</script> -->
</html>