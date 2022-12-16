package kr.co.kmarket.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.BoardDAO;
import kr.co.kmarket.vo.CateVO;

public enum BoardService {
	
	INSTANCE;
	private BoardDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private BoardService() {
		dao = new BoardDAO();
	}
	
<<<<<<< Updated upstream
	public List<CateVO> selectCate1() {
=======
	public void insertArticle(BoardVO vo) {
		dao.insertArticle(vo);
	}
	
	public BoardVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public List<BoardVO> selectArticles(String group, String cate, int start) {
		logger.info("selectArticlesService.. cate:" +cate);
		return dao.selectArticles(group, cate, start);
	}
	
	public List<BoardVO> selectFaqArticles(String group, String cate){
		return dao.selectFaqArticles(group, cate);
	}
	
	public int selectCountTotal(String cate) {
		return dao.selectCountTotal(cate);
	}
	
	public List<BoardVO> selectCate1() {
>>>>>>> Stashed changes
		return dao.selectCate1();
	}
	
	public List<CateVO> selectCate2(String cate1) {
		return dao.selectCate2(cate1);
	}
	
}
