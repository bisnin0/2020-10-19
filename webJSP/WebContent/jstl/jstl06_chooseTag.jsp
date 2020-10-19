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
<h1> choose 태그 : 다중 if문, switch문</h1>
<c:choose>
	<c:when test="${param.username=='홍길동' }">  <!-- 이걸 만족하면 밑에건 실행 안하기때문에 밑에것도 확인하려면 조건을 변경 -->
		당신의 이름은 ${param.username }입니다.
	</c:when>
	<c:when test="${param.age>=20 }">
		당신은 20세이상입니다.
	</c:when>
	<c:otherwise>
		<!-- 만족하는 조건이 없을때 -->
		당신의 이름은 홍길동이 아니고, 나이가 20세 이상도 아닙니다.
	</c:otherwise>
</c:choose>
</body>
</html>