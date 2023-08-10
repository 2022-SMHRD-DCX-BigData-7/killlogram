package com.smhrd.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ChattingDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
    // 사용자 리스트
    public List<KilllogramVO> allMember() {
        List<KilllogramVO> memberList = null;
        try {
            memberList = sqlSession.selectList("allMember");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return memberList;
    }

    // 채팅 입력
    public int insertChat(ChattingVO chatMember) {
        int cnt = 0;
        try {
            cnt = sqlSession.insert("insertChat", chatMember);
            if(cnt > 0) {
                sqlSession.commit();
            } else {
                sqlSession.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
    
    // 채팅방 생성
    public int startChatRoom(ChatRoomVO chatstart) {
        int cnt = 0;
        try {
            cnt = sqlSession.insert("startChatRoom", chatstart);
            if(cnt > 0) {
                sqlSession.commit();
            } else {
                sqlSession.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
    
}
