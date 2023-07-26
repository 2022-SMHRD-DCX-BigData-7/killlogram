package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Killlogram_member;
import com.smhrd.domain.MemberDAO;



public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// logincon에 잘 들어왔는지 확인
		System.out.println("[LoginCon]");

		// 0. post방식 한글인코딩
		request.setCharacterEncoding("UTF-8");
				
				
		// 1. 파라미터 수집
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
				
		// 2. 받아온 값을 member 객체에 묶어 담아주기
		Killlogram_member login = new Killlogram_member(id, pw);
				
	
		// 받아온 값 확인 --> toString
		System.out.println(login.toString());
		
		//memberDAO, MemberMApper.sql에서 login기능을 위한 것들 만들고오기
				
		// 3-1. DAO 만들기
		// 3-2. DAO 객체 생성
		MemberDAO dao = new  MemberDAO();
		// 3-3. DAO 메소드 호출 -> member객체에 결과값 담기
		Killlogram_member loginMember = dao.selectMember(login);
		
		// 4. 명령 후 처리
		if(loginMember != null) {
			System.out.println("로그인 성공~~");
			response.sendRedirect("index.jsp");
			// 회원정보를 session에 저장
			// Servlet에서 session 사용할때는 session객체 생성
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
		}else {
			// 회원가입 실패하면 main.jsp 이동 -> Redirect 방식
			System.out.println("로그인 실패ㅠㅠ");
			response.sendRedirect("login.jsp");
		}

		
	}

		
		}


