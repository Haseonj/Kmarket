package kr.co.kmarket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.MainService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/index.do")
public class IndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private MainService service = MainService.INSTANCE;
	
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ProductVO> bests = service.selectBestProduct();
		List<ProductVO> hits = service.selectHitProduct();
		List<ProductVO> recs = service.selectRecProduct();
		List<ProductVO> latests = service.selectLatestProduct();
		List<ProductVO> hots = service.selectHotProduct();
		List<ProductVO> dis = service.selectDisProduct();
		
		req.setAttribute("bests", bests);
		req.setAttribute("hits", hits);
		req.setAttribute("recs", recs);
		req.setAttribute("latests", latests);
		req.setAttribute("hots", hots);
		req.setAttribute("dis", dis);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
