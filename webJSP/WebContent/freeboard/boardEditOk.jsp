<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //post방식으로 넘겨받을때 한글깨짐 발생
	int no = Integer.parseInt(request.getParameter("no"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	FreeboardDAO dao = new FreeboardDAO();
	int result = dao.getUpdateRecord(no, subject, content);
	if(result>0){
		%>
			<script>
				alert("글이 수정되었습니다..");
				location.href = "<%=request.getContextPath()%>/freeboard/boardView.jsp?no=<%=no%>&nowPage=<%=nowPage%>"
			
			</script>
		<%
	}else{
		%>
			<script>
				alert("글등록 실패하였습니다.");
				history.go(-1); // history.back();
			</script>
		<%
		
	}
	
%>