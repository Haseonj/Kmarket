package kr.co.kmarket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBHelper {
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected PreparedStatement psmt1 = null;
	protected PreparedStatement psmt2 = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_kmarket");
			conn = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();			
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(psmt1 != null) psmt1.close();
			if(psmt2 != null) psmt2.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

