package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import entity.Bbus;
import utils.DBHelper;

public class BbusDAO {
	DBHelper db =DBHelper.getInstance();
	
	 public int getTotal() {
	        int total = 0;
	        try (Connection c = db.getConnection(); Statement s = c.createStatement();) {
	  
	            String sql = "select count(*) from bbus";
	  
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	  
	            DBHelper.closeConnection(c, s, rs);
	  
	        } catch (SQLException e) {
	  
	            e.printStackTrace();
	        } catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        return total;
	        
	    }
	  
	    public void add(Bbus bbus) {
	  
	        String sql = "insert into bbus values(?,?,?)";
	        try (Connection c = db.getConnection(); PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);) {
	  
	            ps.setString(1, bbus.getName());
	            ps.setString(2, bbus.getLicense());
	            ps.setString(3, bbus.getDispatch());
	  
	            ps.executeUpdate();
	            DBHelper.closeConnection(c, ps, null);
	  
	        } catch (SQLException e) {
	  
	            e.printStackTrace();
	        } catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    }
	  
	    public void update(String dis,String name) {
	  
	        String sql = "update bbus set dispatch = ? where name = ?";
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
	  
	    public void delete(String license) {
	  
	        try (Connection c = db.getConnection(); Statement s = c.createStatement();) {
	  
	            String sql = "delete from bbus where license = " + license;
	  
	            s.execute(sql);
	            DBHelper.closeConnection(c, s, null);
	  
	        } catch (SQLException e) {
	  
	            e.printStackTrace();
	        } catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    }
	  
	    public Bbus get(String license) {
	        Bbus bbus1 = null;
	  
	        try (Connection c = db.getConnection(); Statement s = c.createStatement();) {
	  
	            String sql = "select * from bbus where license = " + license;
	  
	            ResultSet rs = s.executeQuery(sql);
	  
	            if (rs.next()) {

	                String name = rs.getString(1);
	                String dispatch = rs.getString(3);
	                
	                bbus1 = new Bbus(name,license,dispatch);
	            }
	  
	        } catch (SQLException e) {
	  
	            e.printStackTrace();
	        } catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return bbus1;
	       
	    }	    
		public String getLicense(String name) {
			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select license from bbus where name = ?";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, name);
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
		public String getDispatch(String name) {
			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select dispatch from bbus where name = ?";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, name);
				ResultSet rs = ps.executeQuery();
				String dispatch = null;
				if(rs.next()) {
					dispatch = rs.getString("dispatch");
				}
				c.close();
				return dispatch;
			} catch(Exception e) {
				e.printStackTrace();
			}
			return "error";
		}
}
