<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>


<!DOCTYPE HTML>

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
									
											<form method="post" action="PostCon" enctype="multipart/form-data">
											<input type="hidden" name="id" value="${loginMember.id }">
												<div class="row">
													<div class="fileBox previewImage">
													  <input name="post_file" class="uploadFileName" value="파일선택" disabled="disabled" style="width: 300px;">
													  <label for="file1">업로드</label> 
													  <input type="file" id="file1" class="inputHidden"> 
													</div>
													
													<div class="col-12">
													  
														제목 <input type="text" name="post_title" placeholder="제목을 입력해주세요" />

														<textarea name="post_content" placeholder="내용을 입력하세요"></textarea>
													</div>
													<div class="col-12">
														<input class="post_up" href="index.jsp" type="submit" value="게시물 등록" />
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

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/post_file.js"></script>

	</body>
</html>