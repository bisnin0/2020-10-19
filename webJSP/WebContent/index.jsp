<!-- 
	지시부(이 페이지는 이렇게 해라. 언어는 자바로 쓰고 한글은 UTF-8로 써라 등등..)
	import도 여기에 쓴다.
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Scanner" %>		<!-- Calendar import.. import 할게 여러개면 , 를 사용해서 추가한다. -->
<%@ page import="java.io.InputStream" %> <!-- 너무 길어지면 또 만들어서 import해도 된다. -->
<%@ page trimDirectiveWhitespaces="true" %><!-- jsp코드 빈자리 제거 -->
<%!
	//선언부 - 메소드나 변수를 선언하는 곳이다. 웹의 접근제한자는 무조건 public이다. private같은거 없음.. 여기는 JAVA지 JSP가 아니다.
	public String gugudan(int dan){
		String guguDan = "<ul>";
		for(int i=2; i<=9; i++){
			guguDan+="<li>"+dan+"*"+i+"="+(dan*i)+"</li>";
			
		}
		guguDan+="</ul>";
		//out.println("");에러난다. 여기는 JAVA다. out내장객체가 없다.
		//System.out.println("test"); //이건 웹페이지에 찍히지 않는다. 서버의 콘솔에 찍힌다. 클라이언트가 확인 불가. 이클립스 콘솔 보면 나옴
		return guguDan;
	}

	public int multiple(int a, int b){
		return a*b;
	}

%>
<!DOCTYPE html>
<!-- 여기서 코드를 작성하면 실행단계에 알아서 servlet으로 바꿔준다. -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	img{
		width:200px;
		height:200px;
	}
</style>
<script>
	document.write("<h2>JAVAScript</h2>");
	console.log("123");
</script>
</head>
<body>
<h1>JSP HOME : <%=session.getId() %></h1>

<%
	String logStatus = (String)session.getAttribute("logStatus");
	if(logStatus == null || logStatus.equals("")){
%>

	<a href="<%=request.getContextPath()%>/response/login.html">로그인</a><br/>
	<a href="<%=request.getContextPath()%>/register/regForm.jsp">회원가입</a>
<% }else if(logStatus != null && logStatus.equals("Y")){ %>

	<%=session.getAttribute("username") %><a href="<%=request.getContextPath()%>/response/logout.jsp">로그아웃</a> <!-- login.jsp에서 세션에 userid기록한걸 로그인하면 가져와서 표시해준다. -->

<% } %>


<hr/>

<ul>
	<li><a href="<%=request.getContextPath()%>/freeboard/boardList.jsp">게시판</a></li>
</ul>
<hr/>
<!-- --------------------------------------------
	JSTL(Jsp Standard Tag library)
	https://tomcat.apache.org/taglibs/standard/에서 
	jakarta-taglibs-standard-1.1.2 다운로드 후
	jstl.jar, standard.jar을 WEB-INF/lib에 복사한다.
-------------------------------------------------- -->
<ul>
	<li><a href="/webJSP/jstl/jstl01_setTag.jsp">set Tag</a> : 변수를 선언하고 값을 보관 또는 삭제한다.</li>
	<li><a href="/webJSP/jstl/jstl02_ifTag.jsp?username=홍길동&age=30&userid=goguma">if Tag</a> : 조건문</li>
	<li><a href="/webJSP/jstl/jstl03_forEachTag.jsp">forEach Tag</a> : 반복문</li>
	<li><a href="/webJSP/jstl/jstl04_forTokensTag.jsp">forTokens Tag</a> : 문자열을 특정 기호로 자르기</li>
	<li><a href="/webJSP/jstl/jstl05_urlTag.jsp">url Tag</a> : url 주소와 파라미터의 정보를 가진다.</li>
	<li><a href="/webJSP/jstl/jstl06_chooseTag.jsp?username=홍길동&age=25">choose Tag</a> : 다중 if문, switch문</li>
	<li><a href="/webJSP/jstl/jstl07_redirectTag.jsp">redirect Tag</a> : 페이지 이동</li>
</ul>


<!-- 스크립트릿(중간중간에 필요한 위치에 집어넣음. 이부분에서 client에 요청을 한다.).. 여기는 그냥 JAVA다 -->
<% 
	int a = 200;
%>

<!-- <img src="/webJSP/img/31.jpg"/>  -->
<img src="<%=request.getContextPath() %>/img/31.jpg"/>
		<!-- /webJSP 절대경로. JSP로 구하기.. 이렇게 안하면 다른컴퓨터에선 경로가 달라서 이미지 실행 안된다.-->

<%
	int result = a * 1000;
	//JSP에서 out내장객체는 클라이언트(client)에게 response 한다. 
	out.println("<div style='background:pink'>result="+result+"</div>");
	
	//오늘 날짜
	Calendar now = Calendar.getInstance(); //날짜와 시간 정보를 가진다. 그런데 Calendar 클래스가 있는곳인 util 패키지다. java.lang이 아니니까 import를 해야한다. 지시부에 작성
	
	int month = now.get(Calendar.MONTH)+1;
	int day = now.get(Calendar.DAY_OF_MONTH);
	//출력은 클라이언트에게 데이터를 보내는것. out.. new 안해도 된다. 이미 만들어있는 내장객체다.
	out.println("<h1>오늘은 "+month+"월 "+day+"일</h1>");
%>
<hr/>
<%
	//선언부의 메소드 호출
	out.println(gugudan(6)); //이렇게 해야 클라이언트가 볼수있다.
	

	out.println("곲="+multiple(1234, 5678));
	//System.out.println("gob="+multiple(500, 400)); //서버의 콘솔에 찍힌다. 이클립스 콘솔 확인. JSP부분은 console.log를 못쓴다.
%>

</body>
</html>
