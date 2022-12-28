package kr.co.kmarket.controller.cs.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.service.BoardService;
import kr.co.kmarket.vo.BoardVO;

@WebServlet("/cs/faq/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		String no = req.getParameter("no");
		
		BoardVO faq = service.selectFaqArticle(no);
		
		req.setAttribute("faq", faq);
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/faq/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
