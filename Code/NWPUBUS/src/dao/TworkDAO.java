package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.Twork;
import utils.DBHelper;

/**
 * @author NWPULLT
 *
 */
public class TworkDAO {
	
	
		
		/**
		 * add 老师上课记录
		 * @param vwork
		 * @return
		 */
		public int add(Twork twork) {

			try {

				Connection c = DBHelper.getInstance().getConnection();

				String sql = "insert into twork values(?,?,?,?)";
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				//ps.setInt(1, (this.getTotal())+1);
				ps.setString(1, twork.getName());
				ps.setString(2, twork.getUid());
				ps.setString(3, twork.getDay());
				ps.setString(4, twork.getTtime());
				//执行sql语句
				ps.execute();
				DBHelper.closeConnection(c, ps, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//如果返回-1就说明根本没有成功生成。
		}
	   
	
		/**
		 *  delete 根据id+day+time删除工作记录
		 * @param uid
		 * @param day
		 * @param time
		 */
		public void delete(String uid,String day,String time) {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				String sql = "delete from twork where u_id = ? and day = ? and ttime = ?" ;

				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, uid);
				ps.setString(2, day);
				ps.setString(3, time);

				ps.execute();

				DBHelper.closeConnection(c, ps, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	
		/**
		 * @param day1 修改之后的时间
		 * @param uid
		 * @param day
		 * @param time
		 */
		public void update(String day1 ,String uid,String day,String time) {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				String sql = "update twork set day =?  where u_id = ? and day = ? and ttime = ?";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, day1);
				ps.setString(2, uid);
				ps.setString(3, day);
				ps.setString(4, time);
				ps.execute();

				DBHelper.closeConnection(c, ps, null);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		


		/**
		 * @param uid
		 * @param day
		 * @param time
		 * @return
		 */
		public Twork get(String uid,String day,String time) {
			 Twork  twork = null;
			try {

				Connection c = DBHelper.getInstance().getConnection();

				

				String sql = "select * from  twork where u_id = ? and day = ? and ttime = ?";
				
				PreparedStatement ps = c.prepareStatement(sql);
				
				ps.setString(1, uid);
				ps.setString(2, day);
				ps.setString(3, time);
				
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					
					String Name = rs.getString("name");
					

					twork = new Twork(Name,uid,day,time);
				}

				DBHelper.closeConnection(c, ps, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return twork;
		}
}
