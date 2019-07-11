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
			ps.setString(6, start);
			ps.setString(7, "否");
			ps.setInt(8, 0);
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
	
	public int selectRemain(String license, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from dwork where license = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, license);
			ps.setString(2, day);
			ps.setString(3, time);
			ResultSet rs = ps.executeQuery();
			int remain = 0;
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
	 * update 预约人数
	 */
	public void updateRemain(String license, String day, String time,int remain) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update dwork set remain = ? where license = ? and day = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, remain);
			ps.setString(2, license);
			ps.setString(3, day);
			ps.setString(4, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * update 司机
	 */
	public void updateDriver(String nname, String uid, String day ,String name) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update dwork set name = ? , u_id =?where  day = ? and name = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, nname);
			ps.setString(2, uid);
			ps.setString(3, day);
			ps.setString(4, name);
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
	
	public void addQueue(String time, String day, String no, int num, String start) {
		try {
			int n = 45;
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from dwork where time = ? and day = ? and license = ? and start = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, day);
			ps.setString(3, no);
			ps.setString(4, start);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt("remain");
			}
			n = n + num;
			
			sql = "update dwork set remain = ? where time = ? and day = ? and license = ? and start = ?";
			ps = c.prepareStatement(sql);
			ps.setInt(1, n);
			ps.setString(2, time);
			ps.setString(3, day);
			ps.setString(4, no);
			ps.setString(5, start);
			
			ps.execute();
			
			DBHelper.closeConnection(c, ps, rs);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
