package com.smhrd.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationContext;
import org.apache.ibatis.javassist.compiler.ast.Member;

import com.smhrd.domain.KilllogramVO;
import com.smhrd.domain.MemberDAO;
import com.smhrd.domain.PostDAO;
import com.smhrd.domain.PostVO;

@MultipartConfig(
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 50 * 5
)

public class PostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		       
		System.out.println("[PostCon]"); 
		
		// 0. post방식 한글 인코딩
		request.setCharacterEncoding("UTF-8");
	
		
//		HttpSession session = request.getSession();
//		KilllogramVO kvo = (KilllogramVO)session.getAttribute("loginMember");
//		String id = kvo.getId();
		String id = request.getParameter("id");
		
		// 1. 파라미터 수집
		// session에서 id가져오기
		
		// String file = request.getParameter("post_file");
		String title = request.getParameter("post_title");
		String content = request.getParameter("post_content");
		System.out.println(id);
		// System.out.println(file);
		System.out.println(title);
		System.out.println(content);
		
		Collection<Part> parts = request.getParts();
		String filePath = null;
		for(Part file1 : parts) {
			if(!file1.getName().equals("post_file")) continue;
			
			// 사용자가 업로드한 파일 이름 알아오기
			String originName = file1.getSubmittedFileName();
			System.out.println("파일 이름 : "+originName);
			
			// 사용자가 업로드한 파일에 input 스트림 연결
			InputStream fis = file1.getInputStream();
			String realPath = request.getServletContext().getRealPath("/upload");
			
			// 파일 경로
			filePath = realPath + File.separator + originName;
			
			// 파일 저장
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[]buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			
			fis.close();
			fos.close();
		}
		
		String file = filePath;
		
		// 2. member_member 객체에 담아주기
		PostVO post_member = new PostVO(title, content, id, file);
		
		// 받아온 값 확인
		System.out.println("post_file 내용 : " + post_member.getPost_file());
		System.out.println("toString 내용 : " + post_member.toString());

		

		// 3. (DAO에 메소드 생성 -> Mapper.xml에 SQL문 작성)
		// 3-1. DAO 객체 생성
		PostDAO dao = new PostDAO();
		// 3-2. DAO의 메소드에 join.html에서 받아온 값 joinMember 담아주기
		// 3-3. DAO의 메소드 결과값 담아주기
		int cnt = dao.insertPost(post_member);

		// 4. 명령 후 처리
		String page ="";
		if(cnt>0) {
			System.out.println("게시물 작성 성공");
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("게시물 작성 실패");
			page = "write.jsp";
			response.sendRedirect("write.jsp");
		}
	}
}
