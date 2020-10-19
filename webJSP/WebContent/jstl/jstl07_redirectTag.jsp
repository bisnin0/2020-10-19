<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 자동으로 다른페이지 이동 -->
<c:redirect url="/freeboard/boardList.jsp">
	<c:param name="nowPage" value="5"/> <!-- 이렇게 하면 바로 게시판의 5페이지로 이동한다. 중간에 페이지가 하나 있지만 사용자는 볼 수 없다.-->
</c:redirect>


