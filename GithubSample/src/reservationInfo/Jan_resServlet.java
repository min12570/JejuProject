package reservationInfo;

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
import packageInfo.PackageInfoVO;

/**
 * Servlet implementation class Jan_resServlet
 */
@WebServlet({ "/Jan_resServlet", "/Jan_res" })
public class Jan_resServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Biz biz;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Jan_resServlet() {
        super();
        // TODO Auto-generated constructor stub
        biz = new Biz();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String db = request.getParameter("db");
		String next="";
		ArrayList<Jan_resInfoVO> list = new ArrayList<Jan_resInfoVO>();		
		ArrayList<String> jan_res = new ArrayList<String>();
		
		if(db.equals("selectNalja")) {
			System.out.println("jan_DB");
			Connection con = (Connection) biz.getConnection();			
			Statement st = null;
			
			jan_res.add("로얄더블온돌");
			jan_res.add("로얄더블트윈");
			jan_res.add("로얄트윈온돌");
			jan_res.add("로얄스위트A");
			jan_res.add("로얄스위트B");
			
			request.setAttribute("jan_resName", jan_res);
			
			next = "/PhoenixJeju/jan_res.jsp";
		}
	
			
		System.out.println(next);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
