<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%> <!-- CTRL + 스페이스로도 import문을 넣을 수 있다. 단, import가 제일 위로 올라가니 될수있으면 지시부 아래로 내려준다. 실행은 되지만 보기좋게 -->
<%@ page import="java.sql.ResultSet"%>
<%!
	//JDBC 드라이브 로딩, DB연결
	public Connection getConnection(){
		Connection conn=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.214:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "tiger");
		}catch(Exception e){
			System.out.println("BD연결에러 --->" + e.getMessage());
		}
		return conn;
	}

%>
<%
	//	1. 데이터를 서버로 가져온다. : request
	
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	//System.out.println("이름="+userid);
	//System.out.println("주소="+userpwd);
	
	// DB작업
	// 1. 드라이브 로딩
	// 2. DB연결
	
	Connection conn = getConnection(); 
	
	// 3. Statement생성(sql)
	
	//String sql = "select count(userid) from register where userid=? and userpwd=?"; //sql문을 count를 이용해 쓰면 무조건 0아니면 1(다른값이있을수도)이 들어있다. 
	String sql = "select userid, username from register where userid=? and userpwd=?"; //게시판 만들기용 sql
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpwd);
	
	// 4. ResultSet
	ResultSet rs = pstmt.executeQuery();
	//rs.next(); sql에 count 쓸때.. count일때는 0아니면 1이라 무조건 한줄은 있기때문에 한줄 넘기고 if문에서 ==0식으로 값을 확인하는데 수정한 sql문은 0줄이거나 1줄이기때문에 if문에 넣어 참거짓으로 확인.
	
/*
	if(rs.getInt(1)==0){ //로그인 실패
		//서버에서 다른 페이지로 이동하기     /webJSP/response/login.html
		response.sendRedirect(request.getContextPath()+"/response/login.html");
		
	}else if(rs.getInt(1)==1){ //로그인 성공	/webJSP/index.jsp
		//서버에서 다른 페이지로 이동하기
		response.sendRedirect(request.getContextPath()+"/index.jsp");		
	}//0과 1 외에 다른수가 있으면 회원가입이 잘못된것
	
	자바스크립트로 메시지 보여주기 위해서 주석처리
*/	 
	
	 //if(rs.getInt(1)==0){//로그인 실패 sql count쓸때
	if(!rs.next()){//로그인 실패
		
%>
	<!-- 여기는 HTML영역 -->
		<script>
			alert("로그인 실패하였습니다. 다시 시도 하세요.");
			//location.href="<%=request.getContextPath()%>/response/login.html"; 이걸 쓰면 아이디 비밀번호 다 지워짐
			history.back(); //history.ho(-1); 이렇게 하면 입력한 아이디 정보는 그대로 남아있다. 비밀번호는 지워진다. 
			
		</script>


<%		 
	 }else{ //로그인 성공
		 
		 //로그인 성공여부를 session(세션)에 기록한다.
		 session.setAttribute("logStatus","Y");
	 	 session.setAttribute("userid", rs.getString(1)); //sql 수정 후 추가 (게시판 만들기작업)
	 	 session.setAttribute("username", rs.getString(2));
%>		
	<!-- HTML영역 -->
		<script>
		
			alert("로그인 성공하였습니다. \n홈페이지로 이동합니다.");
			location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
<%		 
	 }
%>


















