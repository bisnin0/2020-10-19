<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 쿠키 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btn").click(function(){
			//javascript에서 쿠키 기록하기
			
			var now = new Date();
			//					변수=값;   기본경로; 삭제시기. 등록시간부터 7일후.. 그리고now.setDate로 해서 현재날짜를 7일 더한걸로 등록. 오늘 13일->20일
			document.cookie = "food=pizza;path=/;expires="+ now.setDate(now.getDate()+7);
			now = new Date(); //날짜설정 초기화
			document.cookie = "language=java;path=/;expires="+now.setDate(now.getDate()+1);
		});
	});
</script>
<%
	//jsp에서 쿠키기록하기             변수, 값
	Cookie cook = new Cookie("username", "홍길동");
	cook.setMaxAge(5*60); //쿠키의 생명주기(소멸시점:초단위) 7(7일)*24(시간)*60(분)*60(초) 하면 일주일. 
	
	response.addCookie(cook);
%>
</head>
<body>
<input type="button" value="버튼을 클릭하시면 쿠키가 생성됩니다.(javascript)" id="btn"/>
</body>
</html>