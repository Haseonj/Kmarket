package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/product/goorder.do")
public class ProductGoOrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductCartController...");
		
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO)sess.getAttribute("sessMember");
		
		String prodNo = req.getParameter("prodNo");
		String count = req.getParameter("count");
		String uid = member.getUid();
		String price = req.getParameter("price");
		String discount = req.getParameter("discount");
		String point = req.getParameter("point");
		String delivery = req.getParameter("delivery");
		String total = req.getParameter("total");
		
		
		logger.debug("prodNo : " + prodNo);
		logger.debug("count : " + count);
		logger.debug("uid : " + uid);
		logger.debug("price : " + price);
		logger.debug("discount : " + discount);
		logger.debug("point : " + point);
		logger.debug("delivery : " + delivery);
		logger.debug("total : " + total);
		
		
		OrderVO vo = new OrderVO();
		vo.setOrdUid(uid);
		vo.setOrdCount(count);
		vo.setOrdDiscount(discount);
		vo.setOrdDelivery(delivery);
		vo.setOrdTotPrice(total);
		vo.setOrdPrice(price);
		vo.setSavePoint(point);
		
		int result = service.insertOrder(vo);
		OrderVO order = service.selectLatestOrder(uid);
		service.insertOrderItem(order, prodNo);
        
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	
}
