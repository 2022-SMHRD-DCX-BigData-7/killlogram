package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.domain.ExerciseDAO;
import com.smhrd.domain.ExerciseVO;

@WebServlet("/MonthExercise")
public class MonthExercise extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[MonthExercise]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id"); // userId 파라미터 가져오기

        try {
            ExerciseDAO dao = new ExerciseDAO();
            Map<String, List<ExerciseVO>> monthExerciseMap = dao.MonthExerciseList(user_id);



            out.print(new Gson().toJson(monthExerciseMap));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"운동 칼로리 정보를 불러오는 데 실패했습니다.\"}");
            out.flush();
        } finally {
            out.close();
        }
    }
}
