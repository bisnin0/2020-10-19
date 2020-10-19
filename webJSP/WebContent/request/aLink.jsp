<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- CDN방식 -->
<script>
	$(function(){
		$("#clk").click(function(){
			location.href = "locationOk.jsp?name=세종대왕&addr=서울시 종로구&tel=010-7894-5896";
			//location.href 기억하기. 웹페이지 접속하는방법.
		});
	});
</script>
</head>
<body>
<h1>a 태그를 이용한 서버로 데이터 보내기</h1>
<a href="aLinkOk.jsp?username=홍길동&userid=goguma&data=1234">클릭하세요.</a>

<h1>자바스크립트에서 서버에 데이터 보내기</h1>
<button id="clk">클릭하세요...</button>
</body>
</html>