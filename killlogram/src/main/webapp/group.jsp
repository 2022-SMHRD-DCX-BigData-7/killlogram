<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>TXT by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
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
                <li><a href="kcal.jsp">칼로리</a></li>
                <li><a href="rankRight.jsp">랭크</a></li>
                <li><a href="saveRight.jsp">저장됨</a></li>
                <li><a href="write.jsp">게시물 추가</a></li>
            </ul>
        </nav>

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="content">
                            <!-- Content -->
                            <div class="chat_wrap">
                                <article class="box page-content"></article>
                                <header>
                                    <h2>그룹채팅</h2>
                                </header>
                                    <ul class="actions">
                                        <li><a href="chat.jsp" class="button large">개인채팅</a></li>
                                        <li><a href="group.jsp" class="button alt large">오픈채팅</a></li>
                                    </ul>
                               
                                
                                <form method="post" action="ChatRoomCon" >
											<input type="hidden" name="id" value="${loginMember.id }">
												<div class="row">
													
													<div class="col-12">
													  
<!-- 													  .group_name{margin: -20em;}
 -->														방 제목 <input type="text" name="group_title" class="group_name" placeholder="방 제목을 입력해주세요" />
															<input class="group_up" href="group.jsp" type="submit" value="그룹 채팅 생성" />
													</div>
												</div>
											</form>
											
											
                                <div id="chatContent">
                                    <!-- Chat messages will be displayed here -->
                                </div>
                                <input placeholder="메시지를 입력하세요." name="message" id="myChat" type="text">
                                <input type="submit" id="send" value="전송">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        let socket = new WebSocket("ws://localhost:8082/websocket");

        socket.onopen = function (e) {
            console.log('WebSocket connected!');
        };

        socket.onerror = function (e) {
            console.error('WebSocket error:', e);
        };

        socket.onmessage = function (e) {
            console.log(e.data);
            let msgContent = document.getElementById('chatContent');
            let newMsgLine = document.createElement('div');
            newMsgLine.classList.add('msgLine');
            let newMsgBox = document.createElement('div');
            newMsgBox.classList.add('msgBox');
            newMsgBox.textContent = e.data;
            newMsgLine.appendChild(newMsgBox);
            msgContent.appendChild(newMsgLine);
            // Scroll to bottom
            msgContent.scrollTop = msgContent.scrollHeight;
        };

        document.getElementById('myChat').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                sendMsg();
            }
        });

        document.getElementById('send').addEventListener('click', function () {
            sendMsg();
        });

        function sendMsg() {
            let content = document.getElementById('myChat').value;
            if (content.trim() !== '') {
                socket.send(content);
                document.getElementById('myChat').value = '';
            }
        }
    </script>
</body>
</html>