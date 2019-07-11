package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
public class FeedbkCancel extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public FeedbkCancel() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uid = request.getParameter("uid");
		String title = request.getParameter("title");
		String time = request.getParameter("time");
		FeedBackDAO fbd = new FeedBackDAO();
		time = time.substring(0, 10) + " " + time.substring(10);
		System.out.println(uid);
		System.out.println(title);
		System.out.println(time);
		fbd.deleteFeedback(uid, title, time);
		
		request.getRequestDispatcher("AdminFeedback.jsp").forward(request,response);
	}
		
		
		
	
}
