<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>form을 이용한 데이터 서버로 보내기</h1>
<form action="reqFormOk.jsp" method="post"> <!-- 주소표시줄에 비밀번호가 나오지 않게 하려면 method="post를 폼에 추가한다. 단, 이렇게하면 출력할때 한글이 깨져나온다. -->
									<!-- post방식일때는 한글 코드가 달라져서 깨지기때문에 받는쪽에서 request하기전에 한글 코드를 뭐로 할지 정해줘야한다. -->
	이름 : <input type="text" name="username" id="username"/><br/> 
				<!-- 가장 중요한건 name이다. name이없으면 서버로 데이터가 넘어가지 않는다. request불가능-->
	아이디 : <input type="text" name="userid" id="userid"/><br/>
	비밀번호 : <input type="password" name="pwd" id="pwd"/><br/>
	성별 : <input type="radio" name="gender" value="남"/>남 <!-- radio는 name을 똑같이 하면 둘중에 하나만 선택된다. -->
		<input type="radio" name="gender" value="여"/>여<br/> <!-- value가 없으면 서버로 전송되는 데이터도 없다. -->
	관심분야 : <input type="checkbox" name="inter" value="농구"/>농구 <!-- checkbox는 name이 똑같아서 여러개 선택 가능 -->
			<input type="checkbox" name="inter" value="야구"/>야구 <!-- name을 똑같이하면 클릭한 벨류가 배열형으로 넘어가서 간편해짐. 이름이 다르면 각각 request해줘야한다. -->
			<input type="checkbox" name="inter" value="배구"/>배구
			<input type="checkbox" name="inter" value="축구"/>축구
			<input type="checkbox" name="inter" value="탁구"/>탁구
			<input type="checkbox" name="inter" value="테니스"/>테니스<br/>
	지역 : <select name="local" id="local"> <!-- multiple로 여러개 선택하게 할 수 있다. ex  multiple size="5"-->
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="천안">천안</option>
		</select><br/>
		
	<input type="submit" value="전송"/>
	
</form>
</body>
</html>