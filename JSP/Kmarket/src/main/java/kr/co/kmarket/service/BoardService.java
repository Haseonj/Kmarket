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
	
	public List<CateVO> selectCate1() {
		return dao.selectCate1();
	}
	
	public List<CateVO> selectCate2(String cate1) {
		return dao.selectCate2(cate1);
	}
	
}
