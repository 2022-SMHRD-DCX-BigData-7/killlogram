package com.smhrd.domain;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

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
			System.out.println("dao : "+ postMember.toString());
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
	
	
	
	// 피드 글 조회
	public List<PostVO> selectPost() {
        List<PostVO> postList = null;

        try {

			/* SqlSession sqlSession = sqlSessionFactory.openSession(); */
        		postList = sqlSession.selectList("selectPost");
        	
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
			
		} 

        return postList;
    }
	
	//이미지 조회
	public PostVO selectImage(int post_idx) {
        PostVO image = null;

        try {

			/* SqlSession sqlSession = sqlSessionFactory.openSession(); */
        		image = sqlSession.selectOne("selectImage",post_idx);
        	
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
			
		} 

        return image;
    }
}



