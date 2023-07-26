package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// session에 저장된 회원정보를 삭제
		
				// 1. session에 객체 생성
				HttpSession session = request.getSession();

				// 2. session 삭제
				session.removeAttribute("loginMember");
				
				// 3. 삭제 후에는 main.jsp로 이동
				response.sendRedirect("index.jsp");
			
			}
}
