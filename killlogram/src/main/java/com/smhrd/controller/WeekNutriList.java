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
import com.smhrd.domain.MyNutritionfactsDAO;
import com.smhrd.domain.MyNutritionfactsVO;

@WebServlet("/WeekNutriList")
public class WeekNutriList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[WeekNutriList]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id"); // userId 파라미터 가져오기
        
        try {
            MyNutritionfactsDAO dao = new MyNutritionfactsDAO();
            List<MyNutritionfactsVO> weekNutriList = dao.WeekNutriList(user_id); // userId 전달
            
            String food_name = request.getParameter("food_name");
            String calories = request.getParameter("calories");
            
            out.print(new Gson().toJson(weekNutriList));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"주간 칼로리 정보를 불러오는 데 실패했습니다.\"}");
            out.flush();
        }
    }
}
