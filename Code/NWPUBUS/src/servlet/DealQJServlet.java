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
public class DealQJServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static LeaveDAO leaveDAO = new LeaveDAO();
	static BbusDAO busDAO = new BbusDAO();
	static DworkDAO   dworkDAO = new DworkDAO();
	static UserDAO   userDAO = new UserDAO();
	static TobusDAO tobusDAO = new TobusDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
        String day = (String) request.getParameter("day");
        String name = (String) request.getParameter("name");
        String NewD = (String) request.getParameter("NewD");
        String nuid = userDAO.getUID(NewD);  
        String uid = userDAO.getUID(name);
        System.out.println("新司机id"+nuid);
        System.out.println("新司机名字"+NewD);
        System.out.println("司机"+name);
        System.out.println("请假日期"+day);
        //新司机替班
        leaveDAO.deleteFeedBack(name); //删除请假信息
        System.out.println("删除");
        System.out.println("司机id"+uid);
        System.out.println("司机名字"+name);
        tobusDAO.updateDriver(NewD, nuid,name);
        tobusDAO.updateNoDriver(NewD, uid, name);
        System.out.println("修改");
        response.sendRedirect("AdminDriverQJ.jsp");
        
        
       
	}
}
