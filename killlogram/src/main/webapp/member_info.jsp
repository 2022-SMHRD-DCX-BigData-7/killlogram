<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>회원 정보 수정</title>
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
				<li><a href="saveRight.jsp">저장됨</a></li>
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
						
						<section id="contact" class="four">
										<div class="container">
											
											<header>
												<h2>회원 정보 수정</h2>
											</header>
						<br>
					
						
						<form action="UpdateCon">
						
						<h1>접속한 ID : ${loginMember.id}</h1>
						<label for="username">닉네임
						<br><input type="text"  name="nick" id="nick" placeholder="닉네임을 입력하세요" required></label><br>
						  
						 <label for="password">비밀번호
						 <br><input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" required><br>
						 
						  <input type="submit" value="수정하기" class="button">
						</form>
					  
								</div>
							</div>
						</section>

				</div>
			</div>
		</div>
	</section>



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
</body>
</html>