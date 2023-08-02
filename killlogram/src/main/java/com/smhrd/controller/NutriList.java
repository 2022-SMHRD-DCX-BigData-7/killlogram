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
import com.smhrd.domain.NutritonfactsDAO;
import com.smhrd.domain.NutritonfactsVO;

@WebServlet("/NutriList")
public class NutriList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[NutriList]");

        // 파라미터 수집
        String food_name = request.getParameter("food_name");

        // 데이터베이스 음식 정보를 조회하기 위해 NutritonfactsDAO 사용
        NutritonfactsDAO dao = new NutritonfactsDAO();
        List<NutritonfactsVO> mlist = dao.selectNutri(food_name);

        Gson gson = new Gson();

        // toJson()으로 만든값은 String타입이다
        String result = gson.toJson(mlist);

        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        out.print(result);
    }
}
