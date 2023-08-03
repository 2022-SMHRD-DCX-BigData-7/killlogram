package com.smhrd.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class LikeDAO {

    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();

    
    
    // 좋아요 추가
    public void addLike(LikeVO like) {
        try {
            sqlSession.insert("addLike", like); // "addLike"는 MyBatis XML 매퍼의 SQL ID입니다.
            sqlSession.commit(); // 변경 사항을 커밋합니다.
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //sqlSession.close(); // 세션을 닫습니다.
        }
    }

    // 사용자가 게시물에 좋아요를 눌렀는지 확인
    public boolean isLikedByUser(int post_idx, String user_id) {
        boolean result = false;
        try {
            LikeVO like = new LikeVO();
            like.setPost_idx(post_idx);
            like.setUser_id(user_id);
            int count = sqlSession.selectOne("isLikedByUser", like); // "isLikedByUser"는 MyBatis XML 매퍼의 SQL ID입니다.
            result = (count > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //sqlSession.close(); // 세션을 닫습니다.
        }
        return result;
    }
    
    public int getLikeCountByPostIdx(int post_idx) {
        int likeCount = 0;
        try {
            likeCount = sqlSession.selectOne("getLikeCountByPostIdx", post_idx);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //sqlSession.close();
        }
        return likeCount;
    }

    
}
