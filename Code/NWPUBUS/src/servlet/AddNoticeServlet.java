package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import com.sun.java_cup.internal.runtime.Symbol;

import dao.NoticeDAO;

public class AddNoticeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AddNoticeServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String time = request.getParameter("time");
		
			NoticeDAO nd = new NoticeDAO();
			nd.EmptyFeedBack();
			System.out.println("content:"+content);
			nd.addNotice(title, content, time);
		
			request.getRequestDispatcher("Admin.jsp").forward(request, response);
		
		

	}
}
