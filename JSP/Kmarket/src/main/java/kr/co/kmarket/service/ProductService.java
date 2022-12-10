package kr.co.kmarket.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket.dao.ProductDAO;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;


public enum ProductService {

	INSTANCE;
	private ProductDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProductService() {
		dao = new ProductDAO();
	}
	
	public void insertProduct(ProductVO vo) {
		logger.info("ProductService...insertProdcut...");
		dao.insertProduct(vo);
	}
	public List<CateVO> selectProdCate1() {
		logger.info("ProductService...selectProdCate1...");
		return dao.selectProdCate1();
	}
	public List<CateVO> selectProdCate2(String prodCate1) {
		logger.info("ProductService...selectProdCate2...");
		return dao.selectProdCate2(prodCate1);
	}
	
	// 서비스 로직
	public String getSavePath(HttpServletRequest req) {
		ServletContext application = req.getServletContext();
		return application.getRealPath("/file");
	}
	
	public MultipartRequest uploadFile(HttpServletRequest req, String savePath) throws IOException {
		int maxSize = 1024 *1024 * 10;
		return new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public String renameFile(String fname, String savePath) {
		
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		String name = UUID.randomUUID().toString();
		String newName = name+ext;
		
		File f1 = new File(savePath+"/"+fname);
		File f2 = new File(savePath+"/"+newName);
		
		f1.renameTo(f2);
		
		return newName;
		
	}
}
