<%@page import="java.util.HashMap"%>
<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h1>forEach : 반복문</h1>
<c:set var="dan" value="${7 }"></c:set>

<!--  자바에서 for문쓸때 for(int i=0; i<10; i++) 여기서 i란 변수는 var안에 만든다. i=0(초기값)은 begin, i<10(최종값)은 end, i++(증가값)은 step..1씩일때는 안써도 된다. -->
<!--        변수 		초기값 	  최종값	 증가값.. 1씩 증가일때는 생략해도 된다.-->
<c:forEach var="i" begin="2" end="9" step="1">
	${dan } * ${i } = ${dan*i }<br/>
</c:forEach>

<h1>배열을 이용한 반복문</h1>
<c:set var="arr" value="<%= new int[]{10, 62, 58, 389, 24, 56, 84, 24, 95, 38, 32} %>"></c:set>
 <!--  					배열변수(여기 담으면 처음값부터 끝까지 알아서 반복이 돌아갈때마다 data에 담아준다.)	-->
<c:forEach var="data" items="${arr }">
	[${data }]
</c:forEach>


<h1>컬렉션의 데이터를 이용한 반복문</h1> 
<%
	List<String> list = new ArrayList<String>();
	list.add("홍길동");
	list.add("이순신");
	list.add("세종대왕");
	list.add("강감찬");
	list.add("을지문덕");
	list.add("정도전");
	
	
%>
<c:set var="data2" value="<%=list %>"></c:set>
<ul>
	<c:forEach var="name" items="${data2 }">  <!-- items에 <%=list %>를 담아도 되는데 정확한 방법 확인필요. -->
		<li>${name }</li>
	
	</c:forEach>
</ul>
<%
	List<FreeboardVO> freeList = new ArrayList<FreeboardVO>();
	freeList.add(new FreeboardVO(6, "테스트", "hong1234"));
	freeList.add(new FreeboardVO(69, "日, 후쿠시마 오염수 해양 방류 굳혔다", "manggo"));
	freeList.add(new FreeboardVO(46, "고용부는 서울랜드에도 향후 6개월간 총 3억4400만원", "hong1234"));

%>
<ol>
	<c:forEach var="i" items="<%=freeList %>"> <!-- 간편해서 굉장히 많이 씀. 숙지할것 -->
		<li>${i.no }, ${i.subject }, ${i.userid } </li> <!-- 여기있는 no는 FreeboardVO에 있는 no다. getter setter를 안써도 되지만 freeboardVO에 getter setter는 세팅이 되어있어야한다. -->
	</c:forEach>
</ol>

<h1>hashMap으 데이터를 이용한 반복문</h1>
<%
	HashMap<String, String> hm = new HashMap<String, String>();
	hm.put("name", "홍길동");
	hm.put("tel", "010-1234-5555");
	hm.put("addr", "서울시 마포구 백범로");
%>
<ol>
	<c:forEach var="mapData" items="<%=hm %>"> <!-- 자바에비해서 굉장히 간편함. 숙지할것 -->
		<li> ${mapData.key } : ${mapData.value }</li>
	
	</c:forEach>

</ol>
</body>
</html>

