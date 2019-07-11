package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utils.DBHelper;
import entity.*;

public class TbusDAO {

	BbusDAO bd = new BbusDAO();
	public int selectRemain(String license, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from tbus where license = ? and day = ? and time = ?";
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
	public void update1(String time,String delay,int remain,String name)
	{
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update tbus set time = ?,delay=?,remain = ? where name=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, delay);
			ps.setInt(3, remain);
			ps.setString(4, name);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * update 预约人数
	 */
	public void updateRemain(String license, String day, String time,int remain) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update tbus set remain = ? where license = ? and day = ? and time = ?";
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
	 * add
	 */
	public void adtbus(String name, String uid, String day, String time, String start) {

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String license = bd.getLicense(name);
			String sql = "insert into tbus values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
	
	public void deleteAll()
	{
		try {
			Connection c = DBHelper.getInstance().getConnection();

			String sql = "delete from tbus";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Dwork> getTobus() {
		List<Dwork> lists = new ArrayList<>();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from tobus";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Dwork dw = new Dwork();
				dw.setName(rs.getString("name"));
				dw.setUid(rs.getString("u_id"));
				dw.setDay(rs.getString("day"));
				dw.setTime(rs.getString("time"));
				dw.setStart(rs.getString("start"));
				
				lists.add(dw);
			}
			
			DBHelper.closeConnection(c, ps, rs);
			
			return lists;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return lists;
	}

	
	public void replace()
	{
		List<Dwork> lists = getTobus();
		for(int i=0;i<=lists.size()-1;i++)
		{
			Dwork dw = lists.get(i);
			adtbus(dw.getName(),dw.getUid(),dw.getDay(),dw.getTime(),dw.getStart());
		}
	}
	public static void main(String[] args) {
		new TbusDAO().adtbus("孙承志", "1", "星期五", "12:00:52", "长安");
	}
	
	public void addQueue(String time, String day, String no, int num, String start) {
		try {
			int n = 45;
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from tbus where time = ? and day = ? and license = ? and start = ?";
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
			
			sql = "update tbus set remain = ? where time = ? and day = ? and license = ? and start = ?";
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
