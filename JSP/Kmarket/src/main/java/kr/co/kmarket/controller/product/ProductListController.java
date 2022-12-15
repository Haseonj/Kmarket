package kr.co.kmarket.controller.product;

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

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/product/list.do")
public class ProductListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCate1 = req.getParameter("cate1");
		String prodCate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		
		List<ProductVO> products = service.selectProducts(prodCate1, prodCate2);
		CateVO vo = service.selectProdCates(prodCate1, prodCate2);
		
		logger.debug("here1");		
		int total = service.selectCountTotal(prodCate1, prodCate2);
		
		logger.debug("here2");
		
		int lastPageNum = service.getLastPageNum(total);
		
		logger.debug("here3");
		
		int currentPage = service.getCurrentPage(pg);
		
		logger.debug("here4");
		
		int limitStart = service.getLimitStart(currentPage);
		
		logger.debug("here5");
		
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		logger.debug("here6");
		
		int pageStartNum = service.getPageStartNum(total, limitStart);
		
		logger.debug("here7");
		
		int start = service.getStartNum(currentPage);
		
		logger.debug("here8");
		
		int[] disprice = new int[]{};
		
		for(int i=1; i<=products.size(); i++) {
			ProductVO product = products.get(i);
			int oriprice = product.getPrice();
			disprice[i-1] = (int) (oriprice * (100-product.getDiscount()) * 0.01);
			req.setAttribute("disprice["+i+"]", disprice[i-1]);
		}
		
		req.setAttribute("products", products);
		req.setAttribute("vo", vo);
		req.setAttribute("pg", pg);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("limitStart", limitStart);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("start", start);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
