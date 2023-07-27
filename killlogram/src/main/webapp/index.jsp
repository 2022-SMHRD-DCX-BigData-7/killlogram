
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<%
	// select.jsp참고해서
	// 게시글 불러오는 DAO 객체 새성
	// List<객체> = dao.selectAll();
	
	// List를 해당 위치에서 반복문으로 출력

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

								<!-- Highlight -->
									<!-- <section class="box highlight">
										<ul class="special">
											<li><a href="#" class="icon solid fa-search"><span class="label">검색/span></a></li>
											<li><a href="#" class="icon solid fa-tablet-alt"><span class="label">칼로리</span></a></li>
											<li><a href="#" class="icon solid fa-flask"><span class="label">Flask</span></a></li>
											<li><a href="#" class="icon solid fa-cog"><span class="label">Cog?</span></a></li>
										</ul>
										<header>
											<h2>A random assortment of icons in circles</h2>
											<p>And some text that attempts to explain their significance</p>
										</header>
										<p>
											Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus. Praesent semper mod quis eget mi. Etiam eu<br />
											ante risus. Aliquam erat volutpat. Aliquam luctus et mattis lectus amet pulvinar. Nam nec turpis consequat.
										</p>
									</section> -->

							</div>
<!-- 게시물 추가 버튼 -->
							<!-- <div class="upload">
								<li><a href="write.jsp">게시물 추가</a></li>

							</div> -->




							<div class="col-12">
								<section class="box features">
									<h2 class="major"><span>피드</span></h2>
									<div class="album py-5 bg-light">
											<div class="container">
										
													<c:choose>
									               <c:when test="${empty loginMember}"></c:when>
									               
													<c:otherwise><p>작성자 : ${loginMember.id}</p>
													
													</c:otherwise>
													</c:choose>
													
													
											  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
												<div class="col">
												  <div class="card shadow-sm" style="text-align : center;">
													<!-- <div style="text-align : center;"> -->
														
														
													<img width="1100px" height="500px" src="images/exercise1.jpg" alt="" /></a>

		
													
													<div class="card-body">
													  <p class="card-text">#오운완 #오늘의 운동법</p>
													  <div class="d-flex justify-content-between align-items-center heart-div">
														
														<h2 class="major"></h2>
														  <input type="text" size="85px"  value="댓글을 작성해주세요" name="comment">
														  <button type="button" class="comment-btn" onclick="alert('댓글 등록 완료!')">등록</button>
														 
															<button name="heart" type="button" class="heart-btn" onclick="alert('좋아요!')">
																<img width="30px" height="30px" src="images/heart.png"/>
															  </button>
														  <!-- <button type="button" class="btn btn-sm btn-outline-secondary">좋아요</button> -->
														  <br>
														
														<!-- <small class="text-muted">9 mins</small> -->
													  </div>
													</div>
												  </div>
												</div>
<!-- 
												<div class="col">
													<div class="card shadow-sm" style="text-align : center;">
													  <img width="1100px" height="500px" src="images/salad.jpg" alt="" /></a>
  
													  <div class="card-body">
														<p class="card-text">오늘은 샐러드를 먹었어요 ㅎㅎ</p>
														<div class="d-flex justify-content-between align-items-center">
														  <div class="btn-group">
															<button type="button" class="btn btn-sm btn-outline-secondary">좋아요</button>
															<button type="button" class="btn btn-sm btn-outline-secondary">댓글 남기기</button>
														  </div>
														  <small class="text-muted">9 mins</small>
														</div>
													  </div>
													</div>
												  </div> -->

												<!-- <div class="album py-5 bg-light">
													<div class="container">
												
													  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
														<div class="col">
														  <div class="card shadow-sm"> -->
															<!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" href="images/salad.jpg" role="img" aria-label="Placeholder: 게시물 사진추가" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
															<!-- <img width="400px" height="400px" src="images/운동.jpg" alt="" /></a>
		
															<div class="card-body">
															  <p class="card-text">#오운완 #오늘의 운동법</p>
															  <div class="d-flex justify-content-between align-items-center">
																<div class="btn-group">
																  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
																  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
																</div>
																<small class="text-muted">9 mins</small>
															  </div>
															</div>
														  </div> -->
														<!-- </div>  -->
														<!-- Features -->
									
										<!--부트스트랩  -->
										
								
										<!--  -->
										<!-- <div> -->
											<!-- <div class="row">
												<div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a> -->
															<!-- <h3><a href="#">A Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p> -->
														<!-- </section> -->

												<!-- </div> -->
												<!-- <div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
															<h3><a href="#">Another Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>

															
														</section>

												</div>/ -->
												<!-- <div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section> -->

														<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section> -->


												<!-- </div> -->
												<!-- <div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
															<h3><a href="#">And One More</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section> -->

												<!-- </div> -->
												<!-- <div class="col-12">
													<ul class="actions">
														<li><a href="#" class="button large">Do Something</a></li>
														<li><a href="#" class="button alt large">Think About It</a></li>
													</ul>
												</div> -->
											<!-- </div>
										</div> -->
									<!-- </section>

							</div>
							<div class="col-12"> -->

								<!-- Blog -->
									<!-- <section class="box blog">
										<h2 class="major"><span>운동 추천</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content"> -->

														<!-- Featured Post -->
															<!-- <article class="box post">
																<header>
																	
																	<h3><a href="#">다양한 운동을 추천드려요 ! 😊</a></h3>
																	<p>스트레칭 | 유산소 | 근력</p>
																	 -->
																	<!-- <ul class="meta">
																		<li class="icon fa-clock">15 minutes ago</li>
																		<li class="icon fa-comments"><a href="#">8</a></li>
																	</ul> -->
																<!-- </header>
																<a href="#" class="image featured"><img src="images/exercise.jpg" width="50%" /></a> -->
																<!-- <p>
																	Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in lectus. Praesent
																	semper mod quis eget mi. Etiam sed ante risus aliquam erat et volutpat. Praesent a
																	dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum lectus. Lorem ipsum
																	dolor sit non aliquet sed, tempor et dolor. Praesent a dapibus velit. Curabitur
																	accumsan.
																</p> -->
																
																<!-- 하단 버튼 -->
																<!-- <a href="#" class="button" id="exercise">유산소</a>
																<a href="#" class="button" id="exercise">근력 운동</a>
																<a href="#" class="button" id="exercise">타바타</a>
																<a href="#" class="button" id="exercise">스트레칭</a> -->
															<!-- </article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar"> -->

														<!-- Archives -->
															
														<!-- <a href="#" class="button alt" id="ex1">유산소</a>
														<p>   </p>
														<a href="#" class="button alt" id="ex2">근력운동</a>
														<p>   </p>
														<a href="#" class="button alt" id="ex3">타바타</a>
														<p>   </p>
														<a href="#" class="button alt" id="ex4">스트레칭</a>
															
														<p>   </p> -->

														
															<!-- <ul class="divided">
																<p></p>
																<p></p>
																

																<li>
																	<article class="box post-summary">
																		<h3><a href="#" class="button" id="exercise">유산소</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#" class="button" id="exercise">근력 운동</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#" class="button" id="exercise">타바타</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#" class="button" id="exercise">스트레칭</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And One More</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul> -->
															

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