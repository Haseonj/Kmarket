package kr.co.kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.MemberSql;
import kr.co.kmarket.vo.MemberVO;

public class MemberDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public MemberVO selectMember(String uid, String pass) {
		
		MemberVO vo =null;
		try {
			logger.info("selectMember...");
			conn = getConnection();
			psmt = conn.prepareStatement(MemberSql.SELECT_Member);
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
}
