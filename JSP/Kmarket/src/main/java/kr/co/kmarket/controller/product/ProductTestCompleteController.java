package kr.co.kmarket.controller.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.OrderVO;

@WebServlet("/product/testcomplete.do")
public class ProductTestCompleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductCompleteController...");
		
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		
		OrderVO order = service.selectOrder(member.getUid());
		
		req.setAttribute("order", order);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/complete.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	}
	
}
