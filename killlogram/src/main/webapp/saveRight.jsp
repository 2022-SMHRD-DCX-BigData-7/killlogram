<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@page import="com.smhrd.domain.PostDAO"%>
<%@page import="com.smhrd.domain.PostVO"%>
<%@page import="com.smhrd.domain.SaveVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.SaveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="False"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<%
		
		KilllogramVO mvo = (KilllogramVO)session.getAttribute("loginMember");
		String user_id = null;
		if(mvo != null){
		user_id = mvo.getId();
		}
 	   SaveDAO saveDAO = new SaveDAO();
 	   List<PostVO> saveList = saveDAO.selectSave(user_id);

	   PostDAO postDAO = new PostDAO();
	   List<PostVO> postList = postDAO.selectPost(); 
	   
		// 이미지 파일 이름을 DB에서 가져오는 로직
		PostVO image = null;
%>

<html>
	<head>
		<title> No Sidebar(save)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.jsp" id="logo">Killlogram</a></h1>
							<!-- <p>A responsive site template by HTML5 UP</p> -->
						</div>
					</div>
				</header>

					<nav id="nav1">
					 <ul>
		        <c:choose>
		            <%-- 로그인 정보가 있을 경우 --%>
		            <c:when test="${not empty loginMember}">
		                <li><a href="chat.jsp">채팅</a></li>
		                <li><a class="myp" href="mypage.jsp">마이페이지</a></li> 
		                <li><a class="log" href="LogoutCon">로그아웃</a></li>
		                <p>아이디 : ${loginMember.id}</p>
		            </c:when>
		            <%-- 로그인 정보가 없을 경우 --%>
		            <c:otherwise>
		                <li><a href="login.jsp">로그인</a></li>
		                <li><a href="register.jsp">회원가입</a></li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
				</nav>

			<nav id="nav">
				<ul>
					<li><a href="index.jsp">홈</a></li>
					<li><a href="search.jsp">검색</a></li>
					<li><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li class="current"><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

				

			<!-- Main -->
            <section id="main">
				<div class="container">
				   <div class="row">
					  <div class="col-12">
						 <div class="content">
 
							<!-- Content -->
 
							   <article class="box page-content">
 
								  <header>
									 <h2>save</h2>
									 <p>저장된 게시물을 확인하세요</p>
<!-- 									  <h2 class="major"><span>Save List</span></h2>
 -->								  </header>
 
 									<!-- 저장된 게시물 출력  -->
									 <table border="1">
										
										<h2 class="major"><span></span></h2>
										<%for(PostVO save:saveList){ %>
										<% if (saveList != null && !saveList.isEmpty()) { %>
												
													<tr>
													<td>작성자 : <%=save.getUser_id() %>님 </td>
													</tr>
													<tr>
													<td>제목 : <%=save.getPost_title() %></td>
													</tr>
													<tr>
													<td>내용 : <%=save.getPost_content() %> </td>
													</tr> 
													<tr>
													<td>
													<% 
															image = postDAO.selectImage(save.getPost_idx());
															if (image!=null && image.getPost_file() != null){ 
																if (save.getPost_idx() == image.getPost_idx()){
																	String fName = image.getPost_file().split("\\\\")[image.getPost_file().split("\\\\").length-1];
																	out.print("<img src='upload/"+fName+"' alt='설정 후 이미지' style='width: 500px; height: 500px;'/>");
																}//if1
																}//if2
															else{
																out.print("파일이 존재하지 않습니다.");
															}
															
															%>
													</td>
													</tr>		
													<tr>
													<td><h2 class="major"><span></span></h2></td>
													</tr>							
												<%} %>		
											<%} %>
										
									</table>			

							   </article>
 
						 </div>
					  </div>
					  <!-- <div class="col-12">
 
						 Features
							<section class="box features">
							  
							   <div>
								  <div class="row">
									 <div class="col-3 col-6-medium col-12-small">
 
										Feature
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
											  <h3><a href="#">title1</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
										   
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										Feature
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
											  <h3><a href="#">title2</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
											  <p>
												 
											  </p>
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										Feature
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
											  <h3><a href="#">title3</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
											  <p>
												 
											  </p>
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										Feature
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
											  <h3><a href="#">title4</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
											  <p>
												 
											  </p>
										   </section>
 
									 </div>
									
								  </div>
							   </div>
							</section>
 
					  </div>
				   </div>
				</div>
			 </section>
 
		
 
	   </div>
  -->
	   <!-- Scripts -->
		  <script src="assets/js/jquery.min.js"></script>
		  <script src="assets/js/jquery.dropotron.min.js"></script>
		  <script src="assets/js/jquery.scrolly.min.js"></script>
		  <script src="assets/js/browser.min.js"></script>
		  <script src="assets/js/breakpoints.min.js"></script>
		  <script src="assets/js/util.js"></script>
		  <script src="assets/js/main.js"></script>
 
	</body>
 </html>