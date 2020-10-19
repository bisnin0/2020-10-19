<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>세션의 값 확인하기</h1>
	<ul>
		<li>이름 : <%=session.getAttribute("username")%></li>
		<li>아이디 : <%=session.getAttribute("userid")%></li>
		<li>연락처 : <%=session.getAttribute("tel")%></li>
	
	</ul>
</body>
</html>