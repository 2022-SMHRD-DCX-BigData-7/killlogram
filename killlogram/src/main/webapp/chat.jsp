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

        <!-- Nav -->
        <nav id="nav1">
            <ul>
                <li class="current"><a href="chat.jsp">채팅</a></li>
                <li><a class="myp" href="mypage.jsp">마이페이지</a></li>
                <li><a class="log" href="login.jsp">로그인</a></li>
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
                                    <h2>채팅</h2>
                                </header>
                                <div class="col-12">
                                    <ul class="actions">
                                        <li><a href="chat.jsp" class="button large">개인채팅</a></li>
                                        <li><a href="group.jsp" class="button alt large">오픈채팅</a></li>
                                    </ul>
                                </div>
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