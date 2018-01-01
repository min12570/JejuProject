package packageInfo;

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
 * Servlet implementation class PackageServlet
 */
@WebServlet({ "/PackageServlet", "/Package" })
public class PackageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Biz biz;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PackageServlet() {
        super();
        // TODO Auto-generated constructor stub
        biz = new Biz();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("dbServlet");
		String db = request.getParameter("db");
		String next="";
		ArrayList<PackageInfoVO> list = new ArrayList<>();
		// 아름아 이부분 잠시 수정했오 ArrayList<Object> list = new ArrayList<>();
		//ArrayList list = new ArrayList();
		
		if(db.equals("all")) {
			Connection con = (Connection) biz.getConnection();//mySql ����
			 
			Statement st = null;
			try {
				st = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
	        String sql;
	        sql = "select * FROM package;";

	        ResultSet rs = null;
			try {
				rs = st.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        String sqlRecipeProcess = "";
	        try {
				while (rs.next()) {
				    //sqlRecipeProcess = rs.getString("p_name");
				    //list.add(sqlRecipeProcess);
					int p_id = rs.getInt("p_id");
					String p_name = rs.getString("p_name");
					int p_weekdaycost = rs.getInt("p_weekdaycost");
					int p_weekendcost = rs.getInt("p_weekendcost");
					int p_percost = rs.getInt("p_percost");
					int p_cost = rs.getInt("p_cost");
					String p_region = rs.getString("p_region");
					String p_image = rs.getString("p_image");
					String p_content = rs.getString("p_content");
					String p_url = rs.getString("p_url");
					
					PackageInfoVO pack = new PackageInfoVO(p_id,p_name,p_weekdaycost,p_weekendcost,p_percost,p_cost,p_region,p_image,p_content,p_url);
					
					list.add(pack);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        System.out.println(list.size());
	        request.setAttribute("packList", list);
	        
	      // request.setAttribute("pName", "임의로 넣은 값");
	      // request.setAttribute("aa", "넘어가라");
	        
			biz.close(con);//connection end	
		}
		
		//정민 아 이 부분이얌!!
		
		next = "/re_package.jsp";
		System.out.println(next);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
