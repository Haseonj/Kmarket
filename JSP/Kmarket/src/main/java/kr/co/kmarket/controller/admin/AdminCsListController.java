package kr.co.kmarket.controller.admin;

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

import com.google.gson.Gson;

import kr.co.kmarket.service.BoardService;
import kr.co.kmarket.vo.BoardVO;

@WebServlet("/admin/cs/list.do")
public class AdminCsListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String type = req.getParameter("type");
		String pg = req.getParameter("pg");
		String cate = req.getParameter("cate");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentpage(pg);
		
		// 전체 페이지 갯수
		int total = 0;
		if(cate.equals("0")) {
			total = service.selectCountTotal(group);
		}else {
			total = service.selectCountTotal(cate, group);
		}
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 글 가져오기
		List<BoardVO> articles = null;
		if(cate.equals("0")) {
			articles = service.selectAdminArticle(group, start);
		}else {
			articles = service.selectAdminArticle(group, start, cate);
		}
		
		
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum + 1);
		
		req.setAttribute("type", type);
		req.setAttribute("pg", pg);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
