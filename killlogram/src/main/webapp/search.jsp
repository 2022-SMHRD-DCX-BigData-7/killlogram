<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li class="current"><a href="search.jsp">검색</a></li>
					<li><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

                <section>
                    <form action="SearchCon" method="get"> 
                        <div class="search">
							
                            <!-- <input type="text" name="query" value="" placeholder="검색하세요"> -->
							<!-- <button type="submit">검색</button> -->
							<!-- <td><input type="submit" value="검색"></td> -->

							<input class="query" type="text" name="keyword" placeholder="검색하세요" />
							<button type="submit">검색</button>
								
                        </div>
                    </form>
                </section>
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
													
														
														<%-- 피드가 있을 경우에 출력  --%>
														<c:if test="${not empty postList}">
														    <table border="1">
														    <c:forEach items="${postList}" var="post" >
														            <tr>
														                <td>ID : ${post.user_id }</td>
														            </tr>
														            <tr>
														                <td>Title : ${post.post_title }</td>
														            </tr>
														            <tr>
														                <td>Content : ${post.post_content }</td>
														            </tr>
														            <tr>
														                <td>File : ${post.post_file }</td>
														            </tr>
														            <tr>
														                <td>Date : ${post.created_at}</td>
														            </tr>
														            <form action="CommentCon" method="post">
														                <tr>
														                    <td>
														                        <input type="text" size="85px" placeholder="댓글을 작성해주세요" name="cmt_content">
														                        <button type="button" class="comment-btn" onclick="alert('댓글 등록 완료!')">등록</button>
														                    </td>
														                </tr>
														            </form>
														            <form action="#" method="post">
														                <button name="heart" type="button" class="heart-btn" onclick="alert('좋아요!')">
														                    <img width="30px" height="30px" src="images/heart.png"/>
														                </button>
														            </form>
														            <tr>
														                <td><h2 class="major"></h2></td>
														            </tr>
														            <tr>
														                <td id="line"><br></td>
														            </tr>
														        </c:forEach>
														    </table>
														</c:if>
													</div>
										</div>
									</div>
								</section>
							
						</div>
					</div>
				</div>
			</section>
														

    		
</body>
</html>