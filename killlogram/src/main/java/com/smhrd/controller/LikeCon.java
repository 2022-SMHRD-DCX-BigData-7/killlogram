
package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.LikeDAO;
import com.smhrd.domain.LikeVO;


public class LikeCon extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 게시물 번호를 파라미터로 받아옵니다.
        int post_idx = Integer.parseInt(request.getParameter("post_idx"));

        // LikeDAO를 이용하여 게시물의 좋아요 수를 가져옵니다.
        LikeDAO likeDAO = new LikeDAO();
        int likeCount = likeDAO.getLikeCountByPostIdx(post_idx);

        // 좋아요 수를 JSON 형태로 변환하여 클라이언트로 전송합니다.
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"likeCount\": " + likeCount + "}");
        out.flush();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 클라이언트에서 넘어온 파라미터 값 받기
        int post_idx = Integer.parseInt(request.getParameter("post_idx"));
        String user_id = request.getParameter("user_id");

        // LikeDAO 객체 생성
        LikeDAO likeDAO = new LikeDAO();

        // 사용자가 해당 게시물에 좋아요를 눌렀는지 확인
        boolean isLiked = likeDAO.isLikedByUser(post_idx, user_id);
        System.out.println("좋아요 눌렀는지 : "+isLiked);

        if (isLiked) {
        	return;
        } else {
            // 좋아요를 누르지 않은 상태라면, 좋아요 추가
            LikeVO like = new LikeVO();
            like.setPost_idx(post_idx);
            like.setUser_id(user_id);
            // created_at은 DB에서 자동으로 설정하도록 설계되어 있다고 가정

            likeDAO.addLike(like);

            response.getWriter().println("좋아요를 눌렀습니다.");
            
         // 좋아요가 추가되었으므로 좋아요 수를 다시 가져옵니다.
            int updatedLikeCount = likeDAO.getLikeCountByPostIdx(post_idx);

            // 좋아요 수를 JSON 형태로 변환하여 클라이언트로 전송합니다.
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print("{\"likeCount\": " + updatedLikeCount + "}");
            out.flush();
        }
    }
}
