package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;

public class ProductDAO extends DBHelper {

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
	public List<ProductVO> selectProducts(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectProducts...");
			conn =getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS);
			psmt.setString(1, prodCate1);
			psmt.setString(2, prodCate2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setProdCate1(rs.getInt(2));
				product.setProdCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setEtc1(rs.getInt(28));
				product.setEtc2(rs.getInt(29));
				product.setEtc3(rs.getString(30));
				product.setEtc4(rs.getString(31));
				product.setEtc5(rs.getString(32));
				
				products.add(product);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	public List<CateVO> selectProdCate1() {
		List<CateVO> cates = new ArrayList<>();
		try {
			logger.info("selectProdCate1...");
			conn =getConnection();
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
			conn =getConnection();
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
	public CateVO selectProdCates(String prodCate1, String prodCate2) {
		CateVO cates = null;
		try {
			logger.info("selectProdCates...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_PRODCATES);
			psmt.setString(1, prodCate1);
			psmt.setString(2, prodCate2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				cates = new CateVO();
				cates.setCate1(rs.getInt(1));
				cates.setC1Name(rs.getString(2));
				cates.setCate2(rs.getInt(4));
				cates.setC2Name(rs.getString(5));
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cates;
	}
	public int selectCountTotal(String prodCate1, String prodCate2) {
		int total=0;
		try {
			logger.info("selectCountTotal...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, prodCate1);
			psmt.setString(2, prodCate2);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
}
