package kr.co.kmarket.service;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.UserDAO;

public enum UserService {

	INSTANCE;
	private UserDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService() {
		dao = new UserDAO();
	}
	
	public void insertUser() {}
}
