package com.smhrd.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class PostDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 게시글 작성 코드 
	
	public int insertPost(PostVO postMember) {
		int cnt = 0;

		try {
			//insert("MemberMapper.xml SQL태그 id", 넘어줄 값 )
			// Mapper가 여러개인 경우 com.smhrd.database.MemberMapper.insertMember
			System.out.println("dao : "+postMember.toString());
			cnt = sqlSession.insert("insertPost", postMember);
			
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
	
}
