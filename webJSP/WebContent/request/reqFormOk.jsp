<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays, java.util.Enumeration" %>
<%
	//post방식 전송일 경우 한글을 인코딩후 request한다.
	request.setCharacterEncoding("UTF-8");
	
	
	String username = request.getParameter("username");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	
	//checkbox는 1개 이상 선택되므로 메소드를 배열로 가져와야한다. 
	String inter[] = request.getParameterValues("inter");
	
	//지역도 여러개 선택이 가능하게 할 수 있다.  multiple size="5"같은걸 추가해주면된다. 그런데 여기선 하나만 선택하게 만듬
	String local = request.getParameter("local");
	
	System.out.println("이름="+username);
	System.out.println("아이디="+userid);
	System.out.println("비밀번호="+pwd);
	System.out.println("성별="+gender);
//	System.out.println("관심분야(toString)="+inter.toString()); 의미없는 디폴트값 출력
	System.out.println("관심분야(toString)="+ Arrays.toString(inter)); //배열의 값을 출력해줌
	/*
		"toString" 메서드는 객체가 가지고 있는 정보나 값들을 문자열로 만들어 리턴하는 메소드다.
		이렇게 출력해보면 결과값에는 이상한 정보가 담기는데이 값은 순수 "Object"의 "toString"결과 값입니다. (결국 의미없는 디폴트 값)
		하지만 "String" 클래스나 "File"클래스에서는 "toString"에 메소드를 재정의 하여 의미있는 값을 리턴해 줍니다.
		"String" 클래스 객체의 "toString"메소드는 자신이 가진 값을 그대로 리턴해주고,
		"File"클래스 객체의 "toString"메소드는 자신이 가진 해당 경로값을 리턴해 주고있습니다.
		이 두 클래스는 내부에서 "toString"을 재정의해서 사용한 것 입니다.
	---------------------------------------------------------
		여기서 위에 주석처리한 inter.toString()은 의미없는 디폴트값이 찍힌다.
		
		배열을 toString으로 출력하려면 Arrays.toString(변수명) 을 사용하면 찍힌다.
	*/

	/* 		
	// Arrays.toString(변수명)을 사용하지 않고 for문 써도 된다.

	for(int i=0; i<inter.length; i++){
		System.out.println("관심분야(for)="+inter[i]);
	}
	*/
	System.out.println("지역="+local);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//alert("확인을 누르시면 홈페이지로 이동합니다.");
	//location.href="../index.jsp"; 이거 주석 풀면 이동함.
</script>
</head>
<body>
<h2>form의 전송데이터</h2>
<%
	int a=100;
	out.println(a);
%>
<ul>
	<li>이름 :<%=username+"입니다."%> </li>  <!-- =은 out.println이라고 보면 된다. 이방법을 가장 많이쓴다. 단, 여러줄의 명령어를 쓸 수 없다. -->
										<!-- out.println("이름="+username);와 같다고 보면된다.  -->
	<li>아이디 :<%=userid %> </li>
	<li>비밀번호 :<%=pwd %> </li>
	<li>성별 :<%=gender %> </li>
	<li>관심분야 :<%=Arrays.toString(inter) %> </li>
	<li>지역 :<%=local %> </li>
	
</ul>
<h2>이전페이지 폼의 엘리먼트 알아내기</h2>
<%
	Enumeration element = request.getParameterNames();

%>
<ul>
	<% 
		while(element.hasMoreElements()){
	%>
	<li><%=element.nextElement() %></li>
	<% } %>
</ul>
<ul>
	<li>접속자의 ip : <%=request.getRemoteAddr() %></li> <!-- 접속하고있는사람 컴퓨터 IP를 구하는 메소드 -->
				<!-- 내가 다른사람 컴퓨터에 접속하거나 남이 들어오면 여기에 ip가 뜬다. 내서버에 내가들어갈때는 
				localhost일때는 안뜨고 주소창에 자기아이피 입력하고 들어가면 된다. -->
				
	<li>인코딩 코드값 : <%=request.getCharacterEncoding() %></li> <!-- UTF-8로 설정해놔서 UTF-8이 뜬다. 설정 안하면 null로보임 -->
	<li>contentType: <%=request.getContentType() %></li>
	<li>전송방식 : <%=request.getMethod() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>URI : <%=request.getRequestURI() %></li> <!-- /webJSP/request/reqFormOk.jsp.. context/폴더명/파일명... context는 이클립스에서 만든 프로젝트명. -->
	<li>ContextPath : <%=request.getContextPath() %></li>
	<li>서버이름 : <%=request.getServerName() %></li>
	<li>포트번호 : <%=request.getServerPort() %></li>
	<li>절대주소 : <%=request.getServletContext().getRealPath("/") %></li> <!-- 나중에 파일 업로드할때 이 메소드로 경로를 구해서 작업한다. -->
</ul>
</body>
</html>










