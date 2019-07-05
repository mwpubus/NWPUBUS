package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

public class RegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	 static UserDAO userdao = new UserDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String identity = request.getParameter("Identity");
		String uid = request.getParameter("Uid");
		String uname = request.getParameter("Uname");
		String email = request.getParameter("Email");
	    String password = request.getParameter("Password");
	    User user = new User(uname,uid,password,email,identity);
	  	userdao.add(user);
	  	response.sendRedirect("Login.jsp");
	    System.out.println("身份："+identity);
	    System.out.println("学号："+uid);
	    System.out.println("姓名："+uname);
	    System.out.println("邮箱："+email);
	    System.out.println("密码："+password);

		
	}
}