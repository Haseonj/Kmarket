package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.AdminDAO;

public enum AdminService {
	instance;
	private AdminDAO dao;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	private AdminService() {
		dao = new AdminDAO();
	}
	public int admindeleteproduct(String prodNo) {
		return dao.admindeleteproduct(prodNo);
	}
	
}
