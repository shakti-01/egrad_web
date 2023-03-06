package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Question;
import beans.User;

public class ExamDao {
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER = "c##shakti";
	static final String PASS = "shakti";
	
	public Question getQuestion(String sub, String qno) throws ClassNotFoundException, SQLException {
		Question q = new Question();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT * from egrad_exam where sub='"+sub+"' and qno = "+qno+"";
			ResultSet rs= stmt.executeQuery(sql);  
			while(rs.next()) {
				q.setSub(rs.getString(1));
				q.setQno(Integer.parseInt(rs.getString(2)));
				q.setQuestion(rs.getString(3));
				q.setOp1(rs.getString(4));
				q.setOp2(rs.getString(5));
				q.setOp3(rs.getString(6));
				q.setOp4(rs.getString(7));
				q.setAns(rs.getString(8));
			}
			System.out.println("examdao: fetched qsn");	
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return q;
	}
	
}
