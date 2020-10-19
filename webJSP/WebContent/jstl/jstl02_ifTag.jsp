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
<h1>if Tag 사용하기</h1>
<c:set var="data1" value="${1234 }"/>
<c:set var="num" value="${1000 }"/>

<!-- 		조건식 -->
<c:if test="${ true }"> <!-- 무조건 참이라고 설정 -->
	<b style="color:green">무조건 실행됨...</b>  <!-- html을 그대로 사용 가능함 -->
</c:if>
<c:if test="${data1 > num }"> <!--  data1이 num보다 크면 참 -->
	<h2>data1이 num보다 큰값이다.</h2>
</c:if>

<hr/>
<!--  이전페이지에서 보낸 데이터를 가져올 때 : request.getParameter("변수명") -->
이름 : ${ param.username } <br/><!-- 이게 request.getParameter("변수명")과 같은뜻이다. param=request.getParameter라고보면된다. request 안써도 되는게 편함점-->
나이 : ${ param.age + 10} <br/> <!-- 중괄호 안에 계산식도 가능함 --> 
							   <!-- 자동으로 문자가 숫자 변환 되기때문에 Integer.parseInt를 할 필요가 없다. 형변환 자동으로 되는게 편한점--> 
아이디 : ${param.userid }<br/>
</body>
</html>