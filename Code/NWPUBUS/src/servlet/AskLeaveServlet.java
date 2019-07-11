package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;

import entity.*;

public class AskLeaveServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	static LeaveDAO leaveDAO = new LeaveDAO();
	static BbusDAO busDAO = new BbusDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		
		String uid = (String) session.getAttribute("id");//用户id
        User user = (User)session.getAttribute("user");//用户名
	
		
		String content = request.getParameter("reason");//请假原因
		String time = request.getParameter("ltime");
		String day = time;
		
		Date ltime =new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");
		System.out.println("司机姓名"+user.getName());
		System.out.println("请假日期"+time);
		System.out.println("请假原因"+content);
		System.out.println("发出请假的时间"+dateFormat.format(ltime));
		Leave leave = new Leave(user.getName(),time,content,dateFormat.format(ltime));
		
		leaveDAO.addLeave(leave);
		new TobusDAO().update("审核中", user.getName());
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>反馈信息</title>"
			           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
			           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
			           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
			           +"</head><body><script type=\"text/javascript\">"
			           +"swal('请假信息', '提交成功', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Driver.jsp'})"
			           +"</script></body></html>");
		
		
	}

}
