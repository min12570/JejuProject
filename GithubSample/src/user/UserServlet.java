package user;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import biz.Biz;
/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/UserServlet", "/User" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Biz biz;
	
	
	/**
     * @see HttpServlet#HttpServlet()
     */
	public UserServlet() {
		super();
		 // TODO Auto-generated constructor stub
        biz = new Biz();
	}
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("UserServlet 서비스 접근");
		String db2 = request.getParameter("db2");
		ArrayList<UserVO> userInfo = new ArrayList<UserVO>();
		System.out.println("User 객체 생성");
		String next="";
		System.out.println("db2 값" + db2);
		
		if (db2.equals("userall")) {
			
			Connection con = (Connection)biz.getConnection(); //mySQL 연결
			Statement st = null;
			try {
			st = (Statement)con.createStatement();
		} catch(SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		
		String sql;
		sql = "select * FROM users;";
		
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		try {
			while (rs.next()) {
				String user_id = rs.getString("user_id");
				String user_pw = rs.getString("user_pw");
				String user_email = rs.getString("user_email");
				String user_contact = rs.getString("user_contact");
				
				UserVO user = new UserVO(user_id, user_pw, user_email, user_contact);
				
				userInfo.add(user);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("UserVO" + userInfo.size());
		request.setAttribute("userInfo", userInfo);
		
		biz.close(con);
		}
		
	
		next = "/PhoenixJeju/Site/event/jejuPackage.jsp";
		//next = "/PhoenixJeju/resort/reservation/re_package.jsp";
		System.out.println(next);
		System.out.println("디비에서 넘어온 첫번째 사용자 이름" + userInfo.get(0).getUser_id());
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
		
		
		

	
	}
	
}

	
	
	


