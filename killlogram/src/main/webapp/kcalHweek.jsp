<%@page import="com.smhrd.domain.KilllogramVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%
    // 세션에서 loginMember 가져오기
    KilllogramVO loginMember = (KilllogramVO) session.getAttribute("loginMember");
%>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
	
		<title>Left Sidebar(kcal)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<!-- chart.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
	
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
		                <p>로그인된 사용자의 아이디: ${loginMember.id}</p>
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
					<li class="current"><a href="kcalLeft.jsp">칼로리</a></li>
					<li><a href="rankRight.jsp">랭크</a></li>
					<li><a href="saveRight.jsp">저장됨</a></li>
					<li><a href="write.jsp">게시물 추가</a></li>					
					<!-- 게시물 추가 html생성 -->
				</ul>
			</nav>

				
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-3 col-12-medium">
                                <p class="weight1"> 몸무게 :</p>
                                <input type="text"  class="hweight" placeholder="내용을 입력해주세요" 
                                onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요'" name="weight">
                                <p class="time">시간(분) :</p>
                                <input type="text"  class="htime" placeholder="내용을 입력해주세요" 
                                onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요'" name="time1">
								<p class="exer">종류 :</p>
                                <select name="exerciseStr" style="width: 120px;" class="exercise">
                                    <option value="lowWeight">경/중등도 웨이트</option>
                                    <option value="highWeight">고강도 웨이트</option>
                                    <option value="fastwalk">속보</option>
									<option value="jogging">조깅</option>
									<option value="running">달리기</option>
									<option value="mountain">등산</option>
                                    <option value="dance">댄스</option>
                                    <option value="swim">수영</option>                      
                                    <option value="cycle">사이클</option>
                                    <option value="volleyball">배구</option>  
                                    <option value="badminton">배드민턴</option>
                                    <option value="tennis">테니스</option>
                                    <option value="baseball">야구</option>
                                    <option value="basketball">농구</option>
                                    <option value="soccer">축구</option>                                                                                              
                                </select>
                     <!-- 주간 -->
                     <div id="weeklyExCaloriesInfo">
                     	<table id="weekExtb">                   	
                     	</table>
                     </div>
                     <!-- 월간 -->
                     <div id="monthlyExCaloriesInfo">
                        <table id="montExhtb">                   	
                     	</table>
                     </div>
							</div>
							<div class="col-9 col-12-medium imp-medium">
								<div class="content">
									<button type="button" onclick="location.href='kcalLeft.jsp'" class="button1">식단 칼로리</button> 
									<button type="button" onclick="location.href='kcalHweek.jsp'" class="button1">운동 칼로리</button> 
									<button type="button" onclick="WeekHkcal('${loginMember.id}')"   class="btn4">주</button>
                      			    <button type="button" onclick="MonthHkcal('${loginMember.id}')"  class="btn5">월</button>
                                   
									<span class="kcal"></span>
									<div class="search_wrapper">
										<div class="mid_wrapper">
										
										</div>
									</div>
									<span class="day"></span>
									<canvas id="exerciseChart" width="400" height="200"></canvas>
									<button onclick="getExerciseInfo()" id="check">조회</button>
									<h2 class="total">총 열량 :<span id="totalCalories">0</span> kcal</h2>
									<button onclick="submitData()" class="kcaksend">등록</button>
                        			<button type="button" id="deleteActive" onclick="deleteExercise()">삭제</button>
                        			<!-- 주간 삭제 버튼 -->
									<button type="button" id="deleteWeekActive" onclick="deleteWeekExercise()" style="display: none;">주간삭제</button>
									<!-- 월간 삭제 버튼 -->
									<button type="button" id="deleteMonthActive" onclick="deleteMonthExercise()" style="display: none;">월간삭제</button>
								</div>
							</div>
							

<script type="text/javascript">
let weekExerciseChart;
let monthExerciseChart;
let exerciseChart;

function submitData() {
    let userId = "${loginMember.id}";
    let inputWeight = parseFloat($("input[name=weight]").val());
    let inputTime = parseInt($("input[name=time1]").val());
    let selectExercise = $("select[name=exerciseStr]").val();
    if (selectExercise === null || selectExercise === "") {
    	selectExercise = null;
    }

    // AJAX 요청 및 처리 로직
    $.ajax({
        url: "SaveExercise",
        type: "post",
        data: {
            "user_id": userId,
            "user_weight": inputWeight,
            "exercise_time": inputTime,
            "exercise_strength": selectExercise,
        },
        dataType: "json",
        success: function (response) {
            alert("입력 성공");           
        },
        error: function () {
            alert("입력 실패");
        }
    });
}

//운동 칼로리 정보를 가져오는 함수
function getExerciseInfo() {
    let userId = "${loginMember.id}";

    // AJAX 요청 및 처리 로직
    $.ajax({
        url: "GetExerciseInfo",
        type: "post",
        data: {
            "user_id": userId,
        },
        dataType: "json",
        success: function (response) {
            // 서버로부터 받은 운동 칼로리 정보를 화면에 출력
            if (response.length > 0) {
            	let totalCalories = 0;
                // JSON 배열의 각 요소에 대해 반복하여 운동 칼로리 정보를 가져와 출력
                $.each(response, function (idx, item) {                   
                	totalCalories += parseInt(item.calories_waste);                	
                });
                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }          
        },
        error: function () {
            alert("운동 칼로리 정보를 가져오는데 실패했습니다.");
        }
    });
}
// 일간 칼로리 삭제
function deleteExercise() {
	let userId = "${loginMember.id}";
    // AJAX 요청 및 처리 로직
    $.ajax({
        url: "DeleteExercise",
        type: "post",
        data: {
            "user_id": userId,
        },
        dataType: "json",
        success: function (response) {
            alert("운동 칼로리 삭제 성공!");
            // 서버로부터 받은 운동 칼로리 정보를 화면에 출력
            if (response.success) {
                let totalCalories = 0;
                // 운동 칼로리 정보를 성공적으로 삭제했을 경우에만 계산
                if (response.calories_waste !== undefined) {
                    totalCalories = parseInt(response.calories_waste);
                }
                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }
        },
        error: function () {
            alert("운동 칼로리 삭제 실패");
        }
    });
}

//주간 칼로리
function WeekHkcal() {
    let userId = "${loginMember.id}";

    // 조회 버튼 숨김
    $("#check").hide();

    // 기존 차트 제거
    if (exerciseChart) {
        exerciseChart.destroy();
    }

    $.ajax({
        url: "WeekExercise",
        type: "post",
        dataType: "json",
        data: {
            "user_id": userId,
        },
        success: function (response) {
            console.log(response);

            if (Object.keys(response).length > 0) {
                let totalCalories = 0;
                let dates = []; // 날짜 데이터
                let calories = []; // 칼로리 데이터

                // 'response' 객체의 키 값을 날짜 배열로 사용
                dates = Object.keys(response);

                dates.sort();
                
                // 'response' 객체의 값을 칼로리 배열로 사용
                calories = Object.values(response).map(function (exercises) {
                    // 현재 날짜에 대한 총 칼로리를 계산합니다.
                    return exercises.reduce(function (acc, exercise) {
                        return acc + parseFloat(exercise.calories_waste);
                    }, 0);
                });

                // 전체 칼로리 합산
                totalCalories = calories.reduce((acc, val) => acc + val, 0);

                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
                console.log("dates : " + dates);
                console.log("calories : " + calories);

                // 차트 그리기
                var ctx = document.getElementById("exerciseChart").getContext("2d");
                exerciseChart = new Chart(ctx, {
                    type: "line", // 꺾은선 차트 타입
                    data: {
                        labels: dates, // 날짜를 레이블로 사용
                        datasets: [
                            {
                                label: "주간 운동 칼로리 소모량",
                                data: calories, // 칼로리 데이터 사용
                                borderColor: "rgba(75, 192, 192, 1)",
                                backgroundColor: "rgba(75, 192, 192, 0.2)",
                                fill: true,
                            },
                        ],
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                            },
                        },
                    },
                });
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }
        },
        error: function () {
            alert("주간 칼로리 정보를 불러오는 데 실패했습니다.");
        },
    });
}

//주간 칼로리 삭제
function deleteWeekExercise() {
	let userId = "${loginMember.id}";
    // AJAX 요청 및 처리 로직
    $.ajax({
        url: "DeleteWeekExercise",
        type: "post",
        data: {
            "user_id": userId,
        },
        dataType: "json",
        success: function (response) {
            alert("운동 칼로리 삭제 성공!");
            // 서버로부터 받은 운동 칼로리 정보를 화면에 출력
            if (response.success) {
                let totalCalories = 0;
                // 운동 칼로리 정보를 성공적으로 삭제했을 경우에만 계산
                if (response.calories_waste !== undefined) {
                    totalCalories = parseInt(response.calories_waste);
                }
                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }
        },
        error: function () {
            alert("운동 칼로리 삭제 실패");
        }
    });
}

//월간 칼로리
function MonthHkcal() {
    let userId = "${loginMember.id}";

    // 조회 버튼 숨김
    $("#check").hide();

    // 기존 차트 제거
    if (exerciseChart) {
        exerciseChart.destroy();
    }

    $.ajax({
        url: "MonthExercise",
        type: "post",
        dataType: "json",
        data: {
            "user_id": userId,
        },
        success: function (response) {
            console.log(response);

            if (Object.keys(response).length > 0) {
                let totalCalories = 0;
                let dates = []; // 날짜 데이터
                let calories = []; // 칼로리 데이터

                // 'response' 객체의 키 값을 날짜 배열로 사용
                dates = Object.keys(response);
                
                dates.sort();

                // 'response' 객체의 값을 칼로리 배열로 사용
                calories = Object.values(response).map(function (exercises) {
                    // 현재 날짜에 대한 총 칼로리를 계산합니다.
                    return exercises.reduce(function (acc, exercise) {
                        return acc + parseFloat(exercise.calories_waste);
                    }, 0);
                });

                // 전체 칼로리 합산
                totalCalories = calories.reduce((acc, val) => acc + val, 0);

                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
                console.log("dates : " + dates);
                console.log("calories : " + calories);

                // 차트 그리기
                var ctx = document.getElementById("exerciseChart").getContext("2d");
                exerciseChart = new Chart(ctx, {
                    type: "line", // 꺾은선 차트 타입
                    data: {
                        labels: dates, // 날짜를 레이블로 사용
                        datasets: [
                            {
                                label: "월간 운동 칼로리 소모량",
                                data: calories, // 칼로리 데이터 사용
                                borderColor: "rgba(75, 192, 192, 1)",
                                backgroundColor: "rgba(75, 192, 192, 0.2)",
                                fill: true,
                            },
                        ],
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                            },
                        },
                    },
                });
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }
        },
        error: function () {
            alert("월간 칼로리 정보를 불러오는 데 실패했습니다.");
        },
    });
}


//월간 칼로리 삭제
function deleteMonthExercise() {
	let userId = "${loginMember.id}";
    // AJAX 요청 및 처리 로직
    $.ajax({
        url: "DeleteMonthExercise",
        type: "post",
        data: {
            "user_id": userId,
        },
        dataType: "json",
        success: function (response) {
            alert("운동 칼로리 삭제 성공!");
            // 서버로부터 받은 운동 칼로리 정보를 화면에 출력
            if (response.success) {
                let totalCalories = 0;
                // 운동 칼로리 정보를 성공적으로 삭제했을 경우에만 계산
                if (response.calories_waste !== undefined) {
                    totalCalories = parseInt(response.calories_waste);
                }
                // 합산된 운동 칼로리 정보 출력
                $("#totalCalories").text(totalCalories);
            } else {
                // 운동 칼로리 정보가 없을 경우 처리
                console.log("운동 칼로리 정보가 없습니다.");
            }
        },
        error: function () {
            alert("운동 칼로리 삭제 실패");
        }
    });
}

//랜덤 색상을 반환하는 함수 (차트 데이터셋마다 다른 색상 사용을 위함)
function getRandomColor() {
    const letters = "0123456789ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

</script>
	</body>
</html>