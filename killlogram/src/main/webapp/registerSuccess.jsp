<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
        <li><a href="kcal(left).jsp">칼로리</a></li>
        <li><a href="rank(right).jsp">랭크</a></li>
        <li><a href="save(right).jsp">저장됨</a></li>
        <li><a href="write.jsp">게시물 추가</a></li>					
        <!-- 게시물 추가 html생성 -->
      </ul>
    </nav>


    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="content">

                <article class="box page-content">

                    <header>
                      <h2>회원가입 완료 페이지</h2>
                     
                    </header>

				<h3>회원가입 완료하셨습니다~~~</h3>

                   
			</div>
          </div>
        </div>
      </div>
    </section>

</body>
</html>