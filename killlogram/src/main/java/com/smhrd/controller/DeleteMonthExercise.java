package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.ExerciseDAO;

@WebServlet("/DeleteMonthExercise")
public class DeleteMonthExercise extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("DeleteMonthExercise");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id"); // userId 파라미터 가져오기

        try {
        	ExerciseDAO exdao = new ExerciseDAO();
            int deleteMonthRows = exdao.DeleteMonthExercise(user_id);

            if (deleteMonthRows > 0) {
                // 삭제가 성공적으로 이루어진 경우 응답으로 success 값을 전달
                out.print("{\"success\": true}");
            } else {
                out.print("{\"success\": false}");
            }
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"칼로리 정보를 삭제하는 데 실패했습니다.\"}");
            out.flush();
        }
    }
}
