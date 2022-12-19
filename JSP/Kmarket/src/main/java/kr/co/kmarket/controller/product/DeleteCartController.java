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

@WebServlet("/product/deletecart.do")
public class DeleteCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("DeleteCartController...0");
		HttpSession sess = req.getSession();
		MemberVO member = (MemberVO) sess.getAttribute("sessMember");
		
		logger.info("DeleteCartController...1");
		String[] cartNo = req.getParameterValues("checkBoxArr");
		String uid = member.getUid();
		
		logger.info("DeleteCartController...2"+uid);
		int result[] = new int [cartNo.length];
		JsonObject json = new JsonObject();
		
		for(int i=0; i<cartNo.length; i++) {
			logger.info("DeleteCartController...3"+cartNo[i]);
			result[i] = service.deleteCartList(uid, cartNo[i]);
			
			logger.info("DeleteCartController...4"+result[i]);
			json.addProperty("result["+i+"]", result[i]);
			
		}
		logger.info("DeleteCartController...5");
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	
}
