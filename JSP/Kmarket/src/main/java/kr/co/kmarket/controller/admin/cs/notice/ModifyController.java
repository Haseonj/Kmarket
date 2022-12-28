package kr.co.kmarket.controller.admin.cs.notice;

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

@WebServlet("/admin/cs/notice/modify.do")
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
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		BoardVO notice = service.selectNoticeArticle(no);
		
		req.setAttribute("notice", notice);
		req.setAttribute("no", no);
		req.setAttribute("pg", pg);
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/notice/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("type1");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		logger.debug("cate1: " +cate1);
		logger.debug("title: " +title);
		logger.debug("content: " +content);
		logger.debug("no: " +no);
		
		service.updateNoticeArticle(no, cate1, title, content);
		
		resp.sendRedirect("/Kmarket/admin/cs/notice/view.do?cate1="+cate1+"&no="+no+"&pg="+pg);
	}

}
