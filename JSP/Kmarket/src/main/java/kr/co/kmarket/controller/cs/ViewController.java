package kr.co.kmarket.controller.cs;

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

@WebServlet("/cs/board/view.do")
public class ViewController extends HttpServlet {

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
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		
		req.setAttribute("group", group);
		BoardVO vo = null; 
		BoardVO answer = null;
		if(type.equals("modify")) {
			vo = service.selectArticle(no, cate);	
		}else {
			vo = service.selectArticle(no);
			answer = service.selectAnswer(no);
		}
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("vo", vo);
		req.setAttribute("type", type);
		req.setAttribute("pg", pg);
		req.setAttribute("no", no);
		req.setAttribute("answer", answer);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
