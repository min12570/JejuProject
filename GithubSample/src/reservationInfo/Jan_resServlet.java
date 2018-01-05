package reservationInfo;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
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
		String db3 = request.getParameter("db3");
		String next="";
		ArrayList<Jan_resInfoVO> list = new ArrayList<Jan_resInfoVO>();		
		ArrayList<String> jan_res = new ArrayList<String>();
		// cal_index.html의 자바스크립트에서 넘긴 데이터 받기 2018-01-01
		
		String check_inGo = request.getParameter("check_inGo");
		String check_outGo = request.getParameter("check_outGo");
		String cost = request.getParameter("cost");
		//location.href="main.jan_res?db3=selectNalja?check_inGo="+check_inGo + "&check_outGo=" + check_outGo;
System.out.println(check_inGo+","+check_outGo);
		// 2018-01-01에서 '-'값 제거 ex)20180101
		//String check_in = check_inGo.substring(0, 4) + check_inGo.substring(5, 7) + check_inGo.substring(8, 10);
		//String check_out = check_outGo.substring(0, 4) + check_outGo.substring(5, 7) + check_outGo.substring(8, 10);

		// 체크인 to 체크아웃 값 콘솔에서 확인
		//System.out.println(check_in + " to " + check_out);
		if(db3.equals("selectNalja")) {
			System.out.println("jan_DB");
			Connection con = (Connection) biz.getConnection();			
			Statement st = null;
			
			   ResultSet rs = null;
			 String sql;
			 int checkIn = Integer.parseInt(check_inGo); // 체크인 날짜값
				int checkOut = Integer.parseInt(check_outGo); // 체크아웃 날짜값
				int intCost = Integer.parseInt(cost);
			 sql = "	SELECT CASE D_ONDOL WHEN D_ONDOL > 0 THEN 0\r\n" + 
			 		"	ELSE 1 END 	 AS D_ONDOL	 		\r\n" + 
			 		"    , CASE D_TWIN WHEN D_TWIN > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END      AS D_TWIN\r\n" + 
			 		"    , CASE T_ONDOL WHEN T_ONDOL > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END     AS T_ONDOL\r\n" + 
			 		"    , CASE O_ONDOL WHEN O_ONDOL > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END     AS O_ONDOL\r\n" + 
			 		"    , CASE SUITE_A WHEN SUITE_A > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END     AS SUITE_A\r\n" + 
			 		"    , CASE SUITE_B WHEN SUITE_B > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END     AS SUITE_B\r\n" + 
			 		"    , CASE SUITE_O WHEN SUITE_O > 0 THEN 0\r\n" + 
			 		"    ELSE 1 END     AS SUITE_O\r\n" + 
			 		"    FROM JAN_RES\r\n" + 
			 		"    WHERE jan_day BETWEEN "+checkIn+" AND "+checkOut+"; ";
			 
			 
	   
	        System.out.println(sql);
	        try {
				st = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				//st.executeQuery(sql);
				//st.setInt(checkIn, checkOut);
			 	rs = st.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("오니?");
	        String sqlRecipeProcess = "";
	        boolean []Empty = {true,true,true,true,true,true,true};
	        try {
	        	while(rs.next()) {
	        		System.out.println("오니?");
	        		if(rs.getInt("D_ONDOL")==0)
	        			Empty[0] = false;
	        		else System.out.println("ㄹㄹ");
	        		if(rs.getInt("D_TWIN")==0)
	        			Empty[1] = false;
	        		if(rs.getInt("T_ONDOL")==0)
	        			Empty[2] = false;
	        		if(rs.getInt("O_ONDOL")==0)
	        			Empty[3] = false;
	        		if(rs.getInt("SUITE_A")==0)
	        			Empty[4] = false;
	        		if(rs.getInt("SUITE_B")==0)
	        			Empty[5] = false;
	        		if(rs.getInt("SUITE_O")==0)
	        			Empty[6] = false;
	        	}
	        	for(int i=0;i<7;i++) {
	        		System.out.println(Empty[i]);
	        	}
	        	if(Empty[0])
	        		jan_res.add("로얄더블온돌");
	        	if(Empty[1])
	        		jan_res.add("로얄더블트윈");
	        	if(Empty[2])
	        		jan_res.add("로얄트윈온돌");
	        	if(Empty[3])
	        		jan_res.add("로얄오션온돌");
	        	if(Empty[4])
	        		jan_res.add("로얄스위트A");
	        	if(Empty[5])
	        		jan_res.add("로얄스위트B");
	        	if(Empty[6])
	        		jan_res.add("로얄스위트O");
	        	
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       int count = checkIn- checkOut;
	        request.setAttribute("jan_resName", jan_res);
	        int stay = checkOut - checkIn;
	        request.setAttribute("stay", stay);
	        request.setAttribute("intCost", intCost);
			
			//next = "./syncSelect.jsp";//resort/reservation/re_package.jsp";
		}
		//request.getRequestDispatcher(next);

		 ServletContext context =getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/PhoenixJeju/resort/reservation/syncSelect.jsp"); //넘길 페이지 주소
        dispatcher.forward(request, response);
		
	//	System.out.println(next);
	//	RequestDispatcher rd = request.getRequestDispatcher(next);
	//	rd.forward(request, response);
	}

}
