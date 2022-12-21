package kr.co.kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.AdminSql;
import kr.co.kmarket.db.DBHelper;

public class AdminDAO extends DBHelper{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int admindeleteproduct(String ajaxMsg) {
		int result = 0;
		try {
			logger.info("delete prodNo : "+ajaxMsg);
			conn=getConnection();
			psmt=conn.prepareStatement(AdminSql.DELETE_PRODUCT);
			psmt.setString(1, ajaxMsg);
			result =psmt.executeUpdate();
			close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return result;
		
	}
}
