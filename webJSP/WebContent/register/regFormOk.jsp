<%@page import="com.bitcamp.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//request
	request.setCharacterEncoding("UTF-8");
%>
<!--
	RegisterVO 객체 생성 
	
	RegisterVO vo = new RegisterVO()
	id : 변수
	class : 객체 생성할 클래스
	scope : application(서버가 켜지면 생성되고 서버가stop될때까지), session(갱신이없을때 설정한시간만큼)
			, page(현재페이지안에선 생명을 가져라.. 주로 이걸 사용함), request(가져오고끝) => 생명주기(언제까지 살아있게 만들건지)
			
	setProperty : 이전 페이지의 데이터를 request한다.  name은 데이터를 어디에 담을거라는 뜻(usebean의 id) *은 모든 데이터... userid를 쓰면 userid만 담김
	
	아래처럼할때 중간에 주석문 안넣음
-->

<jsp:useBean id="vo" class="com.bitcamp.register.RegisterVO" scope="page"/>
<jsp:setProperty name="vo" property="*"/> 
<%
	RegisterDAO dao = new RegisterDAO();
	int cnt = dao.memberInsert(vo);
	if(cnt>0){
		%>
			<script>
				alert("회원가입에 성공하였습니다.");
				location.href="<%=request.getContextPath()%>/index.jsp";
			</script>
		<%
	}else{
		%>
			<script>
				alert("회원가입에 실패하였습니다.");
				history.back();
			</script>
		<%
	}
	

%>