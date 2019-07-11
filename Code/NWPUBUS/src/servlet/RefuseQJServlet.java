package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LeaveDAO;
import dao.TobusDAO;

public class RefuseQJServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public RefuseQJServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		System.out.println(name);
		TobusDAO td = new TobusDAO();
		td.update("正常工作", name);
		LeaveDAO ld = new LeaveDAO();
		ld.deleteFeedBack(name);
		System.out.println("llt is sb");
		request.getRequestDispatcher("AdminDriverQJ.jsp").forward(request,response);
		
	}
}
