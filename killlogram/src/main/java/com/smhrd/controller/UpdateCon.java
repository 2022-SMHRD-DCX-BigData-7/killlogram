package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Killlogram_member;
import com.smhrd.domain.MemberDAO;


public class UpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[UpdateCon]");
		// 0. post방식 한글인코딩
		request.setCharacterEncoding("UTF-8");
		
		
		// 1. 파라미터 수집
		// 1-1. email은 입력받지 않고 session에서 가져와야함
		HttpSession session = request.getSession();
		Killlogram_member loginMember = (Killlogram_member)session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		// 1-2. 입력받은 pw, tel, address 파라미터 수집
		String nick = request.getParameter("nick");
		String pw = request.getParameter("password");
	
		// 2. 받아온 값을 member 객체에 묶어 담아주기
		Killlogram_member update = new Killlogram_member(id, nick, pw);
	
	
		// 받아온 값 확인 -->  toString()
		System.out.println("update 내용 : " + update.toString());
	
		// 3-1. DAO 메소드 만들기, mapper.xml에 SQL문 작성
		// 3-2. DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 3-3. DAO 메소드 사용 -> 메소드 결과/반환 타입대로 다시 담아주기
		int cnt = dao.updateMember(update);
		
		
		// 4. 명령 후 처리
		// 회원정보 수정 성공했으면 main.jsp
		// 실패했으면 update.jsp로
		if(cnt>0) {
			System.out.println("회원정보수정 완료");
			// 회원정보 수정된 내용을 다시 session에 저장
			// 대신에 이미 저장된 이름으로 덮어쓰기를 해야된다~~
			session.setAttribute("loginMember", update);
			response.sendRedirect("UpdateSuccess.jsp");
		}else {
			System.out.println("회원정보수정 실패");
			response.sendRedirect("member_info.jsp");
		}
			
		

	}

}
