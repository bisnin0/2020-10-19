<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="container">
		<h1>회원가입</h1>
		<form method="post" action="<%=request.getContextPath()%>/register/regFormOk.jsp">
		<ul>
			<li>아이디 : <input type="text" name="userid"/> </li>
			<li>비밀번호 : <input type="password" name="userpwd"/> </li>
			<li>이름 : <input type="text" name="username"/> </li>
			<li>성별 : <input type="radio" name="gender" value="M"/>남
					 <input type="radio" name="gender" value="F"/>여 </li>
			<li>생년월일 : <input type="text" name="birth" placeholder="2020-04-05"/> </li>
			<li>연락처 : <input type="text" name="tel" placeholder="010-1234-5678"/> </li>
			<li><input type="submit" value="회원등록"/></li>
		</ul>
		</form>
	</div>

</body>
</html>