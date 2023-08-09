<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<%
    // 세션에서 loginMember 가져오기
    KilllogramVO loginMember = (KilllogramVO) session.getAttribute("loginMember");
%>
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
				                                                          <td>작성자 : ${post.user_id }</td>
				                                                      </tr>
				                                                      <tr>
				                                                          <td>제목 : ${post.post_title }</td>
				                                                      </tr>
				                                                      <tr>
				                                                          <td>내용 : ${post.post_content }</td>
				                                                      </tr>
				                                                     
				                                                      <tr>
				                                                          <td>작성 날짜 : ${post.created_at.substring(0,16)}</td>
				                                                      </tr>
																			

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