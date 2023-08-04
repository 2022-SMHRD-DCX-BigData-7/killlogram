package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;
import com.smhrd.database.SqlSessionManager;
import com.smhrd.domain.MyNutritionfactsDAO;
import com.smhrd.domain.MyNutritionfactsVO;
import com.smhrd.domain.NutritionfactsDAO;
import com.smhrd.domain.NutritionfactsVO;

//WeekNutriList 서블릿
@WebServlet("/WeekNutriList")
public class WeekNutriList extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     System.out.println("[WeekNutriList]");

     String nutri_idx = request.getParameter("nutri_idx");
     
     MyNutritionfactsDAO mydao = new MyNutritionfactsDAO();
     List<MyNutritionfactsVO> mylist = mydao.selectMyNutritionFacts(nutri_idx);

     Gson gson = new Gson();
     
     String result = gson.toJson(mylist);
     
     response.setContentType("application/json");
     response.setCharacterEncoding("utf-8");
     
     PrintWriter out = response.getWriter();
     out.print(result);
 }
}
