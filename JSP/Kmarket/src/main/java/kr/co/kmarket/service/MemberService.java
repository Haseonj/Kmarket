package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.MemberDAO;
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.TermsVO;

public enum MemberService {
	
	instance;
	private MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService() {
		dao = new MemberDAO();
}
	public void insertSellerMember(MemberVO vo) {
		dao.insertSellerMember(vo);
	}
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	public MemberVO selectMember(String uid, String pass) {
		return dao.selectMember(uid, pass);
	}
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	public void updateUserForSessionOut(String uid) {
		dao.updateUserForSessionOut(uid);
	}
}