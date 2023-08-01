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

 	   SaveDAO saveDAO = new SaveDAO();
 	   List<SaveVO> saveList = saveDAO.selectSave();

	   PostDAO postDAO = new PostDAO();
	   List<PostVO> postList = postDAO.selectPost(); 
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
						
				 <%-- 로그인 정보가 없으면 로그인 할 수 있도록 --%>
				 <c:choose>
			 	<c:when test="${empty loginMember}">
			 	</c:when>
			 	
			 	<c:otherwise>
			 	
			 		<li><a href="chat.jsp">채팅</a></li>
					<li><a class="myp" href="mypage.jsp">마이페이지</a></li> 
					<li><a class="log" href="LogoutCon">로그아웃</a></li>
				
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
								  </header>
 
 									<!-- 저장된 게시물 출력  -->
									 <table border="1">
										
										<%for(PostVO post:postList){ %>
											<% if(save.getPost_idx() == post.getPost_idx()) %>
										<tr>
										<td>ID : <%=save.getUser_id() %></td>
										</tr>
										<tr>
										<td>Title : <%=save.getCreated_at() %></td>
										</tr>
										<tr>
										<td>Content : <%=save.getPost_idx() %></td>
										</tr>
																				
									<%} %>		
									</table>			

							   </article>
 
						 </div>
					  </div>
					  <div class="col-12">
 
						 <!-- Features -->
							<section class="box features">
							   <h2 class="major"><span>Save List</span></h2>
							   <div>
								  <div class="row">
									 <div class="col-3 col-6-medium col-12-small">
 
										<!-- Feature -->
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
											  <h3><a href="#">title1</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
										   
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										<!-- Feature -->
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
											  <h3><a href="#">title2</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
											  <p>
												 
											  </p>
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										<!-- Feature -->
										   <section class="box feature">
											  <a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
											  <h3><a href="#">title3</a></h3>
											  <p class="icon fa-clock">5 days ago</p>
											  <p>
												 
											  </p>
										   </section>
 
									 </div>
									 <div class="col-3 col-6-medium col-12-small">
 
										<!-- Feature -->
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