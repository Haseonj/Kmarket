package kr.co.kmarket.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.BoardDAO;
import kr.co.kmarket.vo.BoardVO;
import kr.co.kmarket.vo.CateVO;

public enum BoardService {
	
	INSTANCE;
	private BoardDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private BoardService() {
		dao = new BoardDAO();
	}
	
	// 1.0v
	public void insertArticle(BoardVO vo) {
		dao.insertArticle(vo);
	}
	
	
	public int insertAnswer(BoardVO vo) {
		return dao.insertAnswer(vo);
	}
	
	public BoardVO selectArticle(String no, String cate) {
		return dao.selectArticle(no, cate);
	}
	
	public BoardVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	
	
	public List<BoardVO> selectArticles(String group, String cate, int start) {
		return dao.selectArticles(group, cate, start);
	}
	
	public List<BoardVO> selectAllArticles(String group, int start) {
		return dao.selectAllArticles(group, start);
	}
	
	
	
	/*
	public List<BoardVO> selectFaqArticles(String group, String cate){
		return dao.selectFaqArticles(group, cate);
	}
	*/
	
	public List<BoardVO> selectAdminArticle(String group, int start) {
		return dao.selectAdminArticle(group, start);
	}
	public List<BoardVO> selectAdminArticle(String group, int start, String cate) {
		return dao.selectAdminArticle(group, start, cate);
	}
	public List<BoardVO> selectAdminArticle(String group, int start, String cate, String cate2) {
		return dao.selectAdminArticle(group, start, cate, cate2);
	}
	
	
	public int selectCountTotal(String cate, String group) {
		return dao.selectCountTotal(cate, group);
	}
	public int selectCountTotal(String cate, String cate2, String group) {
		return dao.selectCountTotal(cate, cate2, group);
	}
	
	public List<BoardVO> selectCate1() {
		return dao.selectCate1();
	}
	
	public List<BoardVO> selectCate2(String cate1) {
		return dao.selectCate2(cate1);
	}
	
	public void updateArticle(String no, String title, String content) {
		dao.updateArticle(no, title, content);
	}
	public void updateArticle(String cate, String title, String content, String no) {
		dao.updateArticle(cate, title, content, no);
	}
	public void updateArticle(String cate, String cate2, String title, String content, String no) {
		dao.updateArticle(cate, cate2, title, content, no);
	}
	
	
	// ------------------------------------------ 1.1v ---------------------------------------------
	public void insertQnaArticle(BoardVO vo) {
		dao.insertQnaArticle(vo);
	}
	
	public void insertNoticeArticle(BoardVO vo) {
		dao.insertNoticeArticle(vo);
	}
	
	public void insertFaqArticle(BoardVO vo) {
		dao.insertFaqArticle(vo);
	}
	
	public List<BoardVO> selectQnaArticles() {
		return dao.selectQnaArticles();
	}
	
	public List<BoardVO> selectQnaArticles(int start) {
		return dao.selectQnaArticles(start);
	}
	public List<BoardVO> selectQnaArticles(String cate1, int start) {
		return dao.selectQnaArticles(cate1, start);
	}
	public List<BoardVO> selectQnaArticles(String cate1, String cate2, int start) {
		return dao.selectQnaArticles(cate1, cate2, start);
	}
	
	public List<BoardVO> selectNoticeArticles() {
		return dao.selectNoticeArticles();
	}
	
	public List<BoardVO> selectNoticeArticles(int start) {
		return dao.selectNoticeArticles(start);
	}
	
	public List<BoardVO> selectNoticeArticles(String cate1, int start) {
		return dao.selectNoticeArticles(cate1, start);
	}
	
	
	public List<BoardVO> selectFaqArticlesAll(int start) {
		return dao.selectFaqArticlesAll(start);
	}
	public List<BoardVO> selectFaqArticles(String cate1) {
		return dao.selectFaqArticles(cate1);
	}
	public List<BoardVO> selectFaqArticles(String cate1, int start) {
		return dao.selectFaqArticles(cate1, start);
	}
	public List<BoardVO> selectFaqArticles(String cate1, String cate2, int start) {
		return dao.selectFaqArticles(cate1, cate2, start);
	}
	
	public int selectQnaCountTotal() {
		return dao.selectQnaCountTotal();
	}
	public int selectQnaCountTotal(String cate1) {
		return dao.selectQnaCountTotal(cate1);
	}
	public int selectQnaCountTotal(String cate1, String cate2) {
		return dao.selectQnaCountTotal(cate1, cate2);
	}
	
	public int selectNoticeCountTotal() {
		return dao.selectNoticeCountTotal();
	}
	public int selectNoticeCountTotal(String cate1) {
		return dao.selectNoticeCountTotal(cate1);
	}
	
	public int selectFaqCountTotal() {
		return dao.selectFaqCountTotal();
	}
	public int selectFaqCountTotal(String cate1) {
		return dao.selectFaqCountTotal(cate1);
	}
	public int selectFaqCountTotal(String cate1, String cate2) {
		return dao.selectFaqCountTotal(cate1, cate2);
	}
	
	public BoardVO selectQnaArticle(String no) {
		return dao.selectQnaArticle(no);
	}
	
	public BoardVO selectAnswer(String no) {
		return dao.selectAnswer(no);
	}
	
	public BoardVO selectNoticeArticle(String no) {
		return dao.selectNoticeArticle(no);
	}
	
	public BoardVO selectFaqArticle(String no) {
		return dao.selectFaqArticle(no);
	}
	
	public void updateNoticeArticle(String no, String cate1, String title, String content) {
		dao.updateNoticeArticle(no, cate1, title, content);
	}
	public void updateFaqArticle(String no, String cate1, String cate2, String title, String content) {
		dao.updateFaqArticle(no, cate1, cate2, title, content);
	}
	
	public int deleteNoticeArticle(String no) {
		return dao.deleteNoticeArticle(no);
	}
	public int deleteFaqArticle(String no) {
		return dao.deleteFaqArticle(no);
	}
	
	
	// 현재 페이지 번호
	public int getCurrentpage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
	
	// 마지막 페이지 번호
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = (total / 10);
		}else {
			lastPageNum = (total / 10) + 1;
		}
		
		if(total == 0) {
			lastPageNum = 1;
		}
		
		return lastPageNum;
	}
	
	// 페이지 그룹 start, end 번호
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		
		int pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
		int pageGroupEnd = pageGroupCurrent * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] result = {pageGroupStart, pageGroupEnd};
		
		return result;
	}
	
	// 페이지 시작 번호
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		
		return total - start;
	}
	
	// 시작 인덱스
	public int getStartNum (int currentPage) {
		return (currentPage - 1) * 10;
	}	
}
