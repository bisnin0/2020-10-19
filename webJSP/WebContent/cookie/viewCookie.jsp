<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 구하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<ul>
<%
	// 클라이언트 컴퓨터에 저장되어있는 쿠키 가져오기
	Cookie[] cookie = request.getCookies();

	for(Cookie c: cookie){ //확장된 for문 ..     배열의 데이터형 + 변수명(아무렇게나선언) : 배열의 변수명
		%>
		<li><%=c.getName()%> : <%=c.getValue()%></li>
		<%	
	}

%>
</ul>
</body>
</html>