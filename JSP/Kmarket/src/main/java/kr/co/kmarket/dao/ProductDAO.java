package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;

public class ProductDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertProduct(ProductVO vo) {
		try {
			logger.info("insertProduct...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.INSERT_PRODUCT);
			psmt.setInt(1, vo.getProdCate1());
			psmt.setInt(2, vo.getProdCate2());
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setString(6, vo.getSeller());
			psmt.setInt(7, vo.getPrice());
			psmt.setInt(8, vo.getDiscount());
			psmt.setInt(9, vo.getPoint());
			psmt.setInt(10, vo.getStock());
			psmt.setInt(11, vo.getDelivery());
			psmt.setString(12, vo.getThumb1());
			psmt.setString(13, vo.getThumb2());
			psmt.setString(14, vo.getThumb3());
			psmt.setString(15, vo.getDetail());
			psmt.setString(16, vo.getIp());
			
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public List<CateVO> selectProdCate1() {
		List<CateVO> cates = new ArrayList<>();
		try {
			logger.info("selectProdCate1...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(ProductSql.SELECT_PRODCATE1);
			while(rs.next()) {
				CateVO cate = new CateVO();
				cate.setCate1(rs.getInt(1));
				cate.setC1Name(rs.getString(2));
				
				cates.add(cate);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cates;
	}
	public List<CateVO> selectProdCate2(String prodCate1) {
		List<CateVO> cates = new ArrayList<>();
		try {
			logger.info("selectProdCate2...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_PRODCATE2);
			psmt.setString(1, prodCate1);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CateVO cate2 = new CateVO();
				cate2.setCate1(rs.getInt(1));
				cate2.setCate2(rs.getInt(2));
				cate2.setC2Name(rs.getString(3));
				cates.add(cate2);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cates;
	}
}
