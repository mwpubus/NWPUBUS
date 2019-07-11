package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.MOrder;
import utils.DBHelper;


/**
 * OrderDAO 对预约表的数据操作类

 *
 */
public class MorderDAO {
	
	/**
	 * 增加一条预约
	 * @param 姓名，学号/工号，用户类型，预约时间
	 */
	public void addOrder(MOrder order) {
		try {
			//建立数据库连接
			Connection c = DBHelper.getInstance().getConnection();
			String priority = "low";
			if(order.getUtype().equals("教师")) {
				priority = "high";
			}
			int remain = new DworkDAO().selectRemain(order.getLicense(), order.getDay(), order.getOtime());
			String status="";
			if(remain>=40)
				status="dealing";
			else
				status="success";
			String sql = "insert into morder values (?,?,?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, order.getLicense());
			ps.setString(2, order.getUid());
			ps.setString(3, order.getUtype());
			ps.setString(4, order.getOtime());
			ps.setString(5, priority);
			ps.setString(6, order.getStart());
			ps.setString(7, order.getDay());
			ps.setString(8, status);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 清空预约表
	 */
	public void EmptyOrder() {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from morder";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 取消预约
	 * @param 学号/工号，预约时间
	 */
	public void deleteOrder(String uid, String license,String time,String day) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from morder where license = ? and u_id = ? and otime = ? and day = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, license);
			ps.setString(2, uid);
			ps.setString(3, time);
			ps.setString(4, day);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 预约变更
	 */
	public void updateOrder(String uid, String license,String time,String day, String newtime) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update morder set otime = ? where license = ? u_id = ? and otime = ? and day = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,newtime);
			ps.setString(2, license);
			ps.setString(3, uid);
			ps.setString(4, time);
			ps.setString(5, day);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param order
	 * @return
	 */
	public boolean ifOrder(MOrder order)
	{
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from morder where (license=?) and (u_id=?) and (day=?) and (otime=?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, order.getLicense());
			ps.setString(2, order.getUid());
			ps.setString(3, order.getDay());
			ps.setString(4,order.getOtime());
			ResultSet rs = ps.executeQuery();
			
			if(!rs.next()){
				c.close();
				return false;}
			else {c.close();
				return true;}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 return true;
	}

}
