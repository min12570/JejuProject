package reservationInfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet({ "/ReservationServlet", "/Reservation" })
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		String title = request.getParameter("title");
		String img = request.getParameter("img");
		
		String next="";
		
		request.setAttribute("title", title);
       // request.setAttribute("img", img);
        
		next = "/PhoenixJeju/resort/reservation/re_package_complete.jsp?"+img;
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);		
	}

}
