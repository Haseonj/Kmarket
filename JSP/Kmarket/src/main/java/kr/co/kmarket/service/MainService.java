package kr.co.kmarket.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.MainDAO;
import kr.co.kmarket.vo.ProductVO;

public enum MainService {

	INSTANCE;
	private MainDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MainService() {
		dao = new MainDAO();
	}
	
	public List<ProductVO> selectBestProduct() {
		return dao.selectBestProduct();
	}
	
	public List<ProductVO> selectHitProduct() {
		return dao.selectHitProduct();
	}
	
	public List<ProductVO> selectRecProduct() {
		return dao.selectRecProduct();
	}
	
	public List<ProductVO> selectLatestProduct() {
		return dao.selectLatestProduct();
	}
	
	public List<ProductVO> selectHotProduct() {
		return dao.selectHotProduct();
	}
	
	public List<ProductVO> selectDisProduct() {
		return dao.selectDisProduct();
	}
}
