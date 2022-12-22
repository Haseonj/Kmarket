package kr.co.kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.AdminSql;
import kr.co.kmarket.db.DBHelper;

public class AdminDAO extends DBHelper{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int admindeleteproduct(String prodNo) {
		int result = 0;
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(AdminSql.DELETE_PRODUCT);
			psmt.setString(1, prodNo);
			result = psmt.executeUpdate();
			close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return result;
		
	}
}
