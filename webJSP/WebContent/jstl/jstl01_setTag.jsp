<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<!-- JSTL라이브러리를 사용하기 위해서는 taglib 지시부에 표기하여야 한다. -->
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
<h1>set태그 : 변수를 선언해서 값을 보관할 수 있다.(변수선언)</h1>
<% //여긴 jsp
	int a = 1000;
%>
<!-- 여긴 jstl -->
<c:set var="num" value="${1234}"></c:set>  <!-- 이게 변수하나 선언한것 -->    <!-- 위 taglib지시부에서  prefix="c"로 선언했기때문에 c:로 들어간다.-->
<c:set var="age" value="${25}"></c:set>
<c:set var="name">세종대왕</c:set>
<c:set var="today" value="<%=new Date() %>"></c:set>
<hr/>
<h1>변수 사용하기</h1>
num : ${num }<br/>
age : ${age }<br/>
name : ${name }<br/>
today : ${today }<br/>  

<h1>변수 삭제</h1>
<c:remove var="num" scope="page"></c:remove> <!-- 현재페이지에서는 제거할거다. -->
num : ${num } <!-- null에러가 안생긴다. 데이터가 없으면 그냥 안보여준다. 에러가 별로 없어서 사용하기 편하다. -->


</body>
</html>