package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.smhrd.domain.ChattingDAO;
import com.smhrd.domain.ChattingVO;
import com.smhrd.domain.PostVO;

@WebServlet("/SendChatServlet")
public class SendChatServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    System.out.println("[SendChatServlet]");
	    request.setCharacterEncoding("UTF-8");
	        
	    HttpSession session = request.getSession();
	    String talker = request.getParameter("user_id"); // 로그인한 사용자의 user_id 가져오기
	    System.out.println("발화자 : " + talker);
	    
	    String talk = request.getParameter("talk");
	    System.out.println("발화내용 : " + talk);
	    
	    // 새로운 채팅 객체 생성
	    ChattingVO newChat = new ChattingVO(talker, talk);

	    ChattingDAO cdao = new ChattingDAO();
	        
	    int cnt = cdao.insertChat(newChat);
	        
	    // JSON 응답 생성 (성공 여부 등)
	    JsonObject jsonResponse = new JsonObject();
	    jsonResponse.addProperty("success", cnt > 0);
	    response.setContentType("application/json");
	    response.getWriter().write(jsonResponse.toString());
	        
	    // 4. 명령 후 처리
	    if (cnt > 0) {
	        System.out.println("저장 성공");
	    } else {
	        System.out.println("채팅 전송 실패");
	    }
	}

}
