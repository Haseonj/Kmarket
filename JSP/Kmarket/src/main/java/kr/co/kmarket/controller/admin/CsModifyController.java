package kr.co.kmarket.controller.admin;

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

@WebServlet("/admin/cs/modify.do")
public class CsModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String cate2 = req.getParameter("cate2");
		String type = req.getParameter("type");
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		BoardVO vo = service.selectArticle(no, cate);
		
		req.setAttribute("vo", vo);
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("cate2", cate2);
		req.setAttribute("type", type);
		req.setAttribute("pg", pg);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		String content = req.getParameter("content");
		String title = req.getParameter("title");
		
		if(cate2.equals("0")) {
			service.updateArticle(cate, title, content, no);
		}else {
			service.updateArticle(cate,  cate2, title, content, no);
		}
		cate2 = URLEncoder.encode(cate2, "UTF-8");
		
		resp.sendRedirect("/Kmarket/admin/cs/view.do?group="+group+"&cate="+cate+"&cate2="+cate2+"&type=view&no="+no+"&pg="+pg);
	}

}
