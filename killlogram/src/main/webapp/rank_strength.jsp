<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<%
    // 세션에서 loginMember 가져오기
    KilllogramVO loginMember = (KilllogramVO) session.getAttribute("loginMember");
%>
<html>
	<head>
		<title>Right Sidebar(rank)</title>
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
					<li class="current"><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

			<!-- Main -->
            <section id="main">
				<div class="container">
				   <div class="row">
					  <div class="col-9 col-12-medium">
						 <div class="content">
 
							<!-- Content -->
 
							   <article class="box page-content">
 
								  <header>
									 <h2>Rank</h2>
									
									 <p>인기 게시물 순위</p>
									 <h2 class="major"><span>근력 Top 10</span></h2>

									<br>
									 
									 <section>
										<h4>1.</h4>
										<span href="#">제목 불러오기</span>
										<!--게시물 제목 (10개)-->
										<ul class="meta">
										   <li class="icon fa-clock">5 days ago</li>
										   <li class="icon fa-comments"><a href="#">1,024</a></li>
										</ul>
									 </section>
									 
								  </header>
								  <section>
									 <h4>2.</h4>
									 <span href="#">제목 불러오기</span>
									 <!--게시물 제목 (10개)-->
									 <ul class="meta">
										<li class="icon fa-clock">5 days ago</li>
										<li class="icon fa-comments"><a href="#">1,024</a></li>
									 </ul>
								  </section>
								  <section>
									<h4>3.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>4.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>5.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>6.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>7.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>8.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>9.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								 <section>
									<h4>10.</h4>
									<span href="#">제목 불러오기</span>
									<!--게시물 제목 (10개)-->
									<ul class="meta">
									   <li class="icon fa-clock">5 days ago</li>
									   <li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								 </section>
								  
 
							   </article>
 
						 </div>
					  </div>
					  <div class="col-3 col-12-medium">
						 <div class="sidebar">
 
							<!-- Sidebar -->
 
							   <!-- Recent Posts -->
								  <section>
									 <h2 class="major"><span>운동 선택</span></h2>
									 <ul class="divided">
										<li>
										   <label for="topic-select">운동 주제 :</label>
										   <select id="topic-select" onchange="location.href=(this.value);">
											<!-- <option style="padding-left: 160px;">카테고리</option> -->
											<option class="muscle" value="rank_strength.jsp">근력</option>
											<option class="cardio" value="rankRight.jsp">유산소</option>
											
										</li>
									 </ul>
									 <a href="#" class="button alt">Arcives</a>
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