package kr.co.kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.MemberSql;
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.TermsVO;

public class MemberDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember(MemberVO vo) {
		try {
			logger.info("insertMember...");
			
			conn= getConnection();
			psmt = conn.prepareStatement(MemberSql.INSERT_MEMBER);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setInt(4, vo.getGender());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegip());
			psmt.executeUpdate();
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void insertSellerMember(MemberVO vo) {
		try {
			logger.info("insertSellerMember...");
			
			conn= getConnection();
			psmt = conn.prepareStatement(MemberSql.INSERT_SELLER_MEMBER);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getCompany());
			psmt.setString(4, vo.getCeo());
			psmt.setString(5, vo.getBizRegNum());
			psmt.setString(6, vo.getComRegNum());
			psmt.setString(7, vo.getTel());
			psmt.setString(8, vo.getHp());
			psmt.setString(9, vo.getFax());
			psmt.setString(10, vo.getEmail());
			psmt.setString(11, vo.getZip());
			psmt.setString(12, vo.getAddr1());
			psmt.setString(13, vo.getAddr2());
			psmt.setString(14, vo.getName());
			psmt.setString(15, vo.getRegip());
			psmt.executeUpdate();
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public MemberVO selectMember(String uid, String pass) {
		
		MemberVO vo =null;
		try {
			logger.info("selectMember...");
			conn = getConnection();
			psmt = conn.prepareStatement(MemberSql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
				if(rs.next()) {
					vo = new MemberVO();
					vo.setUid(rs.getString(1));
					vo.setPass(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setGender(rs.getInt(4));
					vo.setHp(rs.getString(5));
					vo.setEmail(rs.getString(6));
					vo.setType(rs.getInt(7));;
					vo.setPoint(rs.getString(8));
					vo.setLevel(rs.getInt(9));
					vo.setZip(rs.getString(10));
					vo.setAddr1(rs.getString(11));
					vo.setAddr2(rs.getString(12));
					vo.setCompany(rs.getString(13));
					vo.setCeo(rs.getString(14));
					vo.setBizRegNum(rs.getString(15));
					vo.setComRegNum(rs.getString(16));
					vo.setTel(rs.getString(17));
					vo.setManager(rs.getString(18));
					vo.setManagerHp(rs.getString(19));
					vo.setFax(rs.getString(20));
					vo.setRegip(rs.getString(21));
					vo.setWdate(rs.getString(22));
					vo.setRdate(rs.getString(23));
					vo.setEtc1(rs.getInt(24));
					vo.setEtc2(rs.getInt(25));
					vo.setEtc3(rs.getString(26));
					vo.setEtc4(rs.getString(27));
					vo.setEtc5(rs.getString(28));
					}
					close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	public TermsVO selectTerms() {
		
		TermsVO vo = null;
		
		try {
			logger.info("selectTerms...");
		
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MemberSql.SELECT_TERMS);
			
			if(rs.next()) {
				vo = new TermsVO();
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
				vo.setLocation(rs.getString(3));
				vo.setFinance(rs.getString(4));
				vo.setTax(rs.getString(5));
			}
			
			close();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	public int selectCountUid(String uid) {
		
		int result = 0;
		
		try {
			logger.info("selectCheckUid");
			
			conn = getConnection();
			psmt = conn.prepareStatement(MemberSql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		logger.debug("result : " + result);
		
		return result;
	}
	public void updateUserForSessionOut(String uid) {
		try {
			logger.info("updateUserForSessionOut...");
			conn = getConnection();
			psmt = conn.prepareStatement(MemberSql.UPDATE_USER_FOR_SESSION_OUT);
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
