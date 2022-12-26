package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.JsonObject;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CartVO;
import kr.co.kmarket.vo.MemberVO;

@WebServlet("/product/cart.do")
public class ProductCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductCartController...");
		HttpSession session = req.getSession();
		MemberVO sessMember = (MemberVO) session.getAttribute("sessMember");
		
		logger.debug("here1");
		String uid = sessMember.getUid();
		
		logger.debug("here2");
		List<CartVO> carts = service.selectCarts(uid);
		
		logger.debug("here3");
		req.setAttribute("carts", carts);
		
		logger.debug("here4");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/cart.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductCartController...");
		String prodNo = req.getParameter("prodNo");
		String uid = req.getParameter("uid");
		String count = req.getParameter("count");
		String price = req.getParameter("price");
		String discount = req.getParameter("discount");
		String point = req.getParameter("point");
		String delivery = req.getParameter("delivery");
		String total = req.getParameter("total");
		
		logger.info("prodCart uid : " + uid);
		
		CartVO vo =	new CartVO();
		vo.setUid(uid);
		vo.setProdNo(prodNo);
		vo.setCount(count);
		vo.setPrice(price);
		vo.setDiscount(discount); 
        vo.setPoint(point);
		vo.setDelivery(delivery);
		vo.setTotal(total);
		
		int result = service.insertCart(vo);
        
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
}
