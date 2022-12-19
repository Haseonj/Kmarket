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

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/admin/product/list.do")
public class AdminProductListController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pg =req.getParameter("pg");
		String search=req.getParameter("search");
		String search2=req.getParameter("search2");
	
	
	
			List<ProductVO> adproducts = service.selectadminproducts();
			req.setAttribute("adpd", adproducts);
		
	
			if(search2 != null) {
			List<ProductVO> searchadpds = service.searchadminproducts(search,search2);
			req.setAttribute("adpd", searchadpds);
			}
	
		
		int total = service.selectadminCountTotal();
		int lastPageNum = service.getLastPageNum(total);
		int currentPage = service.getCurrentPage(pg);
		int limitStart = service.getLimitStart(currentPage);
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		int pageStartNum = service.getPageStartNum(total, limitStart);
		int start = service.getStartNum(currentPage);
		
		req.setAttribute("pg", pg);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("limitStart", limitStart);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("start", start);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
