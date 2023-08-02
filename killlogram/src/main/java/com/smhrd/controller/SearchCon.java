package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import com.smhrd.domain.SearchDAO;
import com.smhrd.domain.SearchVO;
import com.smhrd.database.SqlSessionManager;


public class SearchCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        SearchDAO searchDAO = new SearchDAO();
        List<SearchVO> searchResults = searchDAO.searchPostsByKeyword(keyword);
        request.setAttribute("postList", searchResults);
        // 검색 결과를 search.jsp로 포워딩
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
