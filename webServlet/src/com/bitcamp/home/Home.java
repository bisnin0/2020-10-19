package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test.do") //@WebServlet = 이런걸 어노테이션이라고한다. 
public class Home extends HttpServlet {
	//doGet(), doPost()가 실행되기 전에 호출되는 메소드
	//없으면 시행 안하지만 있으면 먼저실행
	public void init(ServletConfig config) throws ServletException{
		System.out.println("init()메소드 실행됨..");
	}
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 실행됨");
		System.out.println("이름="+req.getParameter("username"));//위에 request는 변수이름이라 바꿔도된다. req로바꿈
		
		//서버에서 클라이언트에게 보내기 : HttpServletResponse
		response.setContentType("text/html; charset=UTF-8");  //세팅먼저
		
		//Output객체 생성
		PrintWriter pw = response.getWriter(); 
		
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head><title>서블릿을 이용한 홈페이지</title>");
		pw.println("<style>");
		pw.println("body{font-size:2em; color:green;}");
		pw.println("</style>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>서블릿 홈페이지</h1>");
		pw.println("<b>이름 = "+req.getParameter("username")+"</b>");
		HttpSession session = req.getSession();
		if(session.getAttribute("sesUserid")==null) {
		pw.println("<h2><a href='/webServlet/login.do'>로그인</a></h2>");
		}else {
		pw.println("<h2><a href='/webServlet/logout.do'>로그아웃</a></h2>"); //a태그로 들어가면 무조건 get방식이다.
		}
		String sesUserid = (String)session.getAttribute("sesUserid");
		String sesUsername = (String)session.getAttribute("sesUsername");
		pw.println("세션값(Login에서 설정한것)="+sesUserid+", "+sesUsername);
		
		pw.println("</body>");
		pw.println("</html>");
	}
	//request(클라이언트가 서버에 보내는것)의 반대는 response(응답하는것. 서버거를 클라이언트에 보내는것.)

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 실행됨");
		
	}

}
