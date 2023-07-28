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
        </div>
      </div>
    </header>


		<nav id="nav1">
				<ul>
						
				 <%-- 로그인 정보가 없으면 로그인 할 수 있도록 --%>
				 <c:choose>
			 	<c:when test="${loginMember}">
			 	</c:when>
			 	
			 	<c:otherwise>
			 		
			 		<%--<li><a href="chat.jsp">채팅</a></li>
					<li><a class="log" href="LogoutCon">로그아웃</a></li>
					<li><a class="myp" href="mypage.jsp">마이페이지</a></li>   --%>
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

               <!-- Content -->

               <article class="box page-content">

                <header>
                  <h2>로그인</h2>
                 
                </header>

				<form action="loginCon" method="post">
                <table>
                    
                  <tr>
                    <td>ID</td>
                    <td><input class="text_login" type = "text" name="id" placeholder="아이디를 입력해주세요."></td>
                  </tr>
                  <tr>
                    <td>PASSWORD</td>
                    <td><input class="text_pw" type = "password" name="password" placeholder="비밀번호를 입력해주세요."></td>
                  </tr>
   
                  </table>

                 <br>

                 <span class="register">Killlogram에 처음이라면?
                <a href="register.jsp">
                   <span>계정을 생성하세요</span>
                 </a>
                </span>
                
                  <div class="col-12">
                    <ul class="actions">
                      <li><p><input type="submit" value="로그인"></p></li>
                    </ul>
                  </div>
                </div> 
                </form>
                
              </div>
            </section>

          </div>
        </div>
      </div>
    </section>
     
    


  
  </div>
    <!-- <form id="login" class="mb-3" action="index.jsp" method="POST">
        <div class="mb-3">
          <label for="email" class="form-label">Email을 입력하세요: </label>
          <input
            type="text"
            class="form-control"
            id="email"
            name="email"
            placeholder="Email을 입력하세요"
            autofocus
          />
        </div>

        <div class="password">
          <div class="d-flex justify-content-between">
            <label class="form-label" for="password">Password를 입력하세요: </label>
            <input
            type="password"
            id="password"
            class="form-control"
            name="password"
            placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
            aria-describedby="password"
          />
          </div>
           <div class="input-group input-group-merge">
            <input
              type="password"
              id="password"
              class="form-control"
              name="password"
              placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
              aria-describedby="password"
            />
            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
          </div> -->
          <!-- <div>
            <a href="forgetpassword.jsp">
                <small>Forgot Password?</small>
              </a>
          </div>
        </div> -->


        <!-- <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="remember-me" />
            <label class="form-check-label" for="remember-me"> Remember Me </label>
          </div>
        </div> -->

<!-- 
        <div class="mb-3">
          <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
        </div>
      </form>

      <p class="text-center">
        <span>Killogram에 처음이라면?</span>
        <a href="register.jsp">
          <span>계정을 생성하세요</span>
        </a>
      </p> 
   -->
  <!-- /Register -->

</body>
</html>