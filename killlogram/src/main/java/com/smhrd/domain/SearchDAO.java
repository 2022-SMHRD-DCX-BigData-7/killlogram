package com.smhrd.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class SearchDAO {
    
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();



    // 특정 키워드로 게시물을 검색하는 메서드
    public List<SearchVO> searchPostsByKeyword(String keyword) {
        List<SearchVO> searchResults = null;

        try {
            // MyBatis의 매퍼를 이용하여 검색 쿼리 실행
        	searchResults = sqlSession.selectList("searchPostsByKeyword", keyword);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // SqlSession을 사용한 후에는 반드시 close() 메서드를 호출하여 반환
            if (sqlSession != null) {
                sqlSession.close();
            }
        }

        return searchResults;
    }
}
