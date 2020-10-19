<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("logStatus")!=null && session.getAttribute("logStatus").equals("Y")){ //로그인이된경우 아래 실행
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="/webJSP/etc/bootstrap.js"></script>
<script src="/webJSP/etc/ckeditor/ckeditor.js"></script>
<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
		overflow:auto;/*li:last-child에서 width:100% 해서 없어도 딱히 상관은없는듯*/
	}
	li{
		float:left;
		width:20%;
		padding:5px;
	}
	li:nth-child(2n){
		width:80%;
	}
	li:last-child{
		width:100%;
		text-align:center;
	}
	#subject{
		width:80%;
	}
</style>
<script>
	$(function(){
		//ckdeitor를 textarea와 연결하기
		CKEDITOR.replace("content");
		
		//데이터 입력 유무 확인
		$("#boardFrm").submit(function(){
			if($("#subject").val()==""){
				alert("글제목을 입력하세요..");
				$("#subject").focus();
				return false;
			}
			//alert(CKEDITOR.instances.intro.getData());
			//if(CKEDITOR.instances.intro.getData()==""){ 이게 안되는 이유. 이건 복사해서 가져온건데 중간에 intro는 그 파일에있던 대상의 name이다. 
			if(CKEDITOR.instances.content.getData()==""){	
				alert("글내용을 입력하세요...");
				$("#content").focus();
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>글쓰기 폼</h1>
	<form action="/webJSP/freeboard/boardWriteOk.jsp" method="post" id="boardFrm">
	<ul>
		<li>글쓴이</li>
		<li><%=session.getAttribute("userid") %></li>
		<li>제목</li>
		<li><input type="text" name="subject" id="subject"/></li>
		<li>글내용</li>
		<li><textarea name="content" id="content"></textarea></li>
		<li>
			<input type="submit" value="등록"/>
			<input type="reset" value="다시쓰기"/>
		</li>
	</ul>
	</form>
	<div>
		<a href="/webJSP/index.jsp">홈</a>
		<a href="/webJSP/freeboard/boardList.jsp">게시판 목록</a>
	</div>
</div>

</body>
</html>
<%}else{ // 로그인이 안된경우 

	response.sendRedirect("/webJSP/response/login.html");
}%>