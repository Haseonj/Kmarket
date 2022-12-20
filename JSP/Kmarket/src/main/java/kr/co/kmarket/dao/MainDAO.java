package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.MainSql;
import kr.co.kmarket.vo.ProductVO;

public class MainDAO extends DBHelper {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<ProductVO> selectBestProduct() {
		List<ProductVO> bests = new ArrayList<>();
		try {
			logger.info("selectBestProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_BEST_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				bests.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return bests;
	}
	
	public List<ProductVO> selectHitProduct() {
		List<ProductVO> hits = new ArrayList<>();
		try {
			logger.info("selectHitProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_HIT_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				hits.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return hits;
	}
	
	public List<ProductVO> selectRecProduct() {
		List<ProductVO> recs = new ArrayList<>();
		try {
			logger.info("selectRecProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_REC_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				recs.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return recs;
	}
	
	public List<ProductVO> selectLatestProduct() {
		List<ProductVO> news = new ArrayList<>();
		try {
			logger.info("selectLatestProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_LATEST_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				news.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return news;
	}
	
	public List<ProductVO> selectHotProduct() {
		List<ProductVO> hots = new ArrayList<>();
		try {
			logger.info("selectHotProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_HOT_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				hots.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return hots;
	}
	
	public List<ProductVO> selectDisProduct() {
		List<ProductVO> dis = new ArrayList<>();
		try {
			logger.info("selectDisProduct...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(MainSql.SELECT_DIS_PRODUCT);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				vo.setEtc1(rs.getInt(28));
				vo.setEtc2(rs.getInt(29));
				vo.setEtc3(rs.getString(30));
				vo.setEtc4(rs.getString(31));
				vo.setEtc5(rs.getString(32));
				vo.setSaleprice(rs.getInt(33));
				dis.add(vo);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dis;
	}
	
}
