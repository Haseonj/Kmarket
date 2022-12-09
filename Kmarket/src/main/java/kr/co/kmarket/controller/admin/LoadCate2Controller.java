package kr.co.kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CateVO;

@WebServlet("/admin/product/loadcate2.do")
public class LoadCate2Controller extends HttpServlet{

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
		logger.info("loadcate2controller...");
		String prodCate1 = req.getParameter("prodCate1");

		CateVO cate2 = service.selectProdCate2(prodCate1);
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(cate2);
		
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData.toString());
		
	}
}
