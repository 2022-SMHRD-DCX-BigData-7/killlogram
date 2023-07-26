<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Left Sidebar(kcal)</title>
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
					<li class="current"><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

				
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-3 col-12-medium">
								<div class="sidebar">

									<!-- Sidebar -->
								</div>
							</div>
							<div class="col-9 col-12-medium imp-medium">
    <div class="content">
		<button type="button" onclick="location.href='kcalLeft.jsp'" class="button1">식단 칼로리</button> 
		<button type="button" onclick="location.href='kcalHweek.jsp'" class="button1">운동 칼로리</button> 
        <button type="button" onclick="location.href='kcalLeft.jsp'"  class="btn3">일</button>
        <button type="button" onclick="location.href='kcalWeek.jsp'"  class="btn4">주</button>
        <button type="button" onclick="location.href='kcalMonth.jsp'"  class="btn5">월</button>

        <span class="kcal">월간 칼로리</span>
        <div class="line"></div>
        <div class="search_wrapper">
            <div class="mid_wrapper">
              <br>
            </div>
        </div>
        <span class="day">월간 총 섭취량</span>
        <h4 class="total">총 열량 :</h4>
        <input type="submit" class="res1" value="등록">
        <input type="submit" class="del" value="삭제">
    </div>
</div>

								
								<!-- Features
									<section class="box features">
										<h2 class="major"><span></span></h2>
										<div>
											<div class="row">
												<div class="col-3 col-6-medium col-12-small">

													
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
															<h3><a href="#">A Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>
												</div> -->
												<!-- Feature -->
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

												</div> -->
												<!-- <div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div> -->
												<!-- <div class="col-3 col-6-medium col-12-small"> -->

													<!-- Feature -->
														<!-- <section class="box feature">
															<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
															<h3><a href="#">And One More</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div> -->
												<!-- <div class="col-12">
													<ul class="actions">
														<li><a href="#" class="button large">Do Something</a></li>
														<li><a href="#" class="button alt large">Think About It</a></li>
													</ul>
												</div>
											</div>
										</div>
									</section>

							</div>
						</div>
					</div>
				</section> -->

			<!-- Footer -->
				<!-- <footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12"> -->

								<!-- About -->
									<!-- <section>
										<h2 class="major"><span>What's this about?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div> -->
							<!-- <div class="col-12"> -->

								<!-- Contact -->
									<!-- <section>
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
						</div> -->

						<!-- Copyright -->
							<!-- <div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

		</div> -->

		<!-- Scripts -->
			<!-- <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> -->

	</body>
</html>