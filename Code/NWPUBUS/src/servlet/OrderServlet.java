package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MorderDAO;
import dao.UserDAO;
import entity.MOrder;
import entity.User;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static MorderDAO morderDAO = new MorderDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("id");
//		String identity = request.getParameter("Identity");
//		String uid = request.getParameter("Uid");
//		String uname = request.getParameter("Uname");
//		String email = request.getParameter("Email");
//	    String password = request.getParameter("Password");
		String ltime =  request.getParameter("ltime");
		String lnum = request.getParameter("lnum");
		String lplace = request.getParameter("lplace");
//	    User user = new User(uname,uid,password,email,identity);
//	  	userdao.add(user);
	  	response.sendRedirect("Teacher.jsp");
//	    System.out.println("身份："+identity);
	    System.out.println("学号/工号："+uid);
	    System.out.println("时间："+ltime);
	    System.out.println("人数："+lnum);
	    System.out.println("地址："+lplace);
}
}