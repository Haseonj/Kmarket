package kr.co.kmarket.controller.cs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.kmarket.service.BoardService;
import kr.co.kmarket.vo.BoardVO;
import kr.co.kmarket.vo.CateVO;

@WebServlet("/cs/board/category.do")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		
		List<BoardVO> cate2 = service.selectCate2(cate1);
		
		Gson gson = new Gson();
		resp.setContentType("application/json;charset=UTF-8");
		String jsonData = gson.toJson(cate2);
		
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData.toString());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
