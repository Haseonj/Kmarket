package kr.co.kmarket.controller.admin.cs.notice;

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

@WebServlet("/admin/cs/notice/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		String pg = req.getParameter("pg");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentpage(pg);
		
		// 전체 페이지 갯수
		int total = 0;
		if(cate1.equals("all")) {
			total =	service.selectNoticeCountTotal();
		}else {
			total =	service.selectNoticeCountTotal(cate1);
		}
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);

		
		List<BoardVO> notice = null;
		if(cate1.equals("all")) {
			notice = service.selectNoticeArticles(start);
		}else {
			notice = service.selectNoticeArticles(cate1, start);
		}
		
		
		req.setAttribute("notice", notice);
		req.setAttribute("cate1", cate1);
		req.setAttribute("pg", pg);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum + 1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/notice/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
