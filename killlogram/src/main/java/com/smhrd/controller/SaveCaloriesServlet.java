package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.MyNutritionfactsDAO;

@WebServlet("/SaveCaloriesServlet")
public class SaveCaloriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[SaveCaloriesServlet - doPost]");

        // 파라미터 수집
        String meal = request.getParameter("meal");
        float calories = Float.parseFloat(request.getParameter("calories"));
        int nutriIdx = Integer.parseInt(request.getParameter("nutriIdx"));
        Date createdAt = new Date();

        // 해당 정보를 데이터베이스에 저장하는 로직을 수행합니다.
        // 여기서는 예시를 위해 MyNutritionfactsDAO 클래스를 사용하여 데이터베이스에 저장하는 것으로 가정합니다.
        MyNutritionfactsDAO myNutritionfactsDAO = new MyNutritionfactsDAO();
        boolean result = myNutritionfactsDAO.insertMyNutritionFactInfo(meal, calories, nutriIdx, createdAt);

        // 결과를 클라이언트에 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        out.print(resultMap);
    }
}
