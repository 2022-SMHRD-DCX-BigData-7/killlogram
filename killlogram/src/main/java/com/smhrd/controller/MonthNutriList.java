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

@WebServlet("/MonthNutriList")
public class MonthNutriList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[MonthNutriList]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        String user_id = request.getParameter("user_id");


        try {
            MyNutritionfactsDAO dao = new MyNutritionfactsDAO();
            List<MyNutritionfactsVO> myMonthNutriList = dao.MonthNutriList(user_id); // userId 전달
            
            String food_name = request.getParameter("food_name");
            String calories = request.getParameter("calories");
            
            out.print(new Gson().toJson(myMonthNutriList));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"월간 칼로리 정보를 불러오는 데 실패했습니다.\"}");
            out.flush();
        }
    }
}