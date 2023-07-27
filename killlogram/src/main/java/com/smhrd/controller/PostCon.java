package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.smhrd.domain.KilllogramVO;
import com.smhrd.domain.MemberDAO;
import com.smhrd.domain.PostDAO;
import com.smhrd.domain.PostVO;


public class PostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[PostCon]"); 
		
		// 0. post방식 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
		String id = request.getParameter("user_id");
		String file = request.getParameter("post_file");
		String title = request.getParameter("post_title");
		String content = request.getParameter("post_content");
		System.out.println(id);
		System.out.println(file);
		System.out.println(title);
		System.out.println(content);
		
		// 2. member_member 객체에 담아주기
		PostVO postMember = new PostVO(title, content, id, file);
		
	

		// 3. (DAO에 메소드 생성 -> Mapper.xml에 SQL문 작성)
		// 3-1. DAO 객체 생성
		PostDAO dao = new PostDAO();
		// 3-2. DAO의 메소드에 join.html에서 받아온 값 joinMember 담아주기
		// 3-3. DAO의 메소드 결과값 담아주기
		int cnt = dao.insertPost(postMember);

		// 4. 명령 후 처리
		String page ="";
		if(cnt>0) {
			page = "index.jsp";
		}else {
			page = "write.jsp";
		}
		
		response.sendRedirect(page);
	}
	

}
