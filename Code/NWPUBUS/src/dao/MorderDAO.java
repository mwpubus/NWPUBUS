package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import utils.DBHelper;


/**
 * OrderDAO 对预约表的数据操作类
 * @author 李云飞
 *
 */
public class MorderDAO {
	
	/**
	 * 增加一条预约
	 * @param 姓名，学号/工号，用户类型，预约时间
	 */
	public void addOrder(String name, String uid, String utype, String otime) {
		try {
			//建立数据库连接
			Connection c = DBHelper.getInstance().getConnection();
			String priority = "low";
			if(utype.equals("teacher")) {
				priority = "high";
			}
			String sql = "insert into morder values (?, ?, ?, ?, ?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, uid);
			ps.setString(3, utype);
			ps.setString(4, otime);
			ps.setString(5, priority);
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
	public void deleteOrder(String uid, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from morder where u_id = ? and otime = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 预约变更
	 */
	public void updateOrder(String uid, String time, String newtime) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update morder set otime = ? where u_id = ? and otime = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,newtime);
			ps.setString(2, uid);
			ps.setString(3, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
