package com.smhrd.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class NutritonfactsDAO {
	
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public List<NutritonfactsVO> selectNutri(String foodName) {
        List<NutritonfactsVO> nutriList = null;

        try {
            // 음식 이름이 null이 아닐 경우에만 데이터베이스에서 음식 정보 조회
            if (foodName != null) {
                SqlSession sqlSession = sqlSessionFactory.openSession();
                nutriList = sqlSession.selectList("com.smhrd.database.NutritonfactsMapper.selectNutriByName", "%" + foodName + "%");
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nutriList;
    }

}