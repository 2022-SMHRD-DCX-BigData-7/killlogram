<%@page import="com.smhrd.domain.Nutritonfacts"%>
<%@page import="com.smhrd.domain.NutritonfactsDAO"%>
<%@page import="com.smhrd.domain.MemberDAO"%>
<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE HTML>
<%
// NutritonfactsDAO를 사용하여 데이터베이스에서 영양 정보를 조회
NutritonfactsDAO nutritionDAO = new NutritonfactsDAO();
String foodName = request.getParameter("food_name"); // 사용자가 입력한 음식 이름을 받아옴
List<Nutritonfacts> nutriList = nutritionDAO.selectNutri(foodName);
%>
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

                            <p class="kcal">칼로리 검색</p>
                            <div class="line"></div>
                            
                            
    <div class="mid_wrapper">
        <form class="aaa" action="kcalLeft.jsp">
    <table>
    <tr>
    	<td width=60%><input type="text" class="search_kcal" autocomplete="off" name="food_name"></td>
    	<td><input type="submit" class="btn_kcal" value="검색"></td>
    </tr>
             <!-- 사용자 입력 값 음식 이름 받기 -->
            
        </table>
        </form>
    </div>


<form action="">

<div class="nutritonfacts_info">
	
		<%-- 음식 정보가 있을 경우에만 출력 --%>
		<% if (nutriList != null && !nutriList.isEmpty()) { %>
		    <%-- nutriList에서 음식 정보 가져와서 출력 --%>
		    <table border="1">
		    	
		    	<tr>
		    			<td>선택</td>
		    			<td>제품명</td>
					    <td>칼로리</td>
					    <td>단백질</td>
					    <td>탄수화물</td>
					    <td>지방</td>
					    <td>1회 섭취량</td>
					    <td>단위</td>
		    	</tr>
		    	<% for (Nutritonfacts nutri : nutriList) { %>
					  <tr>
					    <td><input type="checkbox" class="input-check" name="selectedFood" value="<%= nutri.getFood_name() %>"></td>
					    <td><%= nutri.getFood_name() %></td>
					    <td><%= nutri.getCalories() %></td>
					    <td><%= nutri.getProtein() %></td>
					    <td><%= nutri.getCarbohydrate() %></td>
					    <td><%= nutri.getFat() %></td>
					    <td><%= nutri.getIntake() %></td>
					    <td><%= nutri.getUnit() %></td>
					  </tr>
		    	<% } %>
		    </table>
		<% } %>
	
		<%-- 음식 정보가 없을 경우 --%>
		<% if (nutriList == null || nutriList.isEmpty()) { %>
		    <p>음식 이름이 없습니다</p>
		<% } %>
	

</div>
  							<input type="submit" class="res1" value="등록">
                            <input type="submit" class="del" value="삭제">
</form>


<span class="day">하루 총 섭취량</span>
<h4 class="total">총 열량 :</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>