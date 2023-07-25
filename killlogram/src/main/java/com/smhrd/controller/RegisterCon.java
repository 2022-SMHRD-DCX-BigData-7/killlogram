package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.MemberDAO;
import com.smhrd.domain.Killlogram_member;


public class RegisterCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[JoinCon]"); //JoinCon 들어왔다는 확인 출력 가능
		
		// 0. post방식 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(nick);
		
		// 2. member_member 객체에 담아주기
		Killlogram_member joinMember = new Killlogram_member(id, pw, name, nick);
		
		// 3. (DAO에 메소드 생성 -> Mapper.xml에 SQL문 작성)
		// 3-1. DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 3-2. DAO의 메소드에 join.html에서 받아온 값 joinMember 담아주기
		// 3-3. DAO의 메소드 결과값 담아주기
		int cnt = dao.insertMember(joinMember);

		// 4. 명령 후 처리
		String page ="";
		if(cnt>0) {
			page = "registerSuccess.html";
		}else {
			page = "register.html";
		}
		
		response.sendRedirect(page);
	}
	

}
