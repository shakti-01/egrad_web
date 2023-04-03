package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import beans.Post;
import beans.Reply;
import beans.User;

public class ForumDao {
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER = "c##shakti";
	static final String PASS = "shakti";
	
	public boolean addPost(String uid, String uname, String title, String content) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "INSERT INTO egrad_post(user_id,user_name,title,content) VALUES ('"+uid+"','"+uname+"', '"+title+"', '"+content+"')";
			stmt.executeUpdate(sql);
			System.out.println("forumdao-addPost: added...");	
			return true;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean addReply(String uname, String pid, String content) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "INSERT INTO egrad_post_reply(user_name,post_id,content) VALUES ('"+uname+"','"+pid+"', '"+content+"')";
			stmt.executeUpdate(sql);
			System.out.println("forumdao-addReply: reply added...");	
			return true;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList<Post> getUserPosts(String uid) throws ClassNotFoundException, SQLException {
		ArrayList<Post> plist = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT user_name,post_id,title,content from egrad_post where user_id='"+uid+"'";
			
			ResultSet rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Post p = new Post();
				p.setUserName(rs.getString(1));
				p.setPostid(rs.getString(2));
				p.setTitle(rs.getString(3));
				p.setContent(rs.getString(4));
				plist.add(p);
			}
			System.out.println("Fetched user posts...");
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	public ArrayList<Post> getAllPosts() throws ClassNotFoundException, SQLException {
		ArrayList<Post> plist = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt2 = conn2.createStatement();
			String sql = "SELECT user_name,post_id,title,content from egrad_post";
			ResultSet rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Post p = new Post();
				p.setUserName(rs.getString(1));
				p.setPostid(rs.getString(2));
				p.setTitle(rs.getString(3));
				p.setContent(rs.getString(4));
				String s = "SELECT user_name,content from egrad_post_reply where post_id = '"+p.getPostid()+"'";
				
				ResultSet r= stmt2.executeQuery(s);
				ArrayList<Reply> rlist= new ArrayList<>();
				while(r.next()) {
					Reply rep = new Reply();
					rep.setUserName(r.getString(1));
					rep.setContent(r.getString(2));
					rlist.add(rep);
				}
				//conn2.close();
				p.setReplies(rlist);
				plist.add(p);
			}
			System.out.println("Fetched user posts...");
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return plist;
	}
}