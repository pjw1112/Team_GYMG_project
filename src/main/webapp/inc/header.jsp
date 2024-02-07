<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="${pageContext.request.contextPath}/images/spoon.svg"
	type="image/png">

<script src="https://kit.fontawesome.com/5081dee0c3.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/yeeun.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/yeeun.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/moon_css.css" />


<script
	src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<title>가봄,맛봄</title>
<script>
	if (getCookieValue("remember_login")) {
		$.ajax({
			url : "user_login_byCookie.jin",
			type : "POST",
			dataType : "text",
			data : {
				"remember_login" : getCookieValue("remember_login")
			},
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n" + "status : " + status
						+ "/n" + "msg : " + msg);
			},
			success : function(data) {

				if (data == "2000") {

					let aa =""+"${empty sessionScope.login_user_dto}";
					console.log(aa);
					console.log(typeof(aa));
					if(aa.trim()=="true"){
						location.href="index.ye";
					}
						
				}

			}
		});
	}

	//아이디 기억하기 설정된 쿠키 값 확인하기
	function getCookieValue(cookieName) {
		// 쿠키 문자열을 가져옴
		var cookieString = document.cookie;

		// 쿠키를 ; 기준으로 분리
		var cookies = cookieString.split(';');

		// 쿠키를 순회하며 원하는 쿠키를 찾음
		for (var i = 0; i < cookies.length; i++) {
			var cookie = cookies[i].trim();

			// 쿠키의 이름과 값으로 분리
			var cookieParts = cookie.split('=');
			var name = cookieParts[0];
			var value = cookieParts[1];

			// 원하는 쿠키를 찾으면 값을 반환
			if (name === cookieName) {
				return value;
			}
		}

		// 해당 쿠키가 없으면 null 반환
		return null;
	}
</script>
</head>

<body>
	
	
	
		<header>
			<div class="header_column1 header_column">
				<a href="index.ye">가봄, 맛봄<img alt="가봄,맛봄"
					src="${pageContext.request.contextPath}/images/spoon.svg"></a>
			</div>
			<div class="header_column2 header_column">

				<c:choose>
					<c:when test="${empty sessionScope.login_user_dto}">
						<!-- 로그인이 되어있지 않은 경우 -->
						<div class="item_inColumn2 ">
							<a href="searchResult.ye?ctg_no=&searchKey=">맛봄찾기</a>
						</div>
						<div class="item_inColumn2 ">
							<a href="board_list.moon?ctg_no=1">자유게시판</a>
						</div>
						<div class="item_inColumn2 ">
							<a href="board_list.moon?ctg_no=2">맛집게시판</a>
						</div>

					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.login_user_dto.type_no == 1}">

								<div class="item_inColumn2">
									<a href="#">회원관리</a>
								</div>
								<div class="item_inColumn2">
									<a href="${pageContext.request.contextPath}/adminRestList.ye">식당관리</a>
								</div>
								<div class="item_inColumn2">
									<a href="board_list.moon?ctg_no=1">게시판</a>
								</div>

							</c:when>
							<c:when test="${sessionScope.login_user_dto.type_no == 2}">

								<div class="item_inColumn2 ">
									<a href="searchResult.ye?ctg_no=&searchKey=">맛봄찾기</a>
								</div>
								<div class="item_inColumn2 ">
									<a href="board_list.moon?ctg_no=1">자유게시판</a>
								</div>
								<div class="item_inColumn2 ">
									<a href="board_list.moon?ctg_no=2">맛집게시판</a>
								</div>
								<div class="item_inColumn2 ">
									<a href="searchResult.ye?ctg_no=&searchKey=">가볼,맛볼</a>
								</div>

							</c:when>

						</c:choose>

					</c:otherwise>
				</c:choose>

			</div>
			<!--  
			<div class="header_column3 header_column">
				<div class="search_bar_inHeader">
					<form action="#">
						<input type="text" placeholder="식당이름, 지역명, 메뉴명으로 검색"
							class="inputText_inSearchBar"> <input type="submit"
							class="submit_inSearchBar" value="">
						<div class="magnifying-glass">
							<img alt="검색"
								src="${pageContext.request.contextPath}/images/magnifying-glass.svg">
						</div>
					</form>
				</div>

			</div>
			-->
			<div class="header_column4 header_column">
				<div class="session_check">

					<c:choose>
						<c:when test="${empty sessionScope.login_user_dto}">
							<!-- 로그인이 되어있지 않은 경우 -->
							<a href="GoToLoginPage.jin" class="header_session_btn">로그인</a> | <a
								href="GoToJoin1Page.jin" class="header_session_btn">회원가입</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.login_user_dto.type_no == 1}">
									<strong>${sessionScope.login_user_dto.user_name}</strong> 님 | 
							<strong>ADMIN</strong> |
							<a href="user_logout.jin" class="header_session_btn"><strong>Out</strong></a>
								</c:when>
								<c:when test="${sessionScope.login_user_dto.type_no == 2}">
									<strong>${sessionScope.login_user_dto.user_name}</strong> 님 | 
							<a href="GoToMic_tab1Page.jin" class="header_session_btn"><strong>MY</strong></a> |
							<a href="user_logout.jin" class="header_session_btn"><strong>Log Out</strong></a>
								</c:when>

							</c:choose>

						</c:otherwise>
					</c:choose>



				</div>

			</div>

		</header>
		
		<!-- 여기 위로 1HEADER -->
		<!-- 여기 위로 HEADER -->
		<!-- 여기 위로 HEADER -->