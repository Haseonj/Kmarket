package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/product/test.do")
public class ProductTestOrderController extends HttpServlet{

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
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		
		int recentpoint = service.selectMemberPoint(member.getUid());
		
		req.setAttribute("recentpoint", recentpoint);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ProductOrderController...POST");
		
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		List<CartVO> carts = (List<CartVO>) sess.getAttribute("sessCarts");
		
		Date nowDate = new Date();
		SimpleDateFormat newname = new SimpleDateFormat("yyyyMMdd");
		String today = newname.format(nowDate);
		Unit u1 = new Unit();
		int seq = u1.getSeq();
		
		String todaydate = today + seq;
		
		int ordNo = Integer.parseInt(todaydate);
		
		logger.debug(todaydate);
		
		String ordCount = req.getParameter("ordCount");
		String ordPrice = req.getParameter("ordPrice");
		String ordDiscount = req.getParameter("ordDiscount");
		String ordDelivery = req.getParameter("ordDelivery");
		String savePoint = req.getParameter("savePoint");
		String usedPoint = req.getParameter("point");
		String ordTotPrice = req.getParameter("ordTotPrice");
		String recipName = req.getParameter("recipName");
		String recipHp = req.getParameter("recipHp");
		String recipZip = req.getParameter("recipZip");
		String recipAddr1 = req.getParameter("recipAddr1");
		String recipAddr2 = req.getParameter("recipAddr2");
		String payment = req.getParameter("payment");
		int paymentvalue = Integer.parseInt(payment);
		
		int ordComplete = 0;
		
		if(paymentvalue == 4){
			ordComplete = 2;
		}else{
			ordComplete = 1;
		}
		
		
		String uid = member.getUid();
		int totalSavePoint = Integer.parseInt(savePoint);
		int totalUsedPoint = Integer.parseInt(usedPoint);
		
		String[] cartNos = req.getParameterValues("cartNo"); 
		
		OrderVO vo = new OrderVO();
		vo.setOrdNo(ordNo);
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
		vo.setOrdPayment(payment);
		vo.setOrdComplete(ordComplete);
		
		int result = service.insertOrder(vo);
		
		for(String cartNo : cartNos) {
			CartVO cart = service.selectCart(cartNo);
			service.insertOrderItem(cart, ordNo);
		}
		service.insertMemberPoint(uid, ordNo, savePoint);
		
		// 적립포인트 업데이트(member 테이블)
		logger.debug("updateSavememberpoint");
		service.updateSaveMemberPoint(totalSavePoint, uid);
		logger.debug("updateUsedmemberpoint");
		service.updateUsedMemberPoint(totalUsedPoint, uid);
		
		resp.sendRedirect("/Kmarket/product/testcomplete.do");
	}
	
}
