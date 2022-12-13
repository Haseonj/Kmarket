package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.BoardSql;
import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.vo.CateVO;

public class BoardDAO extends DBHelper {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<CateVO> selectCate1() {
		List<CateVO> cate1 = new ArrayList<>();
		try {
			logger.info("selectCate1...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(BoardSql.SELECT_CATE1);
			
			while(rs.next()) {
				CateVO vo = new CateVO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				cate1.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cate1;
	}
	
	public List<CateVO> selectCate2(String cate1) {
		List<CateVO> cate2 = new ArrayList<>();
		try {
			logger.info("selectCate2...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_CATE2);
			psmt.setString(1, cate1);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CateVO vo = new CateVO();
				vo.setCate1(rs.getInt(1));
				vo.setCate2(rs.getInt(2));
				vo.setC2Name(rs.getString(3));
				cate2.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cate2;
	}
}
