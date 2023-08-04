package com.smhrd.controller;

import java.io.IOException;
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

//WeekNutriList 서블릿
@WebServlet("/WeekNutriList")
public class WeekNutriList extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     System.out.println("[WeekNutriList]");

     HttpSession session = request.getSession();

     String[] nutriIdxParams = request.getParameterValues("nutri_idx");

     // nutriIdx가 null이거나 비어있는지 검사
     if (nutriIdxParams != null && nutriIdxParams.length > 0) {
         int[] nutriIdxArray = new int[nutriIdxParams.length];

         String user_id = request.getParameter("user_id");
         Timestamp created_at = new Timestamp(System.currentTimeMillis());

         SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
         try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
             MyNutritionfactsDAO MNdao = new MyNutritionfactsDAO();
             for (int i = 0; i < nutriIdxParams.length; i++) {
                 String[] parts = nutriIdxParams[i].split(",");
                 for (String part : parts) {
                     if (part.matches("\\d+")) {
                         int nutriIdx = Integer.parseInt(part);
                         nutriIdxArray[i] = nutriIdx;

                         MyNutritionfactsVO MNfacts = new MyNutritionfactsVO();
                         MNfacts.setUser_id(user_id);
                         MNfacts.setNutri_idx(nutriIdx);
                         MNfacts.setCreated_at(created_at);

                         int cnt = MNdao.insertMyNutritionFactInfo(MNfacts, nutriIdxArray);

                         if (cnt > 0) {
                             System.out.println("칼로리 정보 저장 성공!");
                         } else {
                             System.out.println("올바르지 않은 입력값이 포함되어 있습니다.");
                         }
                     } else {
                         System.out.println("유효하지 않은 숫자 형식입니다. 값: " + part);
                         return;
                     }
                 }
             }
         }
         // 사용자 ID가 DB에 존재하는 경우, MyNutritionfactsDAO를 사용하여 영양 성분 정보를 가져옴
         if (user_id != null && !user_id.isEmpty()) {
             MyNutritionfactsDAO MNdao = new MyNutritionfactsDAO();
             List<MyNutritionfactsVO> nutritionList = MNdao.selectMyNutritionFacts(user_id, nutriIdxArray);

             // 주간 칼로리 정보를 클라이언트로 응답
             Gson gson = new Gson();
             String json = gson.toJson(nutritionList);
             response.setContentType("application/json");
             response.setCharacterEncoding("UTF-8");
             response.getWriter().write(json);
         }
     }
 }
}
