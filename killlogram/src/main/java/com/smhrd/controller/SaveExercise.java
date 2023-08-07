package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.domain.ExerciseDAO;
import com.smhrd.domain.ExerciseVO;

@WebServlet("/SaveExercise")
public class SaveExercise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("[SaveExercise]");

	    request.setCharacterEncoding("utf-8");

	    String user_id = request.getParameter("user_id");
	    Float user_weight = Float.parseFloat(request.getParameter("user_weight"));
	    int exercise_time = Integer.parseInt(request.getParameter("exercise_time"));
	    String selectExercise = request.getParameter("exercise_strength");

	    Float exercise_strength = 0.0F;

	    if (selectExercise != null) {
	        if (selectExercise.equals("lowWeight") || selectExercise.equals("volleyball")) {
	            exercise_strength = 3.0F;
	        } else if (selectExercise.equals("fastwalk")) {
	            exercise_strength = 4.0F;
	        } else if (selectExercise.equals("badminton")) {
	            exercise_strength = 4.5F;
	        } else if (selectExercise.equals("dance")) {
	            exercise_strength = 4.8F;
	        } else if (selectExercise.equals("baseball")) {
	            exercise_strength = 5.0F;
	        } else if (selectExercise.equals("highWeight") || selectExercise.equals("basketball")) {
	            exercise_strength = 6.0F;
	        } else if (selectExercise.equals("jogging") || selectExercise.equals("tennis") || selectExercise.equals("soccer")) {
	            exercise_strength = 7.0F;
	        } else if (selectExercise.equals("mountain")) {
	            exercise_strength = 7.5F;
	        } else if (selectExercise.equals("cycle") || selectExercise.equals("running")) {
	            exercise_strength = 8.0F;
	        } else if (selectExercise.equals("swim")) {
	            exercise_strength = 10.5F;
	        }
	    }
	    
    	System.out.println("selectExercise : " + selectExercise);
    	System.out.println("exercise_strength : " + exercise_strength);
	    


	    ExerciseVO savexercise = new ExerciseVO();
	    savexercise.setUser_id(user_id);
	    savexercise.setUser_weight(user_weight);
	    savexercise.setExercise_time(exercise_time);
	    savexercise.setExercise_strength(exercise_strength);
	    
	    ExerciseDAO exdao = new ExerciseDAO();
	    int cnt = exdao.saveExerciseKcal(savexercise);

	    if (cnt > 0) {
	        System.out.println("운동 칼로리 저장 성공");
	    } else {
	        System.out.println("운동 칼로리 저장 실패");
	    }
	    // ExerciseVO 객체를 JSON 문자열로 변환
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(savexercise);

	    // 응답 Content-Type을 application/json으로 설정
	    response.setContentType("application/json");

	    // JSON 응답을 클라이언트로 반환
	    response.getWriter().write(jsonResponse);
	}

}
