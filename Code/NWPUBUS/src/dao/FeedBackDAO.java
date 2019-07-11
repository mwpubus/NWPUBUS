package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.*;
import utils.DBHelper;

public class FeedBackDAO {

	public void addFeedBack(FeedBack feedback) {
		try {
			//建立数据库连接
			Connection c = DBHelper.getInstance().getConnection();
			
			
			String sql = "insert into feedback values (?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, feedback.getUid());
			ps.setString(2, feedback.getContent());
			ps.setString(3, feedback.getTime());
			ps.setString(4, feedback.getTitle());
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void EmptyFeedBack() {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from feedback";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteFeedBack(String uid, String title, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from feedback where (uid=?) and (time=?) and (title=?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, time);
			ps.setString(3, title);
			ps.execute();
			c.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateFeedBack(String uid, String title, String content, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update feedback set content = ? where (uid = ?) and (time=?) and (title=?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,content);
			ps.setString(2, uid);
			ps.setString(3, time);
			ps.setString(4, title);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public FeedBack getFeedBack(String uid, String title, String time){
		FeedBack feedback = null;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from feedback where uid = ? and title = ? and time = ?";
			
			PreparedStatement ps =c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, title);
			ps.setString(3, time);

			ResultSet rs = ps.executeQuery(sql);

			if (rs.next()) {
				
				String content = rs.getString("content");
				
				feedback = new FeedBack(uid, title, content, time);
			}

			DBHelper.closeConnection(c, ps, rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return feedback;
	}
	
	public List<FeedBack> getFeedBacks() {
		List<FeedBack> lists = new ArrayList<>();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from feedback order by time desc";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				FeedBack fb = new FeedBack();
				fb.setUid(rs.getString("uid"));
				fb.setTitle(rs.getString("title"));
				fb.setContent(rs.getString("content"));
				fb.setTime(rs.getString("time"));
				
				lists.add(fb);
			}
			
			DBHelper.closeConnection(c, ps, rs);
			
			return lists;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public String getContent(String uid, String title, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select content from feedback where uid = ? and title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, title);
			ps.setString(3, time);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getString("content");
			}
			
			DBHelper.closeConnection(c, ps, rs);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public FeedBack getFeedback(String uid, String title, String time) {
		FeedBack fb = new FeedBack();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from feedback where uid = ? and title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, title);
			ps.setString(3, time);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				fb.setUid(uid);
				fb.setTitle(title);
				fb.setContent(rs.getString("content"));
				fb.setTime(time);
			}
			
			DBHelper.closeConnection(c, ps, rs);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return fb;
	}
	
	public void deleteFeedback(String uid, String title, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from feedback where uid = ? and title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, title);
			ps.setString(3, time);
			ps.execute();
			c.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
