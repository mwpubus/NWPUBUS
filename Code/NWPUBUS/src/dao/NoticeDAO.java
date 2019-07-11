package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.DBHelper;

public class NoticeDAO {

	/**
	 * 增加通知
	 */
	public void addNotice(String title, String content, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "insert into notice values (?, ?, ?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, time);
			ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除通知
	 */
	public void deleteNotice(String title, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "delete from notice where title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, time);
			ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询通知内容
	 */
	public String getContent(String title, String time) {
		String content = null;
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select content from notice where title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, time);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				content = rs.getString("content");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return content;
	}
	
	/**
	 * 修改通知标题
	 */
	public void updateNoticeTitle(String title, String newtitle, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update notice set title = ? where title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, newtitle);
			ps.setString(2, title);
			ps.setString(3, time);
			ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改通知内容
	 */
	public void updateNoticeContent(String title, String newcontent, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update notice set content = ? where title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, newcontent);
			ps.setString(2, title);
			ps.setString(3, time);
			ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改通知标题和内容
	 */
	public void updateNotice(String title, String newtitle, String newcontent, String time) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "update notice set title = ? and content = ? where title = ? and time = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, newtitle);
			ps.setString(2, newcontent);
			ps.setString(3, title);
			ps.setString(4, time);
			ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
