<%@page import="com.smhrd.domain.LikeDAO"%>
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
 		
		// 이미지 파일 이름을 DB에서 가져오는 로직
		PostVO image = null;

	// 댓글 dao써서 list담아주는거
	
	   CommentDAO commentDAO = new CommentDAO();
/*     PostVO postMember = (String)request.getParameter("post_member"); */	
 		List<CommentVO> commentList = commentDAO.selectComment();

 		LikeDAO likeDAO = new LikeDAO();

 		String originName = (String)session.getAttribute("originName");
 	
 		
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
												<div class="col" style="margin: 0 0 0 -113px">
												  <div class="card shadow-sm" style="text-align : center;">
													
														
														<!-- 피드가 있을 경우에 출력  -->
														 <%-- <% if (postList != null && !postList.isEmpty()) { %> --%>  
														
														<!-- 피드 게시물 출력  -->
														<table border="1">
																								
														
														 <%for(PostVO post:postList){ %>
														<tr>
														<td style="font-size: 36px">작성자 : <%=post.getUser_id() %>님</td>
														</tr>
														<tr>
														<td style="font-size: 24px; padding-top: 14px;"> < <%=post.getPost_title() %> > </td>
														</tr>
														<tr>
														<td><br></td>
														</tr>
														
														<tr>
														<td>
														<%-- <% if (imageList != null && !imageList.isEmpty()) { %> --%>
														<% 
															image = postDAO.selectImage(post.getPost_idx());
															if (image!=null && image.getPost_file() != null){ 
																if (post.getPost_idx() == image.getPost_idx()){
																	String fName = image.getPost_file().split("\\\\")[image.getPost_file().split("\\\\").length-1];
																	out.print("<img src='upload/"+fName+"' alt='설정 후 이미지' style='width: 500px; height: 500px;'/>");
																}//if1
																}//if2
															else{
																out.print("파일이 존재하지 않습니다.");
															}
															
															%>
														
<%-- 														      <img src="<%= request.getContextPath() %>/upload/<%=image.getPost_file() %>" alt="<%= image.getPost_file() %>" />
														      <img src="Killlogram/upload/<%=image%>" alt="설정 후 이미지" /> --%>

														<%-- <% } %>  --%>
														</td>
														</tr>
														
														<tr>
														<td><br></td>
														</tr>
														<%-- <tr>
														<td><%=post.getPost_file() %><td>
														</tr> --%>
														<tr>
														<td style="font-size: 22px;"><%=post.getPost_content() %></td>
														</tr>
														<tr>
														<td><br></td>
														</tr>
														<tr>
														<td ><%=post.getCreated_at().substring(0,16) %></td>
														</tr>
														<tr>
														<td><br></td>
														</tr>
														<tr>
														<td><h2 class="major"></h2></td>
														<td id="line"></td>
														</tr>
														
														 <tr>
														<td><br></td>
														</tr>
														
				                                        
				                                           <!-- 댓글출력 -->
                                          <% if (commentList != null && !commentList.isEmpty()) { %>
                                           <%for(CommentVO comment:commentList){ 
                                           if(comment.getPost_idx() == post.getPost_idx()){
                                              
                                           %>
                                           
                                           <tr>
                                              <td style="font-size:20px; padding: 0 1220px 0 0px; text-align:left" >ID:<%=comment.getUser_id() %></td>
                                                         <td class="com5" style="width: 299px; text-align: left; font-size: 20px;">내용:<%=comment.getCmt_content() %></td>
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
														
														  <!-- 좋아요 수를 표시할 부분 -->
				                                        <span class=lc style="font-size: 24px;" id="likeCount_<%= post.getPost_idx() %>"><%= likeDAO.getLikeCountByPostIdx(post.getPost_idx()) %></span>
				                                           <!-- 좋아요 버튼 -->
				                                           <button id="likeButton_<%= post.getPost_idx() %>" name="heart" type="button" class="heart-btn"  onclick="likePost(<%= post.getPost_idx() %>), onclick= alert('좋아요♥') ">
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


		<script>
             // 좋아요 클릭 시 처리하는 함수
             function likePost(postIdx) {
                 $.ajax({
                     type: "POST",
                     url: "LikeCon",
                     data: {
                         post_idx: postIdx,
                         user_id: "${loginMember.id}"
                     },
                     success: function (data) {
                         // 서버에서 받아온 좋아요 수를 화면에 반영
                         $("#likeCount_" + postIdx).text(data.likeCount);
                         // 좋아요 버튼을 클릭한 경우 비활성화
                         $("#likeButton_" + postIdx).prop("disabled", true);
                     },
                     error: function (xhr, status, error) {
                         console.error("Error while liking post:", error);
                     }
                 });
             }
         </script>
	</body>
