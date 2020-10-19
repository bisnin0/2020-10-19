package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 폼
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		pw.println("<html><head><title>로그인 폼</title></head><body>");
		pw.println("<form method='post' action='/webServlet/login.do'>"); //get과 post방식이 확실히 구분되면 한 클래스에서 작업해도 상관없다.
		pw.println("아이디 : <input type='text' name='userid'/><br/>");
		pw.println("비밀번호 : <input type='password' name='userpwd'/><br/>");
		pw.println("<input type='submit' value='로그인'/></from>");
		pw.println("</form></body></html>");
		
		pw.close();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		//로그인하기.. DBConnection은 상속받을수없다. 이미 HttpServlet을 상속받고있으니까. 
		//만약 그래도 상속받고싶다면 DBConnection에서 HttpSevlet을 상속받고나서 여기서 DBConnection을 상속받으면 된다. 여기는 한번하고 말거라 상속 안받음
		String userid = req.getParameter("userid");
		String userpwd = req.getParameter("userpwd");
			
		
		Connection con=null;		//변수설정
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			//1. 드라이브 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. DB연결
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.214:1521:xe","scott","tiger");
			
			//3. PreparStatement 생성
			String sql = "select userid, username from register where userid=? and userpwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rs = pstmt.executeQuery();
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<html><head><title>로그인</title></head><body>");
			
			if(rs.next()) {
				//로그인 성공 -> session에 데이터를 넣고 홈페이지로 보낼것
				HttpSession session = req.getSession(); //이걸쓰면 session에 기록이된다.
				session.setAttribute("sesUserid", rs.getString(1));
				session.setAttribute("sesUsername", rs.getString(2));
				
				pw.println("<script>");
				pw.println("alert('로그인 성공 하였습니다. 홈페이지로 이동합니다.');");
				pw.println("location.href='/webServlet/test.do'");
			}else {
				//로그인 실패 -> login폼으로 다시 보냄
				pw.println("<script>");
				pw.println("alert('로그인 실패하였습니다. 다시 시도 하세요')");
				pw.println("history.back();");
			}
			pw.println("</script>"); //위에 둘중하나는 반드시 실행하니까 여기서 닫아도 된다.
			pw.println("</body></html>");
			
			pw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					pstmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}
		
	}

}
