package kr.co.kmarket.controller.cs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.BoardService;
import kr.co.kmarket.vo.BoardVO;

@WebServlet("/cs/board/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	
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
		
		BoardVO vo = service.selectArticle(no);
		
		req.setAttribute("group", group);
		req.setAttribute("vo", vo);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
<<<<<<< Updated upstream
=======
		req.setAttribute("pg", pg);
		req.setAttribute("no", no);
>>>>>>> Stashed changes
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
