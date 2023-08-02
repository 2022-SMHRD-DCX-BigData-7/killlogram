<%@page import="com.smhrd.domain.NutritonfactsVO"%>
<%@page import="com.smhrd.domain.NutritonfactsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Left Sidebar(kcal)</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

                    <div class="col-9 col-12-medium imp-medium">
                        <div class="content">
                     	<button type="button" onclick="location.href='kcalLeft.jsp'" class="button1">식단 칼로리</button> 
                        <button type="button" onclick="location.href='kcalWeek.jsp'" class="button1">운동 칼로리</button> <br>
                        <button type="button" onclick="location.href='kcalLeft.jsp'"  class="btn3">일</button>
                        <button type="button" onclick="Weekkcal()"   class="btn4">주</button>
                        <button type="button" onclick="Monthkcal()"  class="btn5">월</button>
                        
                     <!-- 주간 -->
                     <div id="weeklyCaloriesInfo"></div>
                     <!-- 월간 -->
                     <div id="monthlyCaloriesInfo"></div>
                                  
                     <div class="totalkcal">
                        <span>하루 총 섭취량</span>
                        <!-- 일간 -->
                        <div id="dailyCaloriesInfo"></div>
                        <h2 class="total">총 열량 : <span id="totalCalories">0</span> kcal</h2>
                        <h2 class="meal">아침 : <span id="breakfast">0</span> kcal</h2>
                        <h2 class="meal">점심 : <span id="lunch">0</span> kcal</h2>
                        <h2 class="meal">저녁 : <span id="dinner">0</span> kcal</h2>
                     </div>



                            <p class="kcal">칼로리 검색</p>
                              <div class="line"></div>
                            
                            
                        <div class="mid_wrapper">
                            <form class="aaa">
                                <table>
                                    <tr>
                                        <td width="60%">
                                            <input type="text" class="search_kcal" autocomplete="off" name="food_name" onkeydown="searchOnEnter(event)">
                                        </td>
                                        <td>
                                            <button type="button" onclick="dataload()">검색</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        
                        <div class="nutritonfacts_info">
                            <table id="tb">
                                <!-- 검색한 음식 정보 출력 -->
                            </table>
                        </div>
                        
                        <select name="selectmeal" class="meal">
                            <option value="아침">아침</option>
                            <option value="점심">점심</option>
                            <option value="저녁">저녁</option>
                        </select>
                        <button onclick="input()" class="kcaksend">등록</button>
                        <button type="button" id="deleteDaily" onclick="deleteDailyCalories()">삭제</button>
<!--                         <button onclick="deleteWeeklyCalories()" class="kcaksend">주간 칼로리 삭제</button>
                        <button onclick="deleteMonthlyCalories()" class="kcaksend">월간 칼로리 삭제</button> -->
                        
<!-- <script>
    // 주간 칼로리 정보 불러오기
    function Weekkcal() {
        $.ajax({
            url: "WeekNutriList", // 주간 칼로리 정보를 불러오는 서버의 URL
            type: "get",
            dataType: "json",
            success: function (response) {
                // 테이블 초기화
                $("#weeklyCaloriesInfo").empty();
                // 주간 칼로리 정보 출력
                $.each(response, function (idx, item) {
                    var row = $("<div></div>");
                    row.append($("<h2></h2>").text("주간 " + item.week + " 칼로리"));
                    row.append($("<p></p>").text("월간 총 칼로리 : " + item.total + " kcal"));
                    $("#weeklyCaloriesInfo").append(row);
                });
            },
            error: function () {
                alert("주간 칼로리 정보를 불러오는 데 실패했습니다.");
            }
        });
    }
</script> -->

<script type="text/javascript">
    // 엔터키 이벤트 처리 함수
    function searchOnEnter(event) {
        if (event.keyCode === 13) { // 엔터키(키 코드 13)를 눌렀을 때
            event.preventDefault(); // 폼 제출 방지
            dataload(); // 검색 실행
        }
    }
	
 	// 검색한 음식 데이터 출력 함수
    function dataload() {
        var selectedFood = $("input[name=food_name]").val();

        $.ajax({
            url: "NutriList",
            type: "get",
            data: { "food_name": selectedFood },
            dataType: "json",
            success: function (response) {
                // 테이블 초기화
                $("#tb").empty();
                
                if (response.length > 0) {
                    // 음식 정보 출력
                    $.each(response, function (idx, item) {
                        var row = $("<tr></tr>");
                        // checkbox를 클릭하면 inputMeal 함수 호출
                        row.append($("<td><input type='checkbox' onclick='inputMeal(this)'></td>"));
                        row.append($("<td></td>").text(item.food_name));
                        row.append($("<td></td>").text(item.calories));
                        row.append($("<td></td>").text(item.protein));
                        row.append($("<td></td>").text(item.carbohydrate));
                        row.append($("<td></td>").text(item.fat));
                        row.append($("<td></td>").text(item.intake));
                        row.append($("<td></td>").text(item.unit));
                        $("#tb").append(row);
                    });
                } else {
                    alert("음식이 존재하지 않습니다.");
                }
            },
            error: function () {
                alert("데이터를 불러오는 데 실패했습니다.");
            }
        });
    }

 	// 선택한 음식의 칼로리 정보를 저장하고 누적하는 함수
    function inputMeal(checkbox) {
        var selectedRow = $(checkbox).closest("tr");
        var selectedFood = selectedRow.find("td:eq(1)").text();
        var selectedCalories = parseInt(selectedRow.find("td:eq(2)").text());
        var selectedMeal = $("select[name=selectmeal]").val();
        
        // 콘솔 창에 선택한 음식 정보와 누적된 칼로리 값을 출력
        console.log("선택한 음식 : " + selectedFood);
        console.log("선택한 음식 칼로리 : " + selectedCalories);

        // 선택한 음식의 칼로리 정보를 각각 아침, 점심, 저녁 칼로리로 누적하거나 초기화
        if (selectedMeal === "아침") {
            if ($(checkbox).prop("checked")) {
            	$("#breakfast").text(parseInt($("#breakfast").text()) + selectedCalories);
            } else {
            	$("#breakfast").text(parseInt($("#breakfast").text()) - selectedCalories);
            }
            // 아침 칼로리 값을 콘솔 창에 출력
            console.log("아침 칼로리 : " + $("#breakfast").text());
        } else if (selectedMeal === "점심") {
            if ($(checkbox).prop("checked")) {
                $("#lunch").text(parseInt($("#lunch").text()) + selectedCalories);
            } else {
                $("#lunch").text(parseInt($("#lunch").text()) - selectedCalories);
            }
            // 점심 칼로리 값을 콘솔 창에 출력
            console.log("점심 칼로리 : " + $("#lunch").text());
        } else if (selectedMeal === "저녁") {
            if ($(checkbox).prop("checked")) {
                $("#dinner").text(parseInt($("#dinner").text()) + selectedCalories);
            } else {
                $("#dinner").text(parseInt($("#dinner").text()) - selectedCalories);
            }
            // 저녘 칼로리 값을 콘솔 창에 출력
            console.log("저녁 칼로리 : " + $("#dinner").text());
        }

        // 총 열량 계산하여 출력
        var totalCalories = parseInt($("#breakfast").text()) + parseInt($("#lunch").text()) + parseInt($("#dinner").text());
        $("#totalCalories").text(totalCalories);


        // 선택한 음식 처리가 끝났으므로, 체크박스 초기화
        $(checkbox).prop("checked", false);
        
        // 총 열량을 콘솔 창에 출력
        console.log("총 열량 : " + totalCalories);
    }


 	// 칼로리 정보를 가져와서 선택한 아침, 점심, 저녁 칼로리를 계산하는 함수
   function updateSelectedCalories() {
    var selectedFood = $("input[name=food_name]").val();
    var selectedMeal = $("select[name=selectmeal]").val();

	    $.ajax({
	        url: "NutriList",
	        type: "get",
	        data: { "food_name": selectedFood },
	        dataType: "json",
	    }).done(function (response) {
	        if (response.length > 0) {
	            // 선택한 음식의 칼로리 정보를 각각 아침, 점심, 저녁 칼로리로 누적
	            $.each(response, function (idx, item) {
	                var selectedCalories = item.calories;
	                if (selectedMeal === "아침") {
	                    $("#breakfast").text(parseInt($("#breakfast").text()) + selectedCalories);
	                } else if (selectedMeal === "점심") {
	                    $("#lunch").text(parseInt($("#lunch").text()) + selectedCalories);
	                } else if (selectedMeal === "저녁") {
	                    $("#dinner").text(parseInt($("#dinner").text()) + selectedCalories);
	                }
	            });
	            updateTotalCalories();
	        } else {
	            alert("선택한 음식의 칼로리 정보를 가져올 수 없습니다.");
	        }
	    }).fail(function () {
	        alert("칼로리 정보를 불러오는 데 실패했습니다.");
	    });
	}

   // 선택한 칼로리를 합산하여 총 칼로리를 업데이트하는 함수
   function updateTotalCalories() {
       var breakfastCalories = parseInt($("#breakfast").text());
       var lunchCalories = parseInt($("#lunch").text());
       var dinnerCalories = parseInt($("#dinner").text());

       // 총 열량 계산하여 출력
       var totalCalories = breakfastCalories + lunchCalories + dinnerCalories;
       $("#totalCalories").text(totalCalories);
   }

   function input() {
       var selectedFood = $("input[name=food_name]").val();
       var selectedMeal = $("select[name=selectmeal]").val();
       var totalCalories = parseInt($("#totalCalories").text());
       var nutriIdx = 1; // NutritonfactsDAO에서 해당 정보를 가져오는 방법이 있어야 합니다.
       var createdAt = new Date();

       $.ajax({
           url: "NutriList",
           type: "get",
           data: { "food_name": selectedFood },
           dataType: "json",
       }).done(function (response) {
           // selectedMeal 초기화(자동으로 검색한 음식의 첫번째 음식 칼로리 들어가는 것을 초기화)
           selectedMeal = 0;

           if (response.length > 0) {
               var selectedCalories = response[0].calories;
               if (selectedMeal === "아침") {
                   $("#breakfast").text(parseInt($("#breakfast").text()) + selectedCalories);
               } else if (selectedMeal === "점심") {
                   $("#lunch").text(parseInt($("#lunch").text()) + selectedCalories);
               } else if (selectedMeal === "저녁") {
                   $("#dinner").text(parseInt($("#dinner").text()) + selectedCalories);
               }
               totalCalories += selectedCalories;
               updateTotalCalories();

               // 서버에 누적된 칼로리 정보 저장 요청
               saveCalories(selectedMeal, totalCalories, nutriIdx, createdAt);
           } else {
               alert("선택한 음식의 칼로리 정보를 가져올 수 없습니다.");
           }
       }).fail(function () {
           alert("칼로리 정보를 불러오는 데 실패했습니다.");
       });
   }
   // 서버에 누적된 칼로리 정보를 저장하는 함수
   function saveCalories(meal, calories, nutriIdx, createdAt) {
       $.ajax({
           url: "SaveCaloriesServlet",
           type: "post",
           data: {
               "meal": meal,
               "calories": calories,
               "nutriIdx": nutriIdx,
               "createdAt": createdAt
           },
           dataType: "json",
           success: function (response) {
               console.log("누적된 칼로리 정보 저장 성공!");
           },
           error: function () {
               alert("누적된 칼로리 정보 저장에 실패했습니다.");
           }
       });
   }

    // 일간 칼로리 정보 삭제
    function deleteDailyCalories(checkbox) {
    	var selectedMeal = $("select[name=selectmeal]").val();
    	if (selectedMeal === "아침") { 
            $("#breakfast").text("0");
            // 아침 칼로리 값을 콘솔 창에 출력
            console.log("아침 칼로리 : " + $("#breakfast").text());
        } else if (selectedMeal === "점심") {        
            $("#lunch").text("0");
            // 점심 칼로리 값을 콘솔 창에 출력
            console.log("점심 칼로리 : " + $("#lunch").text());
        } else if (selectedMeal === "저녁") {
            $("#dinner").text("0");
            // 저녘 칼로리 값을 콘솔 창에 출력
            console.log("저녁 칼로리 : " + $("#dinner").text());
        }
    }
    
</script>



</body>
</html>