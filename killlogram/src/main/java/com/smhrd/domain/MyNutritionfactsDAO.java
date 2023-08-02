package com.smhrd.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MyNutritionfactsDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // Insert MyNutritionfactInfo into the database
    public boolean insertMyNutritionFactInfo(String meal, float calories, int nutriIdx, Date createdAt) {
        try {
            SqlSession sqlSession = sqlSessionFactory.openSession();
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("meal", meal);
            paramMap.put("calories", calories);
            paramMap.put("nutriIdx", nutriIdx);
            paramMap.put("createdAt", createdAt);

            int rowsInserted = sqlSession.insert("com.smhrd.database.NutritonfactsMapper.insertMyNutritionFactInfo", paramMap);
            sqlSession.commit();
            sqlSession.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
