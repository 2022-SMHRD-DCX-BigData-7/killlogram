<%@page import="com.smhrd.domain.KilllogramVO"%>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<%
    // 세션에서 loginMember 가져오기
    KilllogramVO loginMember = (KilllogramVO) session.getAttribute("loginMember");
%>
<html lang="en">
	<head>
		<title>Mypage</title>
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


 <!-- 사용자에게 데이터를 넘길 공간 -->
    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="content">

                <article class="box page-content">

                    <header>
                      <h2>회원가입</h2>
                     
                    </header>
  
  					<form action = "RegisterCon" method="post">
  
                    <table>
                    
                    <tr>
                      <td>ID</td>
                      <td><input class="text_login" type = "text" name="id" placeholder="아이디를 입력해주세요."></td>
                    </tr>
                    <tr>
                      <td>PASSWORD</td>
                      <td><input class="text_pw" type = "password" name="password" placeholder="비밀번호를 입력해주세요."></td>
                    </tr>
                    <tr>
                      <td>NAME</td>
                      <td><input class="text_name" type = "text" name="name" placeholder="이름을 입력해주세요"></td>
                    </tr>
                    <tr>
                      <td>NICK</td>
                      <td><input class="text_nick" type = "text" name="nick" placeholder="닉네임을 입력해주세요."></td>
                    </tr>
     
                    </table>

					

                    <p margin="right"><input type="submit" value="회원가입"></p>
                    </form>

          </div>
        </div>
      </div>
    </section>
     
    


  
  </div>
  

</body>
</html>