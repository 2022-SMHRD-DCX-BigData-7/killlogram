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
		<title>write</title>
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

			<!-- Nav -->
			<nav id="nav1">
				<ul>
					<li><a href="chat.jsp">채팅</a></li>
					<li><a class="myp" href="mypage.jsp">마이페이지</a></li>
					<li><a class="log" href="login.jsp">로그인</a></li>
				</ul>
			</nav>

			<nav id="nav">
				<ul>
					<li><a href="index.jsp">홈</a></li>
					<li><a href="search.jsp">검색</a></li>
					<li><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li class="current"><a href="write.jsp">게시물 추가</a></li>					
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


									<section id="contact" class="four">
										<div class="container">
									
											<header>
												<h2>게시물 추가</h2>
												<p> 사진과 동영상을 첨부하세요 </p>
											</header>
									
									
											<form method="post" action="#">
												<div class="row">
													<!-- <div class="col-6 col-12-mobile"><input type="text" name="name" placeholder="Name" /></div> -->
		
													
													<div class="col-12">
														<input type="submit" value="컴퓨터에서 선택" />
													</div>
													<!-- <div class="col-6 col-12-mobile"><input type="text" name="email" placeholder="email" /></div> -->
													<div class="col-12">
<!-- 														
															<input type="radio" id="option1" name="유산소" value="1">										
															<input type="radio" id="option2" name="스트레칭" value="2">
															<input type="radio" id="option3" name="근력운동" value="3"> -->
														  
														<p>주제선택<input type="radio" checked></p>
														제목 <input type="text" placeholder="제목을 입력해주세요" />

														<textarea name="message" placeholder="내용을 입력하세요"></textarea>
													</div>
													<div class="col-12">
														<input type="submit" value="게시물 등록" />
													</div>
												</div>
											</form>
									
										</div>
									</section>
								

								<!-- Contact -->
									<section>
										<h2 class="major"><span>URL 공유</span></h2>
										<ul class="contact" align="center">
											<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
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
</html>