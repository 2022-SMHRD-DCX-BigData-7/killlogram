package com.smhrd.domain;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ExerciseDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    public int saveExerciseKcal(ExerciseVO savexercise) {
    	int cnt = 0;
    	try {
    		cnt = sqlSession.insert("com.smhrd.database.ExerciseMapper.saveExerciseKcal", savexercise);
    		
    		if(cnt>0) {
    			sqlSession.commit();
    		}else {
    			sqlSession.rollback();
    		}
    	}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
    	return cnt;
    }
	// 저장된 운동 칼로리 정보 조회
	public List<ExerciseVO> MyExerciseList(String user_id) throws Exception {
	    List<ExerciseVO> myExerciseList = null;
	    try {
	    	myExerciseList = sqlSession.selectList("MyExerciseList", user_id);
	       
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 불러오는 데 실패했습니다.");
	    }
	    return myExerciseList;
	}
	
	// 저장된 일간 운동 칼로리 정보 삭제
	public int deleteExercise(String user_id) throws Exception {
	    try {
	        int deletedRows = sqlSession.delete("DeleteExercise", user_id);
	        sqlSession.commit(); // 삭제된 행들을 실제로 커밋
	        return deletedRows;
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 삭제하는 데 실패했습니다.");
	    }
	}	
	
	// 저장된 주간 운동 칼로리 정보 조회
	public Map<String, List<ExerciseVO>> WeekExerciseList(String user_id) throws Exception {
	    Map<String, List<ExerciseVO>> weekExerciseMap = new HashMap<>();
	    try {
	        List<ExerciseVO> weekExerciseList = sqlSession.selectList("WeekExerciseList", user_id);

	        // 날짜별로 운동 목록을 정렬
	        Collections.sort(weekExerciseList, Comparator.comparing(ExerciseVO::getCreated_at));

	        // 날짜별로 운동 목록을 그룹화
	        LocalDate currentDate = null;
	        List<ExerciseVO> currentExerciseList = null;
	        for (ExerciseVO exercise : weekExerciseList) {
	            LocalDate exerciseDate = exercise.getCreated_at().toLocalDate();
	            if (!exerciseDate.equals(currentDate)) {
	                if (currentExerciseList != null) {
	                    weekExerciseMap.put(currentDate.toString(), currentExerciseList);
	                }
	                currentExerciseList = new ArrayList<>();
	                currentDate = exerciseDate;
	            }
	            currentExerciseList.add(exercise);
	        }

	        // 마지막 그룹의 운동 목록을 맵에 추가
	        if (currentExerciseList != null) {
	            weekExerciseMap.put(currentDate.toString(), currentExerciseList);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 불러오는 데 실패했습니다.");
	    }
	    return weekExerciseMap;
	}
	
	// 저장된 주간 운동 칼로리 정보 삭제
	public int DeleteWeekExercise(String user_id) throws Exception {
	    try {
	        int deleteWeekRows = sqlSession.delete("DeleteWeekExercise", user_id);
	        sqlSession.commit(); // 삭제된 행들을 실제로 커밋
	        return deleteWeekRows;
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 삭제하는 데 실패했습니다.");
	    }
	}
	
	// 저장된 월간 운동 칼로리 정보 조회
	public Map<String, List<ExerciseVO>> MonthExerciseList(String user_id) throws Exception {
	    Map<String, List<ExerciseVO>> monthExerciseMap = new HashMap<>();
	    try {
	        List<ExerciseVO> monthExerciseList = sqlSession.selectList("MonthExerciseList", user_id);

	        for (ExerciseVO exercise : monthExerciseList) {
	            String date = exercise.getCreated_at().toString(); // 날짜를 문자열로 변환
	            List<ExerciseVO> exercises = monthExerciseMap.get(date);
	            if (exercises == null) {
	                exercises = new ArrayList<>();
	                monthExerciseMap.put(date, exercises);
	            }
	            exercises.add(exercise);
	        }

	        
	        for (Map.Entry<String, List<ExerciseVO>> entry : monthExerciseMap.entrySet()) {
	            String date = entry.getKey();
	            List<ExerciseVO> exercises = entry.getValue();
	            System.out.println("Date: " + date);
	            for (ExerciseVO exercise : exercises) {
	                System.out.println("Exercise Index: " + exercise.getExercise_idx());
	                System.out.println("User ID: " + exercise.getUser_id());
	                System.out.println("User Weight: " + exercise.getUser_weight());
	                System.out.println("Exercise Time: " + exercise.getExercise_time());
	                System.out.println("Exercise Strength: " + exercise.getExercise_strength());
	                System.out.println("O2 Waste: " + exercise.getO2_waste());
	                System.out.println("Calories Waste: " + exercise.getCalories_waste());
	                System.out.println("Created At: " + exercise.getCreated_at());
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 불러오는 데 실패했습니다.");
	    }
	    return monthExerciseMap;
	}

	
	// 저장된 월간 운동 칼로리 정보 삭제
	public int DeleteMonthExercise(String user_id) throws Exception {
	    try {
	        int deleteMonthRows = sqlSession.delete("DeleteMonthExercise", user_id);
	        sqlSession.commit(); // 삭제된 행들을 실제로 커밋
	        return deleteMonthRows;
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("운동 칼로리 정보를 삭제하는 데 실패했습니다.");
	    }
	}
}
