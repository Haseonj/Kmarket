package kr.co.kmarket.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/admin/product/register.do")
public class ProdRegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CateVO> categories = service.selectProdCate1();
		req.setAttribute("categories", categories);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/register.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.debug("ProdRegister...0");
		String savePath = service.getSavePath(req);
		MultipartRequest mr = service.uploadFile(req, savePath);
		
		logger.debug("ProdRegister...1");
		String prodCate1 = mr.getParameter("prodCate1");
		String prodCate2 = mr.getParameter("prodCate2");
		String prodName = mr.getParameter("prodName");
		String descript = mr.getParameter("descript");
		String company = mr.getParameter("company");
		String seller = mr.getParameter("seller");
		String price = mr.getParameter("price");
		String discount = mr.getParameter("discount");
		String point = mr.getParameter("point");
		String stock = mr.getParameter("stock");
		String delivery = mr.getParameter("delivery");
		String thumb1 = mr.getFilesystemName("thumb1");
		String thumb2 = mr.getFilesystemName("thumb2");
		String thumb3 = mr.getFilesystemName("thumb3");
		String detail = mr.getFilesystemName("detail");
		String status = mr.getParameter("status");
		String duty = mr.getParameter("duty");
		String receipt = mr.getParameter("receipt");
		String bizType = mr.getParameter("bizType");
		String origin = mr.getParameter("origin");
		String ip = req.getRemoteAddr();
		
		
		String newthumb1 = "";
		String newthumb2 = "";
		String newthumb3 = "";
		String newdetail = "";
		
		
		if(thumb1 != null || thumb2 != null || thumb3 != null || detail != null) {
			// 파일명 수정
			logger.debug("ProdRegister...2");
			newthumb1 = service.renameFile(thumb1, savePath);
			newthumb2 = service.renameFile(thumb2, savePath);
			newthumb3 = service.renameFile(thumb3, savePath);
			newdetail = service.renameFile(detail, savePath);
		}
		
		logger.debug("ProdRegister...3");
		ProductVO vo = new ProductVO();
		vo.setProdCate1(prodCate1);
		vo.setProdCate2(prodCate2);
		vo.setProdName(prodName);
		vo.setDescript(descript);
		vo.setCompany(company);
		vo.setPrice(price);
		vo.setDiscount(discount);
		vo.setPoint(point);
		vo.setStock(stock);
		vo.setDelivery(delivery);
		vo.setThumb1(newthumb1);
		vo.setThumb2(newthumb2);
		vo.setThumb3(newthumb3);
		vo.setDetail(newdetail);
		vo.setStatus(status);
		vo.setDuty(duty);
		vo.setReceipt(receipt);
		vo.setBizType(bizType);
		vo.setOrigin(origin);
		vo.setSeller(seller);
		vo.setIp(ip);
		
		logger.debug("ProdRegister...4");
		service.insertProduct(vo);
		
		resp.sendRedirect("/Kmarket/admin/product/register.do");
	}
}
