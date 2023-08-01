package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.CommentDAO;
import com.smhrd.domain.CommentVO;
import com.smhrd.domain.KilllogramVO;
import com.smhrd.domain.PostVO;
import com.smhrd.domain.SaveDAO;
import com.smhrd.domain.SaveVO;


public class SaveCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("[CommentCon]"); 
		
		// 0. post방식 한글 인코딩
		request.setCharacterEncoding("UTF-8");
	
/*		HttpSession session = request.getSession();
		KilllogramVO kvo = (KilllogramVO)session.getAttribute("loginMember");
		String id = kvo.getId();*/
		// String id = request.getParameter("id");
		
		// 1. 파라미터 수집
		// session에서 id가져오기
//		String idx = request.getParameter("idx");
//		int post_idx =Integer.parseInt(idx);
//		
//		HttpSession session = request.getSession();
//		PostVO postvo = (PostVO)session.getAttribute("postList");
//		String post = PostVO.();
		
		HttpSession session = request.getSession();
		PostVO pvo = (PostVO)session.getAttribute("postList");
		
//		KilllogramVO kvo = (KilllogramVO)session.getAttribute("loginMember");
//		String id = kvo.getId();
		String id = request.getParameter("id");
		String idx = request.getParameter("idx"); 
		int post_idx = Integer.parseInt(idx);
		
		
		// 2. member_member 객체에 담아주기
		
		SaveVO save_member = new SaveVO(post_idx, id);
		
		
		// 받아온 값 확인
		System.out.println("id 내용 : " + save_member.getUser_id());
		System.out.println("post_idx 내용 : " + save_member.getPost_idx());
		//System.out.println("toString 내용 : " + comment_member.toString());


		// 3. (DAO에 메소드 생성 -> Mapper.xml에 SQL문 작성)
		// 3-1. DAO 객체 생성
		SaveDAO dao = new SaveDAO();
		// 3-2. DAO의 메소드에 join.html에서 받아온 값 joinMember 담아주기
		// 3-3. DAO의 메소드 결과값 담아주기
		int cnt = dao.insertSave(save_member);

		// 4. 명령 후 처리
		String page ="";
		if(cnt>0) {
			System.out.println("저장 성공");
			response.sendRedirect("saveRight.jsp");
		}else {
			System.out.println("댓글 작성 실패");
			page = "index.jsp";
			response.sendRedirect("index.jsp");
		}
	}


	

	}

