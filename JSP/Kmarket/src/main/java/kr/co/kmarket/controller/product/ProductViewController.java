package kr.co.kmarket.controller.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CateVO;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/product/view.do")
public class ProductViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;

	@Override
	public void init() throws ServletException {
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCate1 = req.getParameter("cate1");
		String prodCate2 = req.getParameter("cate2");
		String prodNo = req.getParameter("prodNo");
		String pg = req.getParameter("pg");
		
		ProductVO product = service.selectProduct(prodNo);
		CateVO vo = service.selectProdCates(prodCate1, prodCate2);

		int oriprice = product.getPrice();
		int disprice = (int) (oriprice * (100-product.getDiscount()) * 0.01);
		
		req.setAttribute("product", product);
		req.setAttribute("vo", vo);
		req.setAttribute("pg", pg);
		req.setAttribute("disprice", disprice);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/view.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
