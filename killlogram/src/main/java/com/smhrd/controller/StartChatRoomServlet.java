package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.smhrd.domain.ChatRoomVO;
import com.smhrd.domain.ChattingDAO;

@WebServlet("/StartChatRoomServlet")
public class StartChatRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("[StartChatRoomServlet]");
        request.setCharacterEncoding("UTF-8");
        
        // 클라이언트로부터 받은 데이터 가져오기
        String user_id = request.getParameter("user_id");
        int cr_limit = Integer.parseInt(request.getParameter("cr_limit"));

        ChattingDAO crdao = new ChattingDAO();
        
        // 채팅방 생성 로직 구현
        ChatRoomVO chatRoom = new ChatRoomVO();
        chatRoom.setUser_id(user_id);
        chatRoom.setCr_limit(cr_limit);
        
        // ChattingDAO의 startChatRoom 메서드를 호출하여 채팅방 생성
        int result = crdao.startChatRoom(chatRoom);

        // 응답 데이터 생성
        JsonObject jsonResponse = new JsonObject();
        if (result > 0) {
            System.out.println("채팅방 생성 성공");
            jsonResponse.addProperty("success", true);
        } else {
            System.out.println("채팅방 생성 실패");
            jsonResponse.addProperty("success", false);
        }

        // 클라이언트에게 응답 데이터 보내기
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}