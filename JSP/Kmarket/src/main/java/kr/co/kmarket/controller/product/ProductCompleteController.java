package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.util.List;

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
import kr.co.kmarket.vo.CartVO;
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.OrderVO;

@WebServlet("/product/complete.do")
public class ProductCompleteController extends HttpServlet{

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
		List<CartVO> carts = (List<CartVO>) sess.getAttribute("sessCarts");
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		
		OrderVO order = service.selectOrder(member.getUid());
		
		int price = 0;
		int discount = 0;
		int delivery = 0;
		int point = 0;
		
		for(int i=0; i<carts.size(); i++) { 
			price += carts.get(i).getPrice() * carts.get(i).getCount();
			discount += carts.get(i).getDiscount() * carts.get(i).getPrice() * carts.get(i).getCount() / 100;
			delivery += carts.get(i).getDelivery();
			point += carts.get(i).getPoint();
			service.deleteCartList(member.getUid(), carts.get(i).getCartNo());
		}
		int productstotalprice = price - discount + delivery;
		
		
		req.setAttribute("totalprice", price);
		req.setAttribute("productstotalprice", productstotalprice);
		req.setAttribute("totalcount", carts.size());
		req.setAttribute("discount", discount);
		req.setAttribute("delivery", delivery);
		req.setAttribute("point", point);
		req.setAttribute("order", order);
		req.setAttribute("carts", carts);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/complete.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	}
	
}
