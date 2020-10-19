<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#content{
		height:600px;
	}
</style>
</head>
<body>
	<!-- header.jsp를 include한다. -->
	<jsp:include page="header.jsp"/>
	<!-- JSP의 action태그. include-->
	
	<div id="content">
		<!-- .jsp로 include된 경우 데이터 호환이 되지 않는다. -->
		name : <%//=name 주석처리 %><br/> <!-- include로 선언한 변수를 따로 선언하지 않고 그대로 사용할수는없다. -->
		num : <%//=num %><br/>
		<img src="/webJSP/img/31.jpg"/>
		<img src="<%=request.getContextPath()%>/img/31.jpg"/>
	</div>
	<!-- footer.jsp를 include한다. -->
	<jsp:include page="footer.jsp"/>
</body>
</html>