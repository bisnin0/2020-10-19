<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Bootstrap CSS -->
<!-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 -->
 
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="/webJSP/etc/bootstrap.js"></script>

<!-- 4.5.3 CDN이 안먹혀서 4.4이전 이전버전으로 하려다가 그냥 etc에 다운로드 받아서 사용함.
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
--------------------아래 4.5.3이 안먹힘(수정될지도?)
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.3/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 -->
<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;	
	}
	#lst>li{
		float:left;
		line-height:35px;
		height:35px;
		border-bottom:1px solid gray;
		width:10%;
		
	}
	#lst>li:nth-of-type(5n+2){width:60%}

	/*wordCut(클래스명이니까 임의로).. 게시판에서 길어서 넘치는 문장 자르기*/
	.wordCut{
		white-space:nowrap; /*줄 바꾸지 말아라. 줄 바꿈 안함*/
		overflow:hidden;/*넘침 숨기기*/
		text-overflow:ellipsis; /*넘친부분을 ...으로 표시하라. 문장 줄이기 */
	}

	/*페이지 매기기*/
	#paging ul{
		hwight:40px;
		width:100%;
		overflow:auto;
		
	}
	#paging li{
		float:left;
		width:60px;
		height:40px;
		text-align:center;
		font-size:1.3em;
		
	}
</style>
    
</head>
<body>
<%
	FreeboardDAO dao = new FreeboardDAO();
//-----------------------------------------------------
	//총레코드수
	int totalRecord = dao.getTotalRecord();//총 레코드수 구하기
	int onePageRecord = 5; //한페이지당 출력할 레코드 수 정하기
	int nowPage = 1;//현재 이사람이 보고있는 페이지번호
	int totalPage = 0; //총 페이지 수
	int onePageNum = 5; //한번에 표시할 페이지 수 
	int startPage = 1; //페이지번호의 시작번호
	
//-----------------------------------------------------	
	//현재 페이지 정보 구하기.. 주소창에 ?nowPage=숫자 같이 request하면 페이지가 변한다.
	String nowPageStr = request.getParameter("nowPage"); //request하면 문자. null이있을수도있다.
	if(nowPageStr != null){
		nowPage = Integer.parseInt(nowPageStr);
	}
	//총 페이지 수 계산하기
	totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);

	//페이지번호의 시작번호 구하기     //나누기로 소수이하 버리면서 정수만들고 곱하면서 시작번호 구함
	// 4페이지면 1 6페이지면 6 13페이지면 11.. onePageNum=5개씩 찍히니까 시작은 항상 1, 6, 11, 16 식이다.
	startPage = ((nowPage-1)/onePageNum*onePageNum)+1;
	
	//전체레코드 구하기 // 매개변수 추가로 페이지 기능 구현함  // 
	// List<FreeboardVO> list =dao.getAllRecord(nowPage, onePageRecord);
	
	//전체레코드 구하기 // 위에 더해서  마지막 페이지 구하기 기능 구현 위해 매개변수 추가
	List<FreeboardVO> list =dao.getAllRecord(nowPage, onePageRecord, totalPage, totalRecord);
	
%>


<div class="container">
	<h1>게시판</h1>
	<div>총레코드 수 : <%=totalRecord %>개</div>
	<div>pages : <%=nowPage %>/<%=totalPage %></div>
	<ul id="lst">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		<%for(int i=0; i<list.size(); i++){
			FreeboardVO vo = list.get(i);
		%>
		
		<li><%=vo.getNo() %></li>
		<li class="wordCut"><a href="/webJSP/freeboard/boardView.jsp?no=<%=vo.getNo()%>&nowPage=<%=nowPage%>"><%=vo.getSubject() %></a></li>
												<!-- 게시글로 넘어가면서 게시글 레코드 번호와 몇번째 페이지였는지 정보를 넘겨준다. -->
		<li><%=vo.getUserid() %></li>
		<li><%=vo.getWritedate() %></li>
		<li><%=vo.getHit() %></li>
		<%} %>
	</ul>
	<div id="paging">
		<ul>
			<!-- 이전페이지 -->
		
			<li>
				<%if(nowPage==1){ %>
					<a href="#">Prev</a>
				<%}else{ %>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=nowPage-1%>">Prev</a>
				<%} %>
			</li>
			
			<!-- 페이지 넘버 매기기 -->
			<%for(int p=startPage; p<startPage+onePageNum; p++){
				if(p<=totalPage){ //마지막 페이지까지만 표시
					if(p==nowPage){ //현재페이지 빨간색 표시
			%>
				<li>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=p%>" style="color:red"><%=p %></a>
				</li>
				
			<%  }else{ 	%>
			
				<li>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=p%>"><%=p %></a>
				</li>
			<% 
					}// 현재페이지빨간색
				}   //if문
			}  //for문 %>
			
			<!-- 다음페이지 -->
			<li> 
			<!-- 끝페이지에가면 아예 NEXT안뜨게만들기 -->
				<%if(nowPage<totalPage){//다음페이지 없을경우 Next가 안뜨게 만들기 %>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=nowPage+1%>">Next</a>	
				<%} %>
				
			<!--  //다음페이지가 없을 경우 Prev랑 똑같이 만든것. 
				<%if(nowPage==totalPage){ //다음페이지가 없을 경우 Prev랑 똑같이 만든것. %>
					<a href="#">Next</a>
				<%}else{ %>
					<a href="/webJSP/freeboard/boardList.jsp?nowPage=<%=nowPage+1%>">Next</a>
				<%} %>
			 -->
			</li>
			
			
		</ul>
	</div>
	<div>
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
		<a href="<%=request.getContextPath()%>/freeboard/boardWrite.jsp">글쓰기</a>
	</div>
</div>
</body>
</html>