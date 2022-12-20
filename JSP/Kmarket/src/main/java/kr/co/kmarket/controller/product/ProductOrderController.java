package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import kr.co.kmarket.vo.OrderVO;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/product/order.do")
public class ProductOrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductOrderController...GET");
		
		HttpSession sess = req.getSession();
		List<CartVO> carts = (List<CartVO>) sess.getAttribute("sessCarts");
		
		int price = 0;
		int discount = 0;
		int delivery = 0;
		int point = 0;
		
		for(int i=0; i<carts.size(); i++) { 
			price += carts.get(i).getPrice() * carts.get(i).getCount();
			discount += carts.get(i).getDiscount() * carts.get(i).getPrice() * carts.get(i).getCount() / 100;
			delivery += carts.get(i).getDelivery();
			point += carts.get(i).getPoint();
			
		}
		int productstotalprice = price - discount + delivery ;
		
		req.setAttribute("totalprice", price);
		req.setAttribute("productstotalprice", productstotalprice);
		req.setAttribute("totalcount", carts.size());
		req.setAttribute("discount", discount);
		req.setAttribute("delivery", delivery);
		req.setAttribute("discount", discount);
		req.setAttribute("point", point);
		
		req.setAttribute("carts", carts);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductOrderController...POST");
		
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		
		String ordCount = req.getParameter("ordCount");
		String ordPrice = req.getParameter("ordPrice");
		String ordDiscount = req.getParameter("ordDiscount");
		String ordDelivery = req.getParameter("ordDelivery");
		String savePoint = req.getParameter("savePoint");
		String usedPoint = req.getParameter("usedPoint");
		String ordTotPrice = req.getParameter("ordTotPrice");
		String recipName = req.getParameter("recipName");
		String recipHp = req.getParameter("recipHp");
		String recipZip = req.getParameter("recipZip");
		String recipAddr1 = req.getParameter("recipAddr1");
		String recipAddr2 = req.getParameter("recipAddr2");
		String ordPayment = req.getParameter("ordPayment");
		String ordComplete = req.getParameter("ordComplete");
		String uid = member.getUid();
		
		OrderVO vo = new OrderVO();
		vo.setOrdUid(uid);
		vo.setOrdCount(ordCount);
		vo.setOrdPrice(ordPrice);
		vo.setOrdDiscount(ordDiscount);
		vo.setOrdDelivery(ordDelivery);
		vo.setSavePoint(savePoint);
		vo.setUsedPoint(usedPoint);
		vo.setOrdTotPrice(ordTotPrice);
		vo.setRecipName(recipName);
		vo.setRecipHp(recipHp);
		vo.setRecipZip(recipZip);
		vo.setRecipAddr1(recipAddr1);
		vo.setRecipAddr2(recipAddr2);
		vo.setOrdPayment(ordPayment);
		vo.setOrdComplete(ordComplete);
		
		int result = service.insertOrder(vo);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
}
