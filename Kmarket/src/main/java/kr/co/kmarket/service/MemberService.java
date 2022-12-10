package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.MemberDAO;
import kr.co.kmarket.dao.UserDAO;
import kr.co.kmarket.vo.MemberVO;

public enum MemberService {
	
	instance;
	private MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService() {
		dao = new MemberDAO();
}
	public MemberVO selectMember(String uid, String pass) {
		return dao.selectMember(uid, pass);
	}
}