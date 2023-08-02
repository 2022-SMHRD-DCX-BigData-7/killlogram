package com.smhrd.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class SaveDAO {
	
	// 게시물 저장
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	public int insertSave(SaveVO saveMember) {
		int cnt = 0;

		try {
			//insert("MemberMapper.xml SQL태그 id", 넘어줄 값 )
			// Mapper가 여러개인 경우 com.smhrd.database.MemberMapper.insertMember
			System.out.println("dao : "+ saveMember.toString());
			cnt = sqlSession.insert("insertSave", saveMember);
			
			
			// 내가 원하는 일을 성공했다면 DB에 반영
			if(cnt>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		}catch (Exception e) {
			e.printStackTrace();

		}finally {
			// 빌려온 연결고리를 반납
			sqlSession.close();
		}//finally문 끝
		return cnt;
		
	}//insertMember 메소드 끝
	
	// 피드 글 조회
		public List<PostVO> selectSave(String user_id) {
	        List<PostVO> saveList = null;

	        try {

				/* SqlSession sqlSession = sqlSessionFactory.openSession(); */
	        		saveList = sqlSession.selectList("selectSave",user_id);
	        	
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
				sqlSession.close();
			} 

	        return saveList;
	    }
		
		
		
	}

