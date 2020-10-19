<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");

	System.out.println("이름="+name);
	System.out.println("주소="+addr);
	System.out.println("연락처="+tel);
%>
