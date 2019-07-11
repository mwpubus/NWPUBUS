package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.Vwork;
import utils.DBHelper;

/**
 * @author NWPULLT
 *
 */
public class VworkDAO {
	
	/**
	 * add 增加志愿者
	 * @param vwork
	 * @return
	 */
	public int add(Vwork vwork) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into vwork values(?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			//ps.setInt(1, (this.getTotal())+1);
			ps.setString(1, vwork.getName());
			ps.setString(2, vwork.getUid());
			ps.setString(3, vwork.getTime());
			//执行sql语句
			ps.execute();
			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//如果返回-1就说明根本没有成功生成。
	}
   
	/**
	 * delete 根据id+time删除工作记录
	 * @param uid
	 */
	public void delete(String uid,String time) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "delete from vwork where u_id = ? and time = ?" ;

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, time);

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param uid
	 * @param time
	 * @param time1 修改之后的时间
	 */
	public void update(String uid ,String time,String time1) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update vwork set time =?  where u_id = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, time1);
			ps.setString(2, uid);
			ps.setString(3, time);
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

	/**
	 * @param uid
	 * @param time
	 * @return
	 */
	public Vwork get(String uid,String time) {
		 Vwork  vwork = null;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			

			String sql = "select * from  vwork where u_id = ? and time = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, uid);
			ps.setString(2, time);
			
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				String Name = rs.getString("name");
				
				String uids = rs.getString("u_id");
				String times = rs.getString("time");
				vwork = new Vwork(Name,uids,times);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vwork;
	}

	public void delete(String uid,String time, String place) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "delete from vwork where u_id = ? and time = ? and place = ?" ;

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, time);
			ps.setString(3, place);

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
