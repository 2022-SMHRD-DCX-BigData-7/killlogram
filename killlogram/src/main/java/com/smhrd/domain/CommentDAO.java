package com.smhrd.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CommentDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	// 댓글 작성 코드 
	
	public int insertComment(CommentVO commentMember) {
		int cnt = 0;

		try {
			//insert("MemberMapper.xml SQL태그 id", 넘어줄 값 )
			// Mapper가 여러개인 경우 com.smhrd.database.MemberMapper.insertMember
			System.out.println("dao : "+ commentMember.toString());
			cnt = sqlSession.insert("insertComment", commentMember);
			
			
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
	
	// 댓글 조회
		public List<CommentVO> selectComment() {
	        List<CommentVO> CommentList = null;

	        try {

				/* SqlSession sqlSession = sqlSessionFactory.openSession(); */
	        		CommentList = sqlSession.selectList("selectComment");
	        	
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
				
			} 

	        return CommentList;
	    }
		
		
		
	}


