<%@page import="com.smhrd.domain.ChatRoomVO"%>
<%@page import="com.smhrd.domain.ChattingDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%
	// 세션에서 loginMember 가져오기
	KilllogramVO loginMember = (KilllogramVO) session.getAttribute("loginMember");
	
	ChattingDAO dao = new ChattingDAO();
	List<KilllogramVO> memberList = dao.allMember();
%>
<html>
<head>
    <title>TXT by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="page-wrapper">
        <!-- ... (Header and navigation code) ... -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="content">
                            <!-- ... (Header content) ... -->
                            <div class="chat_wrap">
                                <article class="box page-content"></article>
                                <header>
                                    <h2>개인채팅</h2>
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
                                        <li><a href="search.jsp">검색</a></li>
                                        <li><a href="kcalLeft.jsp">칼로리</a></li>
                                        <li><a href="rankRight.jsp">랭크</a></li>
                                        <li><a href="saveRight.jsp">저장됨</a></li>
                                        <li><a href="write.jsp">게시물 추가</a></li>
                                    </ul>
                                </nav>
                                <div class="row">
                                    <div class="col-12">
										<% 
										    if (memberList != null) {
										        for (KilllogramVO member : memberList) {
										%>
										        <tr>
										            <td>
										            	<% ChatRoomVO crvo = new ChatRoomVO(); %>
														<button type="button" onclick="startChat('<%= member.getId() %>', <%= crvo.getCr_limit() %>)" name="<%= member.getId() %>">
														    <%= member.getId() %>님
														</button>
										            </td>
										        </tr>
										<%
										        }
										    } else {
										        out.println("사용자 리스트를 가져오는 중에 문제가 발생했습니다.");
										    }
										%>
                                    </div>
                                </div>
                                <div id="chatContent">
                                    <!-- 메시지 출력 창 -->
                                </div>
                                <input placeholder="메시지를 입력하세요." name="message" id="myChat" type="text" onkeydown="messageEnter(event)">
                                <button type="button" onclick="sendChat('<%= loginMember.getId() %>')">전송</button>
										
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
  <script type="text/javascript">
  // 엔터키 이벤트 처리 함수
	function messageEnter(event) {
	    if (event.keyCode === 13) { // 엔터키(키 코드 13)를 눌렀을 때
	        event.preventDefault(); // 폼 제출 방지
	        sendChat(); // 검색 실행
	    }
	}
  
  function startChat(memberId, cr_limit) {
	    $.ajax({
	        url: "StartChatRoomServlet",
	        type: 'POST',
	        data: { "user_id": memberId, "cr_limit": cr_limit },
	        dataType: "json"
	    })
	    .then(data => {
	        if (data.success) {
	            console.log("채팅방 생성 성공");
	            $("#chatContent").append("<p>" + memberId + "님을 초대하였습니다</p>");
	            sendChat(loginMember); // 채팅방이 생성되면 바로 메시지 전송 함수 호출
	        } else {
	            console.error("채팅방 생성 실패");
	        }
	    });
	}

	function sendChat() {
		let userId = "${loginMember.id}";
	    let message = $("#myChat").val();

	    $.ajax({
	        url: "SendChatServlet",
	        type: 'POST',
	        data: { 
	            "user_id": userId,
	            "talk": message 
	        },
	        dataType: "json"
	    })
	    .then(data => {
	        if (data.success) {
	            console.log("메시지 전송 성공");
            	$("#chatContent").append("<p>나 : " + message + "</p>");
            	$("#chatContent").append("<p>상대 : 안녕하세요 </p>");
            	
            	$("#myChat").val("");
	        } else {
	            console.error("메시지 전송 실패");
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	    });
	}
</script>

</body>
</html>
