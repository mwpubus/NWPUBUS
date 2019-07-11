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

public class FeedBackServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	static FeedBackDAO feedbackDAO = new FeedBackDAO();
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		response.setContentType("text/html; charset=UTF-8");
		String uid = (String) session.getAttribute("id");//用户id

	
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		Date time =new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");
		System.out.println("反馈时间"+dateFormat.format(time));
		FeedBack feedback = new FeedBack(uid,content,dateFormat.format(time),title);
		feedbackDAO.addFeedBack(feedback);
		User user = (User)session.getAttribute("user");
		if(user.getUtype().equals("学生"))
		{
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>反馈信息</title>"
			           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
			           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
			           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
			           +"</head><body><script type=\"text/javascript\">"
			           +"swal('反馈信息', '反馈成功，感谢您的意见', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Student.jsp'})"
			           +"</script></body></html>");
		}
		else if(user.getUtype().equals("教师"))
		{
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>反馈信息</title>"
			           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
			           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
			           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
			           +"</head><body><script type=\"text/javascript\">"
			           +"swal('反馈信息', '反馈成功，感谢您的意见', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Teacher.jsp'})"
			           +"</script></body></html>");
		}else if(user.getUtype().equals("司机"))
		{
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>反馈信息</title>"
			           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
			           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
			           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
			           +"</head><body><script type=\"text/javascript\">"
			           +"swal('反馈信息', '反馈成功，感谢您的意见', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Driver.jsp'})"
			           +"</script></body></html>");
		}if(user.getUtype().equals("调度员"))
		{
			out.print("<html><head><meta charset=\"ISO-8859-1\"><title>反馈信息</title>"
			           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
			           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
			           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
			           +"</head><body><script type=\"text/javascript\">"
			           +"swal('反馈信息', '反馈成功，感谢您的意见', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='DDY.jsp'})"
			           +"</script></body></html>");
		}
		
	}
}
