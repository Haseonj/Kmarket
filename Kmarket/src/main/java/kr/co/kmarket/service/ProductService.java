package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.ProductDAO;
import kr.co.kmarket.vo.ProductVO;


public enum ProductService {

	INSTANCE;
	private ProductDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProductService() {
		dao = new ProductDAO();
	}
	
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
}
