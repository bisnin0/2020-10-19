<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- 에러가 발생하면 실행하는 페이지라는 뜻. 이걸 넣어야 exception이라는 내장객체를 사용할 수 있는 상태가 된다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h2>에러가 발생하였습니다.</h2>
<div>	<!-- 에러메시지 = exception이라는 내장 객체가 있다. -->
	에러 메세지 : <%=exception.getMessage() %>
</div>
<img src="<%=request.getContextPath()%>/img/error.jpg"/>
</body>
</html>