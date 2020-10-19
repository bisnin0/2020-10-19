<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#content{
		height:500px;
	}
</style>
</head>
<body>
 
<!-- header include -->
<%@ include file="header.jspf" %><!-- 조각파일 인크루드 방법 -->
<div id="content">
	<!-- 위에서 지시부로 jspf파일을 인크루드 했다면 인크루드 한 파일의 변수는 선언없이 아래에서 사용할 수 있다. 선언부 위에 쓰면 안된다.-->
	<h1> .jspf 조각파일의 데이터는 호환된다.</h1>
	username : <%=username %><br/>
	addr : <%=addr %><br/>
	<img src="/webJSP/img/32.jpg"/>	
</div>

<!-- footer include -->
<%@ include file="footer.jspf" %>

</body>
</html>