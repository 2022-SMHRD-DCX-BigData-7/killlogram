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

        String user_id = request.getParameter("user_id");


        // 데이터베이스 음식 정보를 조회하기 위해 NutritionfactsDAO 사용
        MyNutritionfactsDAO mydao = new MyNutritionfactsDAO();
        List<MyNutritionfactsVO> mylist = mydao.selectWeeklyCalories(user_id);

        Gson gson = new Gson();

        // toJson()으로 만든값은 String타입이다
        String result = gson.toJson(mylist);

        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        out.print(result);
    }
}