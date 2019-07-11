package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


import entity.*;
import utils.DBHelper;

public class LeaveDAO {

	public void addLeave(Leave leave) {
		try {
			//建立数据库连接
			Connection c = DBHelper.getInstance().getConnection();
			
			
			String sql = "insert into askleave values (?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, leave.getName());
			ps.setString(2, leave.getDay());
			ps.setString(3, leave.getContent());
			ps.setString(4, leave.getTime());
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void EmptyLeave() {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from askleave";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteFeedBack(String name) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from askleave where name=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
		
			ps.execute();
			c.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

	
}
