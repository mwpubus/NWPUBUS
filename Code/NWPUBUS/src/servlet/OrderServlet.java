package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DworkDAO;
import dao.MorderDAO;
import dao.TbusDAO;
import dao.TobusDAO;
import dao.UserDAO;
import entity.MOrder;
import entity.User;
import utils.DBHelper;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static MorderDAO morderDAO = new MorderDAO();
	 static TobusDAO tobusDAO = new TobusDAO();
	 static TbusDAO tbusDAO = new TbusDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("id");//用户id
		String ltime = request.getParameter("ltime");//总时间
		String clock =  ltime.substring(ltime.length()-8);//具体几点
		String day = ltime.substring(0, 3);//星期
		String lnum = request.getParameter("lnum");
		String lplace = request.getParameter("lplace");
		String license = request.getParameter("license");
		String qidian = lplace.substring(0, 2);//出发点
		String a = lnum.substring(0, lnum.length()-3);
		int remain=Integer.parseInt(a)+1;
		
		User user = new UserDAO().get(uid);
		String name =user.getName();
		String utype = user.getUtype();//身份
	
		
		MOrder o1 = new MOrder();
		o1.setLicense(license);
		o1.setUid(uid);
		o1.setUtype(utype);
		o1.setOtime(clock);
		o1.setStart(lplace.substring(0, 4));
		o1.setDay(day);
		
			
		if (new MorderDAO().ifOrder(o1)) {

			System.out.println("有此订单");
			if (utype.equals("教师")) {
				if (lplace.substring(0, 4).equals("长安校区")) {
					//out.print("<script>alert('预约失败，此时间不可重复预约！');window.location.href='Teacher.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约失败，不可重复预约', 'error');$('button:contains(\"OK\")').click(function () {window.location.href='Teacher.jsp'})"
					           +"</script></body></html>");
				} else {
					//out.print("<script>alert('预约失败，此时间不可重复预约！');window.location.href='TeacherY-C.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约失败，不可重复预约', 'error');$('button:contains(\"OK\")').click(function () {window.location.href='TeacherY-C.jsp'})"
					           +"</script></body></html>");
				}
			} else {
				if (lplace.substring(0, 4).equals("长安校区")) {
					//out.print("<script>alert('预约失败，此时间不可重复预约！');window.location.href='Student.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约失败，不可重复预约', 'error');$('button:contains(\"OK\")').click(function () {window.location.href='Student.jsp'})"
					           +"</script></body></html>");
				} else {
					//out.print("<script>alert('预约失败，此时间不可重复预约！');window.location.href='StudentY-C.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约失败，不可重复预约', 'error');$('button:contains(\"OK\")').click(function () {window.location.href='StudentY-C.jsp'})"
					           +"</script></body></html>");
				}
			}
		} else {
			
			morderDAO.addOrder(o1);
			
			
			// //
			////
			if (utype.equals("教师")) {
				Date date = new Date();
				String xingqi = "星期" + "日一二三四五六日一二三四五六".charAt(date.getDay());
				String xingqi1 = "星期" + "日一二三四五六日一二三四五六".charAt(date.getDay()+1);
				System.out.println(xingqi);
				System.out.println(xingqi1);
				new DworkDAO().updateRemain(license, day, clock, remain);
				if(day.equals(xingqi))
				{
					if(remain>=65)
					{
						try {
						Connection c = DBHelper.getInstance().getConnection();
						String sql = "select name from tbus where start=? and delay=?";
						PreparedStatement ps = c.prepareStatement(sql);
						ps.setString(1, qidian);
						ps.setString(2, "空闲");
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							String tibanren = rs.getString(1);
							tbusDAO.update1(clock, "加班", remain-45,tibanren);
							tbusDAO.updateRemain(license, day, clock, 45);
							
						
							break;
						}
						c.close();
						} catch(Exception e) {
							e.printStackTrace();
						} 
					}
					else
						{tbusDAO.updateRemain(license, day, clock, remain);
						
						}
					
					
				}
				if(day.equals(xingqi1))
				{
					if(remain>=65)
					{
						try {
						Connection c = DBHelper.getInstance().getConnection();
						String sql = "select name from tobus where start=? and delay=?";
						PreparedStatement ps = c.prepareStatement(sql);
						ps.setString(1, qidian);
						ps.setString(2, "空闲");
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							String tibanren = rs.getString(1);
							tobusDAO.update1(clock, "加班", remain-45,tibanren);
							tobusDAO.updateRemain(license, day, clock, 45);
							
						
							break;
						}
						c.close();
						} catch(Exception e) {
							e.printStackTrace();
						} 
					}
					else
						{tobusDAO.updateRemain(license, day, clock, remain);
						
						}
				}
				if (lplace.substring(0, 4).equals("长安校区")) {
					//out.print("<script>alert('预约成功！');window.location.href='Teacher.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约成功', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Teacher.jsp'})"
					           +"</script></body></html>");
				} else {
					//out.print("<script>alert('预约成功！');window.location.href='TeacherY-C.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约成功', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='TeacherY-C.jsp'})"
					           +"</script></body></html>");
				}
			} else {
				if(remain>=65)
				{
					try {
					Connection c = DBHelper.getInstance().getConnection();
					String sql = "select name from tobus where start=? and delay=?";
					PreparedStatement ps = c.prepareStatement(sql);
					ps.setString(1, qidian);
					ps.setString(2, "空闲");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						String tibanren = rs.getString(1);
						tobusDAO.update1(clock, "加班", remain-45,tibanren);
						tobusDAO.updateRemain(license, day, clock, 45);
						
						
						break;
					}
					c.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
				else
					{tobusDAO.updateRemain(license, day, clock, remain);
					
					}

				if (lplace.substring(0, 4).equals("长安校区")) {
					//out.print("<script>alert('预约成功！');window.location.href='Student.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约成功', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='Student.jsp'})"
					           +"</script></body></html>");
				} else {
					//out.print("<script>alert('预约成功');window.location.href='StudentY-C.jsp'</script>");
					out.print("<html><head><meta charset=\"ISO-8859-1\"><title>预约消息</title>"
					           +"<link href=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css\" rel=\"stylesheet\">"
					           +"<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>"
					           +"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js\"></script>"
					           +"</head><body><script type=\"text/javascript\">"
					           +"swal('预约消息', '预约成功', 'success');$('button:contains(\"OK\")').click(function () {window.location.href='StudentY-C.jsp'})"
					           +"</script></body></html>");
				}
			}
				  	
					System.out.println("姓名"+name);
					 System.out.println("学号/工号："+uid);
				    System.out.println("身份："+utype);
				   
				    System.out.println("时间："+clock);
				    System.out.println("地址："+lplace.substring(0, 4));
				    System.out.println("星期："+day);
		}
		


		
		

}
}
