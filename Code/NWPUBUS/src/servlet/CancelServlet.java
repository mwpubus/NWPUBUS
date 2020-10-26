package servlet;

import java.io.IOException;
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
import entity.User;

public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");//用户id
		String day = request.getParameter("lday");//星期几
		String license = request.getParameter("license");//校车编号
		String ltime = request.getParameter("ltime");//几点
		System.out.println("汽车编号"+license);
		System.out.println("天"+day);
		System.out.println("几点："+ltime);
		System.out.println("id"+user.getUid());
		new MorderDAO().deleteOrder(user.getUid(), license, ltime, day);;
		
		
		
		
	
		
		if (user.getUtype().equals("教师")) {
			int remain = new DworkDAO().selectRemain(license, day, ltime)-1;
			new DworkDAO().updateRemain(license, day, ltime, remain);
			Date date = new Date();
			String xingqi = "星期" + "日一二三四五六日一二三四五六".charAt(date.getDay());
			String xingqi1 = "星期" + "日一二三四五六日一二三四五六".charAt(date.getDay()+1);
			new DworkDAO().updateRemain(license, day, ltime, remain);
			if(day.equals(xingqi))
			{
				int remain1 = new TbusDAO().selectRemain(license, day, ltime)-1;
				new TbusDAO().updateRemain(license, day, ltime, remain1);
			}
			if(day.equals(xingqi1))
			{
				int remain2 = new TobusDAO().selectRemain(license, day, ltime)-1;
				new TobusDAO().updateRemain(license, day, ltime, remain2);
			}
			response.sendRedirect("TeacherCancel.jsp");
		}else{
			int remain3 = new TobusDAO().selectRemain(license, day, ltime)-1;
			new TobusDAO().updateRemain(license, day, ltime, remain3);

			response.sendRedirect("StudentCancel.jsp");
		}
		
		
	}
}
