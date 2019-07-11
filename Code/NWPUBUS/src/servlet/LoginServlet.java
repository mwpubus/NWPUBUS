package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import entity.*;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDAO ud = new UserDAO();
	private User user = new User();
	
	public LoginServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String id = request.getParameter("inputuID");
		String password = request.getParameter("inputPassword");
		session.setAttribute("id", id);//设置idsession
		boolean f = ud.verify(id, password);
		if(f) {
			user = ud.get(id);
			session.setAttribute("user", user);
			String[] chk = request.getParameterValues("checkboxname");
			
			if(chk != null) {
				System.out.println("yes");
				Cookie userid = new Cookie("userid", id);
				userid.setMaxAge(259200);
				Cookie passwd = new Cookie("password", password);
				passwd.setMaxAge(259200);
				response.addCookie(userid);
			    response.addCookie(passwd);
			} 
			else {
				System.out.println("no");
				Cookie[] cookies = request.getCookies();
				String s;
				for(Cookie cookie:cookies) {

					s = cookie.getName();
					if(s.equals("password")) {

						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
			      }
			}
			
			String utype = user.getUtype();
			if(utype.equals("学生")) {
				System.out.println(utype);
				request.getRequestDispatcher("Student.jsp").forward(request,response);
			} else if(utype.equals("教师")) {
				
				System.out.println(utype);
				request.getRequestDispatcher("Teacher.jsp").forward(request,response);
			} else if(utype.equals("司机")) {
				System.out.println(utype);
				request.getRequestDispatcher("Driver.jsp").forward(request,response);
			} else if(utype.equals("管理员")) {
				System.out.println(utype);
				request.getRequestDispatcher("Admin.jsp").forward(request,response);
			}else{
				System.out.println(utype);
				request.getRequestDispatcher("DDY.jsp").forward(request,response);
			}
				
		} else {
			PrintWriter out = response.getWriter();
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>登陆消息</title>"
           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
           +"</head><body><script type=\"text/javascript\">"
           +"swal('登陆消息', '密码错误', 'error');$('button:contains(\"OK\")').click(function () {window.location.href='Login.jsp'})"
           +"</script></body></html>");

//			response.sendRedirect("Login.jsp");
		}
	}
	
}
