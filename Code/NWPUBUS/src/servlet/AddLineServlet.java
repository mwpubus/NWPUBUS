package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;

public class AddLineServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public AddLineServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String time = (String)session.getAttribute("Time");
		String no = (String)session.getAttribute("no");
		String start = (String)session.getAttribute("start");
		int num = Integer.valueOf(request.getParameter("addp"));
		
		System.out.println("1" + time);
		System.out.println("2" + no);
		System.out.println("3" + num);
		
		Date date = new Date();
		String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());
		
		TbusDAO tbd = new TbusDAO();
		tbd.addQueue(time, xingqi, no, num, start);
		if(start.equals("长安")) {
			request.getRequestDispatcher("DDY.jsp").forward(request,response);
		} else {
			request.getRequestDispatcher("DDY2.jsp").forward(request,response);
		}
	}
}
