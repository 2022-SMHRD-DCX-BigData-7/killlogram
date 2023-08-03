package com.smhrd.domain;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MyNutritionfactsDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();

    // MyNutritionfactInfo DB 삽입
	public int insertMyNutritionFactInfo(MyNutritionfactsVO mnFacts, int[] nutriIdxArray) {
        int cnt = 0;
        try{
            // Map을 이용해 파라미터로 넘길 데이터를 준비
            Map<String, Object> param = new HashMap<>();
            param.put("user_id", mnFacts.getUser_id());
            param.put("nutriidxArray", nutriIdxArray);

            // MyBatis를 사용하여 데이터베이스에 INSERT 쿼리 실행
            cnt = sqlSession.insert("insertMyNutritionFactInfo", param);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
}
