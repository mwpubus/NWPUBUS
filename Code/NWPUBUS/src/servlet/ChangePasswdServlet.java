package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

public class ChangePasswdServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserDAO ud = new UserDAO();
	
	public ChangePasswdServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String uid = request.getParameter("inputid");
		String passwd = request.getParameter("Password");
		String vertify = request.getParameter("vertify");
		
		if(vertify.equals("698045")) {
			ud.update(uid, passwd);
			request.getRequestDispatcher("Login.jsp").forward(request,response);
		} else {
			request.getRequestDispatcher("ChangePasswd3.jsp").forward(request,response);
		}
		
	}
}
