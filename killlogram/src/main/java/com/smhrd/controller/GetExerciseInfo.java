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
import com.smhrd.domain.ExerciseDAO;
import com.smhrd.domain.ExerciseVO;


@WebServlet("/GetExerciseInfo")
public class GetExerciseInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[GetExercise]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id"); // userId 파라미터 가져오기
        
        try {
            ExerciseDAO dao = new ExerciseDAO();
            List<ExerciseVO> getExercise = dao.MyExerciseList(user_id); // userId 전달
            
            String o2_waste = request.getParameter("o2_waste");
            String calories_waste = request.getParameter("calories_waste");
            
            out.print(new Gson().toJson(getExercise));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"운동 칼로리 정보를 불러오는 데 실패했습니다.\"}");
            out.flush();
        }
    }
}
