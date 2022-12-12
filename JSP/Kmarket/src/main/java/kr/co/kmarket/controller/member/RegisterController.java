package kr.co.kmarket.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.MemberService;
import kr.co.kmarket.vo.MemberVO;

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private MemberService service = MemberService.instance;
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 수신
		String uid = req.getParameter("km_uid");
		String pass1 = req.getParameter("km_pass1");
		String pass2 = req.getParameter("km_pass2");
		String name = req.getParameter("km_name");
		int gender = Integer.parseInt(req.getParameter("km_gender"));
		String email = req.getParameter("km_email");
		String hp = req.getParameter("km_hp");
		String zip = req.getParameter("km_zip");
		String addr1 = req.getParameter("km_addr1");
		String addr2 = req.getParameter("km_addr2");
		String regip = req.getRemoteAddr();
	
		// VO 데이터 생성
		MemberVO vo = new MemberVO();
		vo.setUid(uid);
		vo.setPass(pass1);
		vo.setName(name);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setHp(hp);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setRegip(regip);
		
		// 데이터베이스 처리
		service.insertMember(vo);
	
		// 리다이렉트
		resp.sendRedirect("/Kmarket/member/login.do");
	}
}