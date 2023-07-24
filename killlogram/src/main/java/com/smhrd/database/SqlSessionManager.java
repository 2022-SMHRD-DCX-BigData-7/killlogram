package com.smhrd.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	// SqlSessionManager 객체가 실행되면 SqlSessionFactory를 돌려주기 위하여
	// try~catch문 밖에 다시 선언
	
	// 객체 만들어서 try문에서는 넣어주기만 함
	// 나중에돋 쓰기 위해 => static
	static SqlSessionFactory sqlSessionFactory;

	// 다른곳에서 SqlSessionManager 객체를 호출할 때
	// 자동으로 한 번 실행되게끔 하기 위함
	static {
		try {
			// MyBatic 설정 파일 config.xml을 읽어 DB에 연결
			String resource = "com/smhrd/database/config.xml";
			// 연결되어있는 내용대로 resource를 활용해 내용을 연결함
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
			// SqlSessionFactoryBuilder : 설정파일을 바탕으로 SqlSessionFactory 생성
			// SqlSessionFactory : SqlSession을 설정(Connection 객체와 같은 역할)
			// 커넥션 풀을 SqlSessionFactory가 만들어냄 (SqlSessionFactory은 커넥션 풀을 포함)=> 자원 소모를 줄일 수 있음
			// SqlSession : SQL 설정, 트랜잭션 관리
		
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	// SqlSessionFactory를 DAO에서 사용할 수 있게 만드는 메소드
	// getSqlSession는 만든 메소드 
	public static SqlSessionFactory getSqlSession() {
		
		return sqlSessionFactory;
	}
	// 대문자는 객체, 소문자는 객체를 부르는 이름
}
