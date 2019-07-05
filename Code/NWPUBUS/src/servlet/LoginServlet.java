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
		session.setAttribute("id", id);//这里改了
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
			if(utype.equals("student")) {
				request.getRequestDispatcher("Teacher.jsp").forward(request,response);
			} else if(utype.equals("teacher")) {
				request.getRequestDispatcher("Teacher.jsp").forward(request,response);
			} else if(utype.equals("volunteer")) {
				request.getRequestDispatcher("Teacher.jsp").forward(request,response);
			} else {
				request.getRequestDispatcher("Teacher.jsp").forward(request,response);
			}
				
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('密码错误！');window.location.href='Login.jsp'</script>");
//			response.sendRedirect("Login.jsp");
		}
	}
	
}
