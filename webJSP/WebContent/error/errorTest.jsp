<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %> <!-- 지시부에 에러가 발생하면 갈 페이지 적는다. 에러발생하면 이 페이지로 이동한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form action="errorTest.jsp">
	수1 : <input type="text" name="su1"/>
	수2 : <input type="text" name="su2"/>
	<input type="submit" value="계산하기"/>
</form>
<div>
<%
	String su1 = request.getParameter("su1"); //request는 전 화면에서 가져오는거라. 전화면에서 가져오는게 없으면 null이 들어간다.
	String su2 = request.getParameter("su2");
	if(su1!=null && su2!=null){
	//request는 숫자로 썼어도 문자로 들어온다. 변환해야함
	int su1Int = Integer.parseInt(su1); //null을 int로 바꿔야하니까 에러가 발생한다.
	int su2Int = Integer.parseInt(su2);
	
	int add = su1Int+su2Int;
	int minus = su1Int-su2Int;
%>
	<h2><%=su1%>+<%=su2%>=<%=add%></h2>
	<h2><%=su1%>-<%=su2%>=<%=minus%></h2>
	<%} %>
</div>
</body>
</html>