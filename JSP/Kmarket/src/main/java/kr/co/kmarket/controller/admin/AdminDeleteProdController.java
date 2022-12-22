package kr.co.kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.kmarket.service.AdminService;
@WebServlet("/admin/delete.do")
public class AdminDeleteProdController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.instance;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] prodNo =req.getParameterValues("checkBoxArr");
		logger.info(prodNo[0]);
		int result[] = new int [prodNo.length];
		JsonObject json = new JsonObject();
		
		for(int i=0; i<prodNo.length; i++) {
			result[i] = service.admindeleteproduct(prodNo[i]);
			json.addProperty("result["+i+"]", result[i]);
		}
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}

}
