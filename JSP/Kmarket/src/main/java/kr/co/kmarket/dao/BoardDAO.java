package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.BoardSql;
import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.vo.BoardVO;
import kr.co.kmarket.vo.CateVO;

public class BoardDAO extends DBHelper {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertArticle(BoardVO vo) {
		try {
			logger.info("insertArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.INSERT_ARTICLE);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getGroup());
			psmt.setString(3, vo.getCate1());
			psmt.setInt(4, vo.getCate2());
			psmt.setString(5, vo.getTitle());
			psmt.setString(6, vo.getContent());
			psmt.setString(7, vo.getRegip());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public List<BoardVO> selectArticles(String cate, int start) {
		List<BoardVO> articles = new ArrayList<>();
		try {
			logger.info("selectArticles...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setCate1(rs.getString(4));
				vo.setCate2(rs.getInt(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				vo.setC2Name(rs.getString(10));
				articles.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public int selectCountTotal(String cate) {
		int total = 0;
		
		try {
			logger.info("selectCountTotal...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	
	public List<BoardVO> selectCate1() {
		List<BoardVO> cate1 = new ArrayList<>();
		try {
			logger.info("selectCate1...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(BoardSql.SELECT_CATE1);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setCate1(rs.getString(1));
				vo.setC1Name(rs.getString(2));
				cate1.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cate1;
	}
	
	public List<BoardVO> selectCate2(String cate1) {
		List<BoardVO> cate2 = new ArrayList<>();
		try {
			logger.info("selectCate2...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_CATE2);
			psmt.setString(1, cate1);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setCate1(rs.getString(1));
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
