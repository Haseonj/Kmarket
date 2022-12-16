package kr.co.kmarket.controller.cs;

import java.io.IOException;
import java.util.List;

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
import kr.co.kmarket.vo.CateVO;

@WebServlet("/cs/board/write.do")
public class WriteController extends HttpServlet {

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
		
		List<BoardVO> cate1 = service.selectCate1();
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String group = req.getParameter("group");
		String cate1 = req.getParameter("type1");
		String cate2 = req.getParameter("type2");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		BoardVO vo = new BoardVO();
		vo.setUid(uid);
		vo.setGroup(group);
		vo.setC1Name(cate1);
		vo.setCate2(cate2);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setRegip(regip);
		
		service.insertArticle(vo);
		
		
		resp.sendRedirect("/Kmarket/cs/board/list.do?group=qna&cate="+cate1+"&type=list");

	}

}
