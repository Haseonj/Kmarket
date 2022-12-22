package kr.co.kmarket.dao;

import java.sql.ResultSet;
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
			psmt.setString(3, vo.getC1Name());
			psmt.setString(4, vo.getCate2());
			psmt.setString(5, vo.getTitle());
			psmt.setString(6, vo.getContent());
			psmt.setString(7, vo.getRegip());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	// 글수정
	public BoardVO selectArticle(String no, String cate) {
		BoardVO vo = null;
		try {
			logger.info("selectArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				vo.setCate1(rs.getString(10));
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	// 글보기
	public BoardVO selectArticle(String no) {
		BoardVO vo = null;
		try {
			logger.info("selectArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_VIEW_ARTICLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				vo.setCate1(rs.getString(10));
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	public List<BoardVO> selectArticles(String group, String cate, int start) {
		List<BoardVO> articles = new ArrayList<>();
		try {
			logger.info("selectArticles...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_ARTICLES);
			psmt.setString(1, group);
			psmt.setString(2, cate);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				articles.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public List<BoardVO> selectAllArticles(String group, int start) {
		List<BoardVO> articles = new ArrayList<>();
		try {
			logger.info("selectAllArticles...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_ALL_ARTICLES);
			psmt.setString(1, group);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				articles.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public List<BoardVO> selectNoticeArticles() {
		List<BoardVO> notice = new ArrayList<>();
		try {
			logger.info("selectArticles...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(BoardSql.SELECT_NOTICE_ARTICLES);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				notice.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return notice;
	}
	
	public List<BoardVO> selectQnaArticles() {
		List<BoardVO> qna = new ArrayList<>();
		try {
			logger.info("selectArticles...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(BoardSql.SELECT_QNA_ARTICLES);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				qna.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return qna;
	}
	
	public List<BoardVO> selectFaqArticles(String group, String cate){
		List<BoardVO> articles = new ArrayList<>();
		try {
			logger.info("selectFaqArticles...");
			conn = getConnection();
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(BoardSql.SELECT_FAQ_ARTICLES);
			psmt.setString(1, group);
			psmt.setString(2, cate);
			rs = psmt.executeQuery();
			
			conn.commit();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setRegip(rs.getString(8));
				vo.setRdate(rs.getString(9));
				articles.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public List<BoardVO> selectAdminArticle(String group, int start) {
		List<BoardVO> articles = new ArrayList<>();
		try {
			logger.info("selectAdminArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_ADMIN_ARTICLE);
			psmt.setString(1, group);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setGroup(rs.getString(3));
				vo.setC1Name(rs.getString(4));
				vo.setCate2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setComment(rs.getInt(8));
				vo.setHit(rs.getInt(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11));
				articles.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public int selectCountTotal(String cate, String group) {
		int total = 0;
		
		try {
			logger.info("selectCountTotal...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_COUNT_TOTAL1);
			psmt.setString(1, cate);
			psmt.setString(2, group);
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
	
	public int selectCountTotal(String cate) {
		int total = 0;
		
		try {
			logger.info("selectCountTotal...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			psmt.setString(2, cate);
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
				vo.setC1Name(rs.getString(1));
				vo.setCate1(rs.getString(2));
				vo.setCate2(rs.getString(3));
				vo.setCate2No(rs.getInt(4));
				cate2.add(vo);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cate2;
	}
	
	public void updateArticle(String no, String title, String content) {
		try {
			logger.info("updateArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(BoardSql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, no);
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
