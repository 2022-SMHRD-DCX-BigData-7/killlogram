package com.smhrd.domain;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ChatRoomDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();
    
	public List<ChatRoomVO> getChatRoomsByLimit(int cr_limit) throws Exception {
	    List<ChatRoomVO> chatRoom = null;
	    try {
	    	chatRoom = sqlSession.selectList("getChatRoomsByLimit", cr_limit);
	       
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("채팅방 리스트를 불러오는 데 실패했습니다.");
	    }
	    return chatRoom;
	}
    
}
