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
		$("#startPost").click(function(){
			//	  호출할 파일	  서버로 보낼 데이터(JSON방식)
			$.post('test.jsp', {   //post방식
				username:'손흥민'
				,tel:'010-8888-2222'
			}, function(data, status){ //콜백함수
				if(status=='success'){
					$("#result").append(data);
				}
			});  
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>Post방식으로 서버에 비동기식으로 접속하여 정보 얻어오기</h1>
	<button id="startPost">클릭하세요.</button>
	<div id="result"></div>
	
</div>

</body>
</html>