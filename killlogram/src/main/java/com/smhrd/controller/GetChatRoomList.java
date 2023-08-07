package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.domain.ChatRoomDAO;
import com.smhrd.domain.ChatRoomVO;

@WebServlet("/GetChatRoomList")
public class GetChatRoomList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[ChatRoomList]");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id"); // userId 파라미터 가져오기
        String cr_limitStr = request.getParameter("cr_limit");

        // cr_limit가 null이 아닌지 확인
        int cr_limit = 0; // 기본 값 할당
        if (cr_limitStr != null) {
            try {
                cr_limit = Integer.parseInt(cr_limitStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        try {
            ChatRoomDAO dao = new ChatRoomDAO();
            List<ChatRoomVO> chatRooms = dao.getChatRoomsByLimit(cr_limit);
            
            out.print(new Gson().toJson(chatRooms));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"채팅방 목록을 불러오는 데 실패했습니다.\"}");
            out.flush();
        }
    }
}
