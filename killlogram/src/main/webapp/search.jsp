<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<title>TXT by HTML5 UP</title>
	
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
					<li class="current"><a href="search.jsp">검색</a></li>
					<li><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

                <section>
                    <form action="https://search.naver.com/search.naver"> 
                        <div class="search">
							
                            <!-- <input type="text" name="query" value="" placeholder="검색하세요"> -->
							<!-- <button type="submit">검색</button> -->
							<!-- <td><input type="submit" value="검색"></td> -->

							<input class="query" type="text" placeholder="검색하세요" />
							<button type="submit">검색</button>
								
                        </div>
                    </form>
                </section>
    
</body>
</html>