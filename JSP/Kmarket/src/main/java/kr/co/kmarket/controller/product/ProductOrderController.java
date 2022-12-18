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
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.OrderVO;

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
		MemberVO vo = (MemberVO)sess.getAttribute("sessMember");
		
		String uid = vo.getUid();
		
		int orderNo = service.selectOrderNo(uid);
		List<OrderVO> orders = service.selectOrder(orderNo);
		
		req.setAttribute("orders", orders);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductOrderController...POST");
		
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO)sess.getAttribute("sessMember");
		
		String[] prodNums = req.getParameterValues("checkBoxArr");
		String[] count = req.getParameterValues("count");
		String uid = member.getUid();
		
		//logger.debug("prodNums : " + prodNums.length);
		//logger.debug("count : " + count.length);
		
		
		int price = 0;
		int discount = 0;
		int delivery = 0;
		int point = 0;
		
		/*
		List<ProductVO> total = new ArrayList<>();
		
		for(int i=0; i<prodNums.length; i++) {
			total = service.selectOrderProducts(prodNums[i]);
			price += total.get(i).getPrice() * Integer.parseInt(count[i]);
			discount += total.get(i).getDiscount() * price / 100 * Integer.parseInt(count[i]);
			delivery += total.get(i).getDelivery();
			point += total.get(i).getPoint();
		}
		int totalprice = price - discount + delivery ;
		
		OrderVO vo = new OrderVO();
		vo.setOrdPrice(price);
		vo.setOrdCount(count.length);
		vo.setDelivery(delivery);
		vo.setSavePoint(point);
		vo.setOrdTotPrice(totalprice);
		
		int result = service.insertOrder(vo);
		OrderVO order = service.selectLatestOrder(uid);
		
		for(int k=0; k<prodNums.length; k++) {
			service.insertOrderItem(order, prodNums[k]);
		}
		*/
		
		JsonObject json = new JsonObject();
		json.addProperty("result", 1);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
}
