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
<script>
	$(function(){
		$("#startAjax").click(function(){
			//접속할 파일명 호출     콜백함수(접속하고나서 실행).. 여기엔 매개변수가 있다. 변수명이니까 이름은 아무렇게나써도된다. data이렇게말고
			$.get("test.jsp?username=이순신&tel=010-1111-2222", function(data, status){ //ajax함수. get방식으로 서버프로그램에 접속해서 들어오는것
									//받은데이터, 상태
				//console.log(status); //상태가 success면 성공.
				$("#result").append(data);
			
			}); 
			
		});
	});
</script>
</head>
<body>
<h1>jquery에서 ajax 구현하기(GET방식)</h1>
<button id="startAjax">클릭하세요.</button>
<div id="result"></div>
</body>
</html>