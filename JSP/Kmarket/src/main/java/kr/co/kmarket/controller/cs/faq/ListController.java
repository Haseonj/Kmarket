package kr.co.kmarket.controller.cs.faq;

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

@WebServlet("/cs/faq/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService service = BoardService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		String[] user 		= {"가입", "탈퇴", "회원정보", "로그인"};
		String[] event 		= {"쿠폰/할인혜택", "포인트", "제휴", "이벤트"};
		String[] order 		= {"상품", "결제", "구매내역", "영수증/증빙"};
		String[] shipping 	= {"배송상태/기간", "배송정보확인/변경", "해외배송", "당일배송", "해외직구"};
		String[] cancel 	= {"반품신청/철회", "반품정보확인/변경", "교환 AS신청/철회", "교환정보확인/변경", "취소신청/철회", "취소확인/환불정보"};
		String[] travel 	= {"여행/숙박", "항공"};
		String[] safe 		= {"서비스 이용규칙 위반", "지식재산권침해", "법령 및 정책위반 상품", "게시물 정책위반", "직거래/외부거래유도", "표시광고", "청소년 위해상품/이미지"};
		
		String[] cate2 = null;
		
		if(cate1.equals("user")) {
			cate2 = user;
		}else if(cate1.equals("event")) {
			cate2 = event;
		}else if(cate1.equals("order")) {
			cate2 = order;
		}else if(cate1.equals("shipping")) {
			cate2 = shipping;
		}else if(cate1.equals("cancel")) {
			cate2 = cancel;
		}else if(cate1.equals("travel")) {
			cate2 = travel;
		}else if(cate1.equals("safe")) {
			cate2 = safe;
		}
		
		List<BoardVO> faq = service.selectFaqArticles(cate1);
		
		req.setAttribute("faq", faq);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/faq/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
