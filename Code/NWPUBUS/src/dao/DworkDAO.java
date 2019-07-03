package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.DBHelper;


public class DworkDAO {

	BbusDAO bd = new BbusDAO();
	
	/**
	 * add
	 */
	public void addWork(String name, String uid, String day, String time, String start) {

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String license = bd.getLicense(name);
			String sql = "insert into dwork values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, uid);
			ps.setString(3, day);
			ps.setString(4, time);
			ps.setString(5, license);
			ps.setString(6, "no");
			ps.setInt(7, 45);
			ps.setString(8, start);
			ps.setInt(9, 0);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * delete
	 */
	public void deleteWork(String uid, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from dwork where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, day);
			ps.setString(3, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * update 剩余位置
	 */
	public void updateRemain(String uid, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from dwork where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, day);
			ps.setString(3, time);
			ResultSet rs = ps.executeQuery();
			int remain = 45;
			if(rs.next()) {
				remain = rs.getInt("remain");
			}
			remain -= 1;
			sql = "update dwork set remain = ? where u_id = ? and day = ? and time = ?";
			ps = c.prepareStatement(sql);
			ps.setInt(1, remain);
			ps.setString(2, uid);
			ps.setString(3, day);
			ps.setString(4, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * update 排队人数
	 */
	public void updateQueue(String uid, String day, String time, int queue) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update dwork set queue = ? where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, queue);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 批准请假
	 */
	public void Approve(String uid, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update dwork set delay = '是' where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, day);
			ps.setString(3, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * （系统）查询剩余位置
	 */
	public int selectRemain(String uid, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from dwork where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, day);
			ps.setString(3, time);
			ResultSet rs = ps.executeQuery();
			int remain = 45;
			if(rs.next()) {
				remain = rs.getInt("remain");
			}
			c.close();
			return remain;
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	/**
	 * （系统）查询排队人数
	 */
	public int selectQueue(String uid, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select queue from dwork where u_id = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, day);
			ps.setString(3, time);
			ResultSet rs = ps.executeQuery();
			int queue = 0;
			if(rs.next()) {
				queue = rs.getInt("queue");
			}
			c.close();
			return queue;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
