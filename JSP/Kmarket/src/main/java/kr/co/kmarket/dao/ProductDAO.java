package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.CartVO;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.OrderVO;
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
				product.setSaleprice(rs.getInt(33));
				
				products.add(product);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	public ProductVO selectProduct(String prodNo) {
		ProductVO product = null;
		try {
			logger.info("selectProducts...");
			conn =getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCT);
			psmt.setString(1, prodNo);
			rs = psmt.executeQuery();
			while(rs.next()) {
				product = new ProductVO();
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
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return product;
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
	public List<ProductVO> selectOrderByHighsold(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByHighsold...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_HIGHSOLD);
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
	public List<ProductVO> selectOrderByLowPrice(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByLowPrice...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_LOWPRICE);
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
	public List<ProductVO> selectOrderByHighPrice(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByHighPrice...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_HIGHPRICE);
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
	public List<ProductVO> selectOrderByHighRating(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByHighRating...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_HIGHRATING);
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
	public List<ProductVO> selectOrderByHighReview(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByHighReview...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_HIGHREVIEW);
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
	public List<ProductVO> selectOrderByNewold(String prodCate1, String prodCate2) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.info("selectOrderByNewold...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_BY_NEWOLD);
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
	
	// cart
	public int insertCart(CartVO vo) {
		int result = 0;
		try {
			logger.info("insertCart...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.INSERT_CART);
			psmt.setString(1, vo.getUid());
			logger.info("insertCart... uid : " + vo.getUid());
			psmt.setInt(2, vo.getProdNo());
			psmt.setInt(3, vo.getCount());
			psmt.setInt(4, vo.getPrice());
			psmt.setInt(5, vo.getDiscount());
			psmt.setInt(6, vo.getPoint());
			psmt.setInt(7, vo.getDelivery());
			psmt.setInt(8, vo.getTotal());
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	public List<CartVO> selectCarts(String uid) {
		List<CartVO> carts = new ArrayList<>();
		try {
			logger.info("selectCarts...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_CARTS);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartVO cart = new CartVO();
				cart.setCartNo(rs.getInt(1));
				cart.setUid(rs.getString(2));
				cart.setProdNo(rs.getInt(3));
				cart.setCount(rs.getInt(4));
				cart.setPrice(rs.getInt(5));
				cart.setDiscount(rs.getInt(6));
				cart.setPoint(rs.getInt(7));
				cart.setDelivery(rs.getInt(8));
				cart.setTotal(rs.getInt(9));
				cart.setRdate(rs.getString(10));
				cart.setProdName(rs.getString(11));
				cart.setDescript(rs.getString(12));
				cart.setCompany(rs.getString(13));
				cart.setSeller(rs.getString(14));
				cart.setThumb1(rs.getString(15));
				
				carts.add(cart);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return carts;
	}
	
	public int deleteCartList(String uid, String prodNo) {
		int result = 0;
		try {
			logger.info("deleteCartList...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.DELETE_CART_LIST);
			psmt.setString(1, uid);
			psmt.setString(2, prodNo);
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	// order
	public int insertOrder(OrderVO vo) {
		int result = 0;
		try {
			logger.info("insertOrder...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.INSERT_ORDER);
			psmt.setString(1, vo.getOrdUid());
			psmt.setInt(2, vo.getOrdCount());
			psmt.setInt(3, vo.getOrdPrice());
			psmt.setInt(4, vo.getOrdDiscount());
			psmt.setInt(5, vo.getOrdDelivery());
			psmt.setInt(6, vo.getSavePoint());
			psmt.setInt(7, vo.getOrdTotPrice());
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	public void insertOrderItem(OrderVO vo, String prodNo) {
		try {
			logger.info("insertOrderItem...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.INSERT_ORDER_ITEM);
			psmt.setInt(1, vo.getOrdNo());
			psmt.setString(2, prodNo);
			psmt.setInt(3, vo.getOrdCount());
			psmt.setInt(4, vo.getOrdPrice());
			psmt.setInt(5, vo.getOrdDiscount());
			psmt.setInt(6, vo.getSavePoint());
			psmt.setInt(7, vo.getOrdDelivery());
			psmt.setInt(8, vo.getOrdTotPrice());
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public OrderVO selectLatestOrder(String uid) {
		OrderVO order = null;
		try {
			logger.info("selectLatestOrder...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_LATEST_ORDER);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				order = new OrderVO();
				order.setOrdNo(rs.getInt(1));
				order.setOrdUid(rs.getString(2));
				order.setOrdCount(rs.getInt(3));
				order.setOrdPrice(rs.getInt(4));
				order.setOrdDiscount(rs.getInt(5));
				order.setOrdDelivery(rs.getInt(6));
				order.setSavePoint(rs.getInt(7));
				order.setOrdTotPrice(rs.getInt(9));
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return order;
	}
	public List<OrderVO> selectOrder(int orderNo) {
		List<OrderVO> orders = new ArrayList<>();
		try {
			logger.info("selectOrder...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER);
			psmt.setInt(1, orderNo);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrderVO order = new OrderVO();
				order.setOrdNo(rs.getInt(1));
				order.setProdNo(rs.getInt(2));
				order.setCount(rs.getInt(3));
				order.setPrice(rs.getInt(4));
				order.setDiscount(rs.getInt(5));
				order.setPoint(rs.getInt(6));
				order.setDelivery(rs.getInt(7));
				order.setTotal(rs.getInt(9));
				order.setProdName(rs.getString(12));
				order.setDescript(rs.getString(13));
				order.setThumb1(rs.getString(25));
				
				orders.add(order);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return orders;
	}
	public int selectOrderNo(String uid) {
		int ordNo = 0;
		try {
			logger.info("selectOrder...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_NO);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordNo = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return ordNo;
	}
	public List<ProductVO> selectOrderProducts(String prodNo) {
		List<ProductVO> total = new ArrayList<>();
		try {
			logger.info("selectOrderProducts...");
			conn = getConnection();
			psmt = conn.prepareStatement(ProductSql.SELECT_ORDER_PRODUCTS);
			psmt.setString(1, prodNo);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductVO order = new ProductVO();
				order.setPrice(rs.getInt(1));
				order.setDiscount(rs.getInt(2));
				order.setPoint(rs.getInt(3));
				order.setDelivery(rs.getInt(4));
				
				total.add(order);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
}
