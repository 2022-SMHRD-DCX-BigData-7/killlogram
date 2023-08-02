<%@page import="com.smhrd.domain.CommentDAO"%>
<%@page import="com.smhrd.domain.CommentVO"%>
<%@page import="com.smhrd.domain.PostVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="False"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 
<!DOCTYPE HTML>
<%
	// select.jsp참고해서
	// 게시글 불러오는 DAO 객체 새성
	// List<객체> = dao.selectAll();
	// List를 해당 위치에서 반복문으로 출력
	
		PostDAO postDAO = new PostDAO();
/*     PostVO postMember = (String)request.getParameter("post_member"); */	
 		List<PostVO> postList = postDAO.selectPost();

	// 댓글 dao써서 list담아주는거
	
	   CommentDAO commentDAO = new CommentDAO();
/*     PostVO postMember = (String)request.getParameter("post_member"); */	
 		List<CommentVO> commentList = commentDAO.selectComment();
	%>



<html>
	<head>
		<title>TXT by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="
		width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="homepage is-preload">
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
						<li><a class="log" href="login.jsp">로그인</a></li>
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
						<li class="current"><a href="index.jsp">홈</a></li>
						<li><a href="search.jsp">검색</a></li>
						<li><a href="kcalLeft.jsp">칼로리</a></li>
						<li><a href="rankRight.jsp">랭크</a></li>
						<li><a href="saveRight.jsp">저장됨</a></li>
						<li><a href="write.jsp">게시물 추가</a></li>					
						<!-- 게시물 추가 html생성 -->
					</ul>
				</nav>



			<!-- Banner -->
				<section id="banner">
					<div class="content">
						<c:choose>
		               <c:when test="${empty loginMember}"></c:when>
		               
						<c:otherwise><h2>${loginMember.id}님 환영합니다~</h2>
						
						</c:otherwise>
						</c:choose>
						<h3>운동과 건강관리를 위한 다양한 정보를 받아보세요</h3> 
						<br>
						<br>
						<a href="#main" class="button scrolly">피드를 구경하세요!</a>
					</div>
				</section>

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

							<div class="col-12">
								<section class="box features">
									<h2 class="major"><span>피드</span></h2>
									<div class="album py-5 bg-light">
											<div class="container">
										
<%-- 													<c:choose>
									               <c:when test="${empty loginMember}"></c:when>
									               
													<c:otherwise><p>작성자 : ${loginMember.id}</p>
													
													</c:otherwise>
													</c:choose>
 --%>													
											

    
												<!-- 반복문 출력 !!!! 제목, 내용, 아이디, 파일, 날짜, (좋아요) -->	
											  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
												<div class="col">
												  <div class="card shadow-sm" style="text-align : center;">
													
														
														<!-- 피드가 있을 경우에 출력  -->
														 <%-- <% if (postList != null && !postList.isEmpty()) { %> --%>  
														
														<!-- 피드 게시물 출력  -->
														<table border="1">
																								
														
														 <%for(PostVO post:postList){ %>
														<tr>
														<td>작성자 : <%=post.getUser_id() %>님</td>
														</tr>
														<tr>
														<td>< <%=post.getPost_title() %> ></td>
														</tr>
														<tr>
														<td><br></td>
														</tr>
														<tr>
														<td><%=post.getPost_file() %><td>
														</tr>
														<tr>
														<td><%=post.getPost_content() %></td>
														</tr>
														<tr>
														<td><br></td>
														</tr>
														<tr>
														<td><%=post.getCreated_at() %></td>
														</tr>
														<!-- 댓글출력 -->
														<% if (commentList != null && !commentList.isEmpty()) { %>
														 <%for(CommentVO comment:commentList){ 
														 if(comment.getPost_idx() == post.getPost_idx()){
															 
														 %>
														 
														 <tr>
														 	<td style="width: 422px; padding: 0 760px 0 0px;">ID:<%=comment.getUser_id() %></td>
                                            				 <td class="com5" style="width: 299px; text-align: left;">내용:<%=comment.getCmt_content() %></td>
														 </tr>
														 
														 <%
														 }//if끝
														 } //for끝%>
														 <%} //if끝%>
														
														<!-- 댓글 작성 -->
														<tr>
														<td>
														<form action="CommentCon?idx=<%=post.getPost_idx() %>" method="post">
														
														  <input name="cmt_content" type="text" size="85px"  placeholder="댓글을 작성해주세요" >
 														 <input class="comment-btn" type="submit" value="등록" onclick="alert('댓글 등록 완료!')" />
														<!--   <button class="comment-btn" type="submit" value="등록" onclick="alert('댓글 등록 완료!')" /> -->
 														</form>
														
														<!-- 좋아요 -->
														<form action="#" method="post">
														<button name="heart" type="button" class="heart-btn" onclick="alert('좋아요!')">
															<img width="30px" height="30px" src="images/heart.png"/>
														</button>
														
														</form>
														
														<!--저장 -->
														<form action="SaveCon" method="post">
														<input type="hidden" name="id" value="${loginMember.id}">
														<input type="hidden" name="idx" value="<%=post.getPost_idx() %>">
														<button class="save-btn" type="submit" value="저장" onclick="alert('저장 완료!')" >
															<img width="30px" height="30px" src="images/savebtn.png"/>
														</button>
														</form>
														
														</td>
														</tr>
 														
														<tr>
														<td><h2 class="major"></h2></td>
														<td id="line"><br></td>
														</tr>
													
														<% } %>
														
														</table>
														
														
														
<%-- 														<table border="1">
														
														<!-- 댓글 출력 -->
														
														<% if (commentList != null && !commentList.isEmpty()) { %>
														 <%for(CommentVO comment:commentList){ 
														 
														 %>
														 
														 <tr>
														 	<td>순번:<%=comment.getCmt_idx() %></td>
															<td>ID:<%=comment.getUser_id() %></td>
															<td>내용:<%=comment.getCmt_content() %></td>
														 </tr>
														 
														 <%} //for끝%>
														 <%} //if끝%>
														 </table> --%>
														 
														
														<%--  <%} %> --%>

<!-- 													<img width="1100px" height="500px" src="images/exercise1.jpg" alt="" /></a>
 -->
													<!-- <div class="card-body">
													  <p class="card-text">#오운완 #오늘의 운동법</p>
													  <div class="d-flex justify-content-between align-items-center heart-div">
														
														<h2 class="major"></h2>
														  <input type="text" size="85px"  placeholder="댓글을 작성해주세요" name="comment">
														  <button type="button" class="comment-btn" onclick="alert('댓글 등록 완료!')">등록</button>
														 
															<button name="heart" type="button" class="heart-btn" onclick="alert('좋아요!')">
																<img width="30px" height="30px" src="images/heart.png"/>
															  </button> -->
														  <!-- <button type="button" class="btn btn-sm btn-outline-secondary">좋아요</button> -->
														  <br>
														

													</div>
												</div>
											</div>
										</div>
									</section>
								
							</div>
						</div>
					</div>
				</section>

			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>What's this about?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Contact -->
									<section>
										<h2 class="major"><span>Get in touch</span></h2>
										<ul class="contact">
											<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

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
