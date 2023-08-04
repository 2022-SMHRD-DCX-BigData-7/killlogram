package com.smhrd.domain;

import java.util.HashMap;
import java.util.List;
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
	public int deleteMyNutritionFacts(int[] nutriIdxArray) {
	    int totalDeleted = 0;
	    try {
	        for (int nutri_idx : nutriIdxArray) {
	            int cnt = sqlSession.delete("deleteMyNutritionFact", nutri_idx);
	            if (cnt > 0) {
	                totalDeleted++;
	            }
	        }

	        if (totalDeleted == nutriIdxArray.length) {
	            sqlSession.commit();
	        } else {
	            sqlSession.rollback();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return totalDeleted;
	}
	// 주간 칼로리 정보 조회
	public List<MyNutritionfactsVO> selectWeeklyCalories(String user_id) {
        List<MyNutritionfactsVO> myWeekNutriList = null;
        try {
        	if(user_id != null) {
        		SqlSession sqlSession = sqlSessionFactory.openSession();
        		myWeekNutriList = sqlSession.selectList("com.smhrd.database.NutritionfactsMapper.selectUserNutritionFacts", user_id);;
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myWeekNutriList;
    }
	
	// 월간 칼로리 정보 조회
	public List<MyNutritionfactsVO> MonhtselectUserNutritionFacts(String user_id) {
        List<MyNutritionfactsVO> myMonthNutriList = null;
        try {
        	if(user_id != null) {
        		SqlSession sqlSession = sqlSessionFactory.openSession();
        		myMonthNutriList = sqlSession.selectList("com.smhrd.database.NutritionfactsMapper.MonhtselectUserNutritionFacts", user_id);;
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMonthNutriList;
    }
}