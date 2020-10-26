package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VworkDAO;

public class DDYCancelServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public DDYCancelServlet() {
		super();
	}
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String uid = req.getParameter("uid");
		String time = req.getParameter("time");
		String place = req.getParameter("place");
		System.out.println(uid);
		System.out.println(time);
		System.out.println(place);
		
		VworkDAO vd = new VworkDAO();
		vd.delete(uid, time, place);
		if(place.equals("长安")) {
			req.getRequestDispatcher("AdminDDY.jsp").forward(req,res);
		} else {
			req.getRequestDispatcher("AdminDDYY-C.jsp").forward(req,res);
		}
	}
}
