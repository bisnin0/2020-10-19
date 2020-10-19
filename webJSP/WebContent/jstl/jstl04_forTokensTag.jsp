<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="/webJSP/etc/bootstrap.js"></script>
</head>
<body>
<h1>forTokens : 문자열을 이용한 반복문 처리하기.. 특정기호로 자르기</h1>
<c:forTokens var="i" items="빨강색, 노랑색.파랑색 , 보라색,^^^^하늘색.핑크색. 오렌지색,검정색, 남색" delims=",.^"> <!-- 기호를 2개 넣으면 2개 다 잘린다. 스페이스바 공백도 인식한다.-->
												<!-- ^같이 꺽쇄 기호가 여러개있어도 데이터가 없을때는 반복문 실행을 안한다. ^사이에 아무것도 없으니까. 단, ^앞이나 뒤에 스페이스바로 공백주면 공백이생김 -->
	[${i}]<br/>
</c:forTokens>
</body>
</html>