package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.smhrd.domain.MyNutritionfactsDAO;

@WebServlet("/DeleteMyNutri")
public class DeleteMyNutri extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("DeleteMyNutri");

        HttpSession session = request.getSession();

        String[] nutriIdxParams = request.getParameterValues("nutri_idx");
        if (nutriIdxParams != null && nutriIdxParams.length > 0) {
            int[] nutriIdxArray = new int[nutriIdxParams.length];
            for (int i = 0; i < nutriIdxParams.length; i++) {
                String[] parts = nutriIdxParams[i].split(",");
                for (String part : parts) {
                    if (part.matches("\\d+")) {
                        int nutriIdx = Integer.parseInt(part);
                        nutriIdxArray[i] = nutriIdx;
                    }
                }
            }

            MyNutritionfactsDAO MNdao = new MyNutritionfactsDAO();
            int deletedCount = MNdao.deleteMyNutritionFacts(nutriIdxArray);

            if (deletedCount == nutriIdxArray.length) {
                // 삭제 성공 시 success 필드를 true로 가지는 JSON 응답을 보냅니다.
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": true}");
                System.out.println("칼로리 삭제 성공!");
            } else {
                // 삭제 실패 시 success 필드를 false로 가지는 JSON 응답을 보냅니다.
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": false}");
                System.out.println("삭제할 데이터가 없습니다.");
            }
        }
    }
}

