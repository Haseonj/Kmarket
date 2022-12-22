package kr.co.kmarket.controller.admin;

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

@WebServlet("/admin/cs/write.do")
public class CsWriteController extends HttpServlet{

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
		String type = req.getParameter("type");
		
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate1");
		String uid = req.getParameter("uid");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		logger.debug("write parameter : " +group);
		logger.debug("write parameter : " +cate);
		logger.debug("write parameter : " +uid);
		logger.debug("write parameter : " +title);
		logger.debug("write parameter : " +content);
		
		BoardVO vo = new BoardVO();
		vo.setUid(uid);
		vo.setGroup(group);
		vo.setC1Name(cate);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setRegip(regip);
		
		service.insertNoticeArticle(vo);
		
		resp.sendRedirect("/Kmarket/admin/cs/list.do?group="+group+"&cate="+cate+"&type=list");
		
	}
}
