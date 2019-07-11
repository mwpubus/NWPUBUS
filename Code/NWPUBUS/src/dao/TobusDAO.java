package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBHelper;
import entity.*;

public class TobusDAO {
	DBHelper db =DBHelper.getInstance();
	/**
	 * update 司机
	 */
	public void updateDriver(String nname, String nuid,String name) {
		try {
			
			Connection c = DBHelper.getInstance().getConnection();
			update("已批假",nname);//新人已批假
			update("替班",name);//老人替班
			String sql = "update tobus set name = ? , u_id =?where name = ? and delay = '替班' ";//找到新人，变成老人的名字
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, nname);
			ps.setString(2, nuid);
			
			ps.setString(3, name);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void update1(String time,String delay,int remain,String name)
	{
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update tobus set time = ?,delay=?,remain = ? where name=?";
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
	public void updateNoDriver(String nname, String uid,String name)
	{
		
		Connection c;
		try {
			c = DBHelper.getInstance().getConnection();
			
			String sql = "update tobus set name = ? , u_id =? where name = ? and delay = '已批假'";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, uid);
			ps.setString(3, nname);
			ps.execute();
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public int selectRemain(String license, String day, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select remain from tobus where license = ? and day = ? and time = ?";
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
    public void update(String dis,String name) {
  	  
        String sql = "update tobus set delay = ? where name = ?";
        try (Connection c = db.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
  
          
           ps.setString(1,dis);
           ps.setString(2,name);
           ps.execute();
           DBHelper.closeConnection(c, ps, null);
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        } catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
  
    }

	BbusDAO bd = new BbusDAO();
	/**
	 * update 预约人数
	 */
	public void updateRemain(String license, String day, String time,int remain) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update tobus set remain = ? where license = ? and day = ? and time = ?";
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
	public void adtobus(String name, String uid, String day, String time, String start) {

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String license = bd.getLicense(name);
			String sql = "insert into tobus values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

			String sql = "delete from tobus";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Dwork> getTobus(String day) {
		List<Dwork> lists = new ArrayList<>();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from dwork where day= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, day);
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

	
	public void replace(String day)
	{
		List<Dwork> lists = getTobus(day);
		for(int i=0;i<=lists.size()-1;i++)
		{
			Dwork dw = lists.get(i);
			adtobus(dw.getName(),dw.getUid(),dw.getDay(),dw.getTime(),dw.getStart());
		}
	}

	public void huanban(String name1,String name2,String day)
	{
		String id = new UserDAO().getUID(name2);//2换1
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update tobus set name=? and id=? where name=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name2);
			ps.setString(2, id);
			ps.setString(3, name1);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
