package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.domain.MyNutritionfactsDAO;
import com.smhrd.domain.MyNutritionfactsVO;

@WebServlet("/SaveCaloriesServlet")
public class SaveCaloriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[SaveCaloriesServlet]");

        HttpSession session = request.getSession();

        String[] nutriIdxParams = request.getParameterValues("nutri_idx");

        // nutriIdx가 null이거나 비어있는지 검사
        if (nutriIdxParams != null && nutriIdxParams.length > 0) {
            int[] nutriIdxArray = new int[nutriIdxParams.length];

            String user_id = request.getParameter("user_id");
            Timestamp created_at = new Timestamp(System.currentTimeMillis());

                // insertMyNutritionFactInfo 메서드를 한 번만 호출하여 모든 음식 정보를 DB에 저장
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
        }
    }
}
