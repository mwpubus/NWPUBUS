package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import entity.User;

import utils.DBHelper;

/**
 * @author NWPULLT
 *
 */
public class UserDAO {


	/**
	 * @param user
	 * @return 如果返回-1就说明根本没有成功生成。
	 */
	public int add(User user) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into user values(?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			//ps.setInt(1, (this.getTotal())+1);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUid());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getTel());
			ps.setString(5, user.getUtype());
			
			ps.execute();

//			ResultSet rs = ps.getGeneratedKeys();
//			if (rs.next()) {
//				int lNo =  rs.getInt(1);
//				librarian.setlNo(lNo);
//				return lNo;
//			}

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//如果返回-1就说明根本没有成功生成。
	}
   

	/**
	 * @param uid
	 * 根据对应id 删除相应用户
	 */
	public void delete(String uid) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "delete from user where u_id = ?" ;

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param uid
	 * @param password
	 */
	public void update(String uid ,String password) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update user set password=?  where u_id = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, uid);
			
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * @param uid
	 * @return
	 */
	public User get(String uid) {
		User user = null;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from user where u_id = '" + uid+"'";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				String Name = rs.getString("name");
				
				String Password = rs.getString("password");
				String tel = rs.getString("tel");
				String utype = rs.getString("utype");
				user = new User(Name,uid,Password,tel,utype);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	/**
	 * 验证用户名和密码
	 * @param uid
	 * @param password
	 * @return true or false
	 */
	public boolean verify(String uid, String password) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "select password from user where u_id = '" + uid + "'";
			ResultSet rs = s.executeQuery(sql);
			
			String passwd = "";
			if(rs.next()) {
				passwd = rs.getString("password");
			}
			DBHelper.closeConnection(c, s, rs);
			if(password.equals(passwd)) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}

