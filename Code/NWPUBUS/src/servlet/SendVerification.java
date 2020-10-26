package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import utils.*;


public class SendVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendVerification() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("inputid");
		UserDAO ud = new UserDAO();
		String to = ud.get(id).getTel();
		Send.sendEmail(to);
		
		request.setAttribute("inputid", id);
		request.setAttribute("Password", request.getParameter("Password"));
		request.setAttribute("passwordConfirm", request.getParameter("passwordConfirm"));
		request.getRequestDispatcher("ChangePasswd3.jsp").forward(request,response);
	}
}
