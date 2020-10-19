<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트 화면에 있는 데이터를 서버로 가져오기
	String username = request.getParameter("username"); //매개변수를 Parameter라고 한다.
	String userid = request.getParameter("userid");
	String data = request.getParameter("data"); //보통 변수명은 똑같이 쓴다.
	
	//서버에 찍히는 변수는 다 String이다. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서버로 전송되었다가 다시 클라이언트에게 전해진 데이터</h1>
<%
	out.println("이름="+username);
	out.println("<br/>아이디="+userid);
	out.println("<br/>데이터="+data);
%>
<br/><br/><a href="aLink.jsp">이전 화면</a>
</body>
</html>