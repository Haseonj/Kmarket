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
	
	public void insertArticle(BoardVO vo) {
		dao.insertArticle(vo);
	}
	
	public BoardVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public BoardVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public List<BoardVO> selectArticles(String group, String cate, int start) {
		logger.info("selectArticlesService.. cate:" +cate);
		return dao.selectArticles(group, cate, start);
	}
	
	public List<BoardVO> selectAllArticles(String group, int start) {
		return dao.selectAllArticles(group, start);
	}
	
	public List<BoardVO> selectNoticeArticles() {
		return dao.selectNoticeArticles();
	}
	
	/*
	public List<BoardVO> selectNoticeList(){
		return dao.selectNoticeList();
	}
	*/
	
	public List<BoardVO> selectQnaArticles() {
		return dao.selectQnaArticles();
	}
	
	public List<BoardVO> selectFaqArticles(String group, String cate){
		return dao.selectFaqArticles(group, cate);
	}
	
	public int selectCountTotal(String cate, String group) {
		return dao.selectCountTotal(cate, group);
	}
	
	public int selectCountTotal(String cate) {
		return dao.selectCountTotal(cate);
	}
	
<<<<<<< Updated upstream
=======
	/*
	public int selectCountTotal(String group) {
		return dao.selectCountTotal(group);
	}
	*/
	
>>>>>>> Stashed changes
	public List<BoardVO> selectCate1() {
		return dao.selectCate1();
	}
	
	public List<BoardVO> selectCate2(String cate1) {
		return dao.selectCate2(cate1);
	}
	
	public void updateArticle(String no, String title, String content) {
		dao.updateArticle(no, title, content);
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
