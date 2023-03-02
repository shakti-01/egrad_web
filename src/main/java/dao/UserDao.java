package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.User;

public class UserDao {
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER = "c##shakti";
	static final String PASS = "shakti";
	
	public boolean userRegister(User u) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			String gen="";
			if(u.getGender().equals("male")) gen = "M";
			else if(u.getGender().equals("female")) gen = "F";
			else gen = "O";
			String skills = "0000";
			for(String s:u.getSkills()) {
				if(s.equals("C")) {
					char[] charArray = skills.toCharArray();
					charArray[0] = '1';
					skills = new String(charArray);
				}
				else if(s.equals("Java")) {
					char[] charArray = skills.toCharArray();
					charArray[1] = '1';
					skills = new String(charArray);
				}
				else if(s.equals("Python")) {
					char[] charArray = skills.toCharArray();
					charArray[2] = '1';
					skills = new String(charArray);
				}
				else if(s.equals("JSP")) {
					char[] charArray = skills.toCharArray();
					charArray[3] = '1';
					skills = new String(charArray);
				}
			}
			String sql = "INSERT INTO egrad_user(name,email,pwd,age, gender, clg_addr, branch,skills ) VALUES ('"+u.getName()+"','"+u.getEmail()+"', '"+u.getPassword()+"', '"+u.getAge()+"', '"+gen+"', '"+u.getCollegeAddress()+"', '"+u.getBranch()+"','"+skills+"' )";
			stmt.executeUpdate(sql);
			System.out.println("userdao-userRegister: Inserted user record into the table...");	
			return true;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String[] userLogin(String email,String pwd) throws ClassNotFoundException, SQLException {
		String[] auth_user = {"",""};//uid,name
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT userid,name FROM EGRAD_USER WHERE EMAIL='"+email+"' AND PWD = '"+pwd+"'";
			stmt.executeUpdate(sql);
			ResultSet rs= stmt.executeQuery(sql);  
			while(rs.next()) {
				auth_user[0] = rs.getString(1);
				auth_user[1] = rs.getString(2);
			}

			System.out.println("userdao-userLogin: Fetched data...");	
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return auth_user;
	}
}
