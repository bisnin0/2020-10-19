<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String tel = request.getParameter("tel");
	
%>
<h1>서버에서 ajax로 받은 데이터</h1>
이름 : <%=username %><br/>
연락처 : <%=tel %><br/>
주소 : 서울시 마포구 백범로<br/>
