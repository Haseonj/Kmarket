package kr.co.kmarket.controller.admin.cs.faq;

import java.io.IOException;
import java.net.URLEncoder;

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

@WebServlet("/admin/cs/faq/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		BoardVO faq = service.selectFaqArticle(no);
		
		req.setAttribute("faq", faq);
		req.setAttribute("no", no);
		req.setAttribute("pg", pg);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/faq/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("type1");
		String cate2 = req.getParameter("type2");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		logger.debug("cate1: " +cate1);
		logger.debug("cate2: " +cate2);
		logger.debug("title: " +title);
		logger.debug("content: " +content);
		logger.debug("no: " +no);
		
		service.updateFaqArticle(no, cate1, cate2, title, content);
		
		cate2 = URLEncoder.encode(cate2, "UTF-8");
		
		resp.sendRedirect("/Kmarket/admin/cs/faq/view.do?cate1=all&cate2=all&no="+no+"&pg="+pg);
	}

}
