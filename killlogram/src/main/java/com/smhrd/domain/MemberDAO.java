package com.smhrd.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
	// DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게
			// SqlSession 생성
			SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			
			// 회원가입 기능 구현 메소드
			public int insertMember(KilllogramVO joinMember) {
				int cnt = 0;

				try {
					//insert("MemberMapper.xml SQL태그 id", 넘어줄 값 )
					// Mapper가 여러개인 경우 com.smhrd.database.MemberMapper.insertMember
					System.out.println("dao : "+joinMember.toString());
					cnt = sqlSession.insert("insertMember", joinMember);
					
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
			
			
			
			
			// 로그인 기능 구현 //selectmember 값을 member로 돌려준다
			public KilllogramVO selectMember(KilllogramVO login) {
				KilllogramVO loginMember = null;

				
				try {
					//select("MemberMapper.xml SQL태그 id", 넘어줄 값 )
					loginMember = sqlSession.selectOne("selectMember",login);//왜 one? //login엔 email,pw 들어가있음
			
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					sqlSession.close();
				}
					
				
				return loginMember;
				}//selectMember 메소드 끝
			
			
			// 회원 정보 수정 기능 구현
			public int updateMember(KilllogramVO update) {
				int cnt = 0;
				try {
					//update("MemberMapper.xml SQL태그 id", 넘어줄 값 )
					// Mapper가 여러개인 경우 com.smhrd.database.MemberMapper.updateMember
					cnt = sqlSession.insert("updateMember", update);
					
					if(cnt>0) {
						sqlSession.commit();
					} else {
						sqlSession.rollback();
					}
					
				}catch (Exception e) {
					e.printStackTrace();

				}finally {
					sqlSession.close();

				
			}
			
				return cnt;	
			
			
			}
			
			
			
		}

