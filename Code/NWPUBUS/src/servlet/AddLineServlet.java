package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.*;
import utils.DBHelper;

public class AddLineServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static TbusDAO tbusDAO = new TbusDAO();
	public AddLineServlet() {
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String time = (String)session.getAttribute("Time");
		String no = (String)session.getAttribute("no");
		String start = (String)session.getAttribute("start");
		int num = Integer.valueOf(request.getParameter("addp"));
		int shuliang = Integer.valueOf(request.getParameter("shuliang"))+num;
		System.out.println("1" + time);
		System.out.println("2" + no);
		System.out.println("3" + shuliang);
		
		Date date = new Date();
		String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());

		if(shuliang>=65)
		{
			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select name from tbus where start=? and delay=?";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, start);
				ps.setString(2, "空闲");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					String tibanren = rs.getString(1);
					tbusDAO.update1(time,"加班", shuliang-45,tibanren);
					tbusDAO.updateRemain(no, xingqi, time, 45);
					System.out.println("替班的"+tibanren );
					break;
				}
				c.close();
				} catch(Exception e) {
					e.printStackTrace();
				} 
		}else{
		TbusDAO tbd = new TbusDAO();
		tbd.addQueue(time, xingqi, no, num, start);
		}
		if(start.equals("长安")) {
			request.getRequestDispatcher("DDY.jsp").forward(request,response);
		} else {
			request.getRequestDispatcher("DDY2.jsp").forward(request,response);
		}
	}
}
