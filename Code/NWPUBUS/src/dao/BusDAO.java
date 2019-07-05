package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.DBHelper;

public class BusDAO {

	public String getLicense(String uid) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select license from bbus where u_id = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			String license = null;
			if(rs.next()) {
				license = rs.getString("license");
			}
			c.close();
			return license;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
}
