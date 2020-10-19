package com.bitcamp.home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class Logout extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그아웃은 session을 삭제한다. = 로그인 아이디와 유저네임이 사라진다.
		HttpSession session = request.getSession();
		
		session.invalidate(); //세션삭제
		
		response.sendRedirect("/webServlet/test.do");
		
	}

}
