<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>
<div class="ye-container">
	
	<c:if test="${not empty list.get(3)}">
	<section class="rest-img-box">
		<c:forEach var="file" items="${list.get(3)}">
		<div style="background-image: url('${pageContext.request.contextPath}/resources/uploads/${file.file_name}'); width : calc(100% / ${list.get(3).size()});"></div>
		</c:forEach>
	</section>
	</c:if>
	<c:if test="${empty list.get(3)}">
	<section class="rest-img-empty"></section>
	</c:if>
	<div class="wrapper-yeeun rest-single">
		<section class="rest-info">
			<div class="rest-title">
				<h2 class="rest-name">${list.get(0).rest_name}</h2>
				<p class="ctg-name">${list.get(0).ctg_name}</p>
			</div>
			<p class="rest-desc">${list.get(0).rest_desc}</p>
			<div class="rest-content">
				<div class="rest-text">
					<dl class="rest-address">
						<dt>주소</dt>
						<dd>${list.get(0).rest_address}
							<c:if test="${list.get(0).rest_address2 != null}">, ${list.get(0).rest_address2}</c:if>
						</dd>
					</dl>
					<dl class="rest-tel">
						<dt>전화번호</dt>
						<dd>${list.get(0).rest_tel}</dd>
					</dl>
					<dl class="biz-time">
						<dt>영업시간</dt>
						<dd>
							<ul>
								<c:if test="${list.get(1).get(0).biz_off eq 1}">
									<li>월 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(0).biz_off ne 1}">
									<li>월 (${list.get(1).get(0).biz_open} ~
										${list.get(1).get(0).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(1).biz_off eq 1}">
									<li>화 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(1).biz_off ne 1}">
									<li>화 (${list.get(1).get(1).biz_open} ~
										${list.get(1).get(1).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(2).biz_off eq 1}">
									<li>수 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(2).biz_off ne 1}">
									<li>수 (${list.get(1).get(2).biz_open} ~
										${list.get(1).get(2).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(3).biz_off eq 1}">
									<li>목 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(3).biz_off ne 1}">
									<li>목 (${list.get(1).get(3).biz_open} ~
										${list.get(1).get(3).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(4).biz_off eq 1}">
									<li>금 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(4).biz_off ne 1}">
									<li>금 (${list.get(1).get(4).biz_open} ~
										${list.get(1).get(4).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(5).biz_off eq 1}">
									<li>토 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(5).biz_off ne 1}">
									<li>토 (${list.get(1).get(5).biz_open} ~
										${list.get(1).get(5).biz_close})</li>
								</c:if>
								<c:if test="${list.get(1).get(6).biz_off eq 1}">
									<li>일, 공휴일 (휴무)</li>
								</c:if>
								<c:if test="${list.get(1).get(6).biz_off ne 1}">
									<li>일, 공휴일 (${list.get(1).get(6).biz_open} ~
										${list.get(1).get(6).biz_close})</li>
								</c:if>
							</ul>
						</dd>
					</dl>
					<dl class="rest-date">
						<dt>정보게시일</dt>
						<dd>${list.get(0).rest_time}</dd>
					</dl>
					<a href="mailto:pye6423@gmail.com">식당 정보 수정요청</a>
				</div>
				<div class="rest-map">
				<button class="org-large-btn find-rest-btn">길찾기</button>
				<button class="org-large-btn find-parking-btn">근처 주차장</button>
				</div>
			</div>
		</section>
		<section class="rest-social">
			<div class="social-item">
				<span class="social-item_span"></span>
				<div class="icon-container">
					<img src="${pageContext.request.contextPath}//images/star_icon.svg"
						alt="" /><span class="social-item-avg"></span>
				</div>
			</div>
			<div class="social-item">
				<button class="heart-like">
					<span>좋아요</span>
					<div class="icon-container">
						<div class="heart-img"></div>
						<span>${list.get(0).rest_like_cnt}</span>
					</div>
				</button>
			</div>
			<div class="social-item">
				<button class="share-page-ye">
					<span>공유하기</span>
					<div class="icon-container">
						<img
							src="${pageContext.request.contextPath}/images/share_icon.svg"
							alt="" />
					</div>
				</button>
			</div>
		</section>
		<section class="rest-menu">
			<h3>메뉴</h3>
			<div class="menu-list">
				<c:forEach var="menu" items="${list.get(2)}">
				<dl>
					<dt>${menu.menu_name}</dt>
					<dd>${menu.menu_price} 원</dd>
				</dl>
				</c:forEach>
			</div>
		</section>
		<section class="rest-review">
			<h3 class="rest_review_cnt"></h3>
			<div class="board_single_review">	 <!-- 댓글 감싸는 div -->
           		<div class="rest_review_form_wrapper">	<!-- 댓글 insert 부분 form -->
           			<div class="rest_review_star_per_wrapper">
           				<!-- 별점 갯수 나타내는 부분 -->
           				<div class="rest_review_star_per">
           					<div class="rest_review_star_img">
           						<img src="${pageContext.request.contextPath}/images/star5.svg" alt="별 5개">
           					</div>
           					<div class="progress-bar">           
								<div class="progress progress1"></div>
								<span class="progress_cnt star5"></span>
							</div>
           				</div>
           				<div class="rest_review_star_per">
           					<div class="rest_review_star_img">
           						<img src="${pageContext.request.contextPath}/images/star4.svg" alt="별 4개">
           					</div>
           					<div class="progress-bar">           
								<div class="progress progress2"></div>
								<span class="progress_cnt star4"></span>
							</div>
           				</div>
           				<div class="rest_review_star_per">
           					<div class="rest_review_star_img">
           						<img src="${pageContext.request.contextPath}/images/star3.svg" alt="별 3개">
           					</div>
           					<div class="progress-bar">           
								<div class="progress progress3"></div>
								<span class="progress_cnt star3"></span>
							</div>
           				</div>
           				<div class="rest_review_star_per">
           					<div class="rest_review_star_img">
           						<img src="${pageContext.request.contextPath}/images/star2.svg" alt="별 2개">
           					</div>
           					<div class="progress-bar">           
								<div class="progress progress4"></div>
								<span class="progress_cnt star2"></span>
							</div>
           				</div>
           				<div class="rest_review_star_per">
           					<div class="rest_review_star_img">
           						<img src="${pageContext.request.contextPath}/images/star1.svg" alt="별 1개">
           					</div>
           					<div class="progress-bar">           
								<div class="progress progress5"></div>
								<span class="progress_cnt star1"></span>
							</div>
           				</div>
           			</div>
					<div class="rest_review_write">
						<div class="rest_review_user_wrapper">
							<div class="rest_review_user">
								<!-- 프로필사진 -->
								<img src="${pageContext.request.contextPath}/images/profile.svg" alt="작성자 닉네임">
								<!-- 닉네임 -->
								<p class="rest_review_nick">${sessionScope.login_user_dto.user_nick }</p>
							</div>
							<div class="rest_review_star_selectbox">
								<select class="review_star">
								  <option class="star_1 fa" value="1">&#xf005</option>
								  <option class="star_2 fa" value="2">&#xf005 &#xf005</option>
								  <option class="star_3 fa" value="3">&#xf005 &#xf005 &#xf005</option>
								  <option class="star_4 fa" value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
								  <option class="star_5 fa" value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
								</select>
							</div>
						</div>
						<div>
						 <textarea id="review_content" name="review_content" class="rest_review_textarea"></textarea>
						</div>
						<c:choose>
						    <c:when test="${empty sessionScope.login_user_dto}">
						        <div class="">
									<input type="button"   value="리뷰 등록"  class="org-large-btn" id="rest_review_write_btn_nologin" >
								</div>
						    </c:when>
						    <c:otherwise>
						        <div class="">
									<input type="button"   value="리뷰 등록"  class="org-large-btn" id="rest_review_write_btn" >
								</div>
						    </c:otherwise>
						</c:choose>
					</div>
					
           		</div>
           		<div id="sessionUserNo" data-user-no="${sessionScope.login_user_dto.user_no }"></div>
           		<div class="rest_review_list" id="rest_review_list" > 
           			
           			<!-- 댓글 리스트 -->
           			<!-- 댓글 리스트 -->
           			<!-- 댓글 리스트 -->
           		
           		</div>
           	</div>	<!-- end review -->
		</section>
	</div>
</div>s
<div class="layer-pop-modal">
	<div class="layer-pop find-road">
		<p class="popup-title">${list.get(0).rest_name} (${list.get(0).rest_address}
							<c:if test="${list.get(0).rest_address2 != null}">, ${list.get(0).rest_address2}</c:if>)</p>
		<button class = "close-pop-btn">
			<img src="${pageContext.request.contextPath}/images/delete_icon.svg"/>
		</button>
		<div class="popup-content">
			<span>현재 위치에서 길찾기</span>
			<div class="find-road-map">
				
			</div>
		</div>
	</div>
	<div class="layer-pop find-parking">
		<p class="popup-title">${list.get(0).rest_name} (${list.get(0).rest_address}
							<c:if test="${list.get(0).rest_address2 != null}">, ${list.get(0).rest_address2}</c:if>)</p>
		<button class = "close-pop-btn">
			<img src="${pageContext.request.contextPath}/images/delete_icon.svg"/>
		</button>
		<div class="popup-content">
			<span>근처 주차장 정보</span>
			<div class="parking-info">
		        <h2>주차장 정보</h2>
		        <table>
		            <tr>
		                <th>항목</th>
		                <th>정보</th>
		            </tr>
		            <tr>
		                <td>주차장 이름</td>
		                <td>Your Parking Lot</td>
		            </tr>
		            <tr>
		                <td>주소</td>
		                <td>123 Street, City</td>
		            </tr>
		            <tr>
		                <td>전화번호</td>
		                <td>(123) 456-7890</td>
		            </tr>
		            <tr>
		                <td>총 주차면</td>
		                <td>100</td>
		            </tr>
		            <tr>
		                <td>현재 주차 차량 수</td>
		                <td>50</td>
		            </tr>
		            <tr>
		                <td>유무료 구분</td>
		                <td>유료</td>
		            </tr>
		            <tr>
		                <td>기본 주차 요금</td>
		                <td>$2.00</td>
		            </tr>
		            <tr>
		                <td>기본 주차 시간</td>
		                <td>1시간</td>
		            </tr>
		            <tr>
		                <td>추가 단위 요금</td>
		                <td>$1.00</td>
		            </tr>
		            <tr>
		                <td>추가 단위 시간</td>
		                <td>30분</td>
		            </tr>
		            <tr>
		                <td>일 최대 요금</td>
		                <td>$10.00</td>
		            </tr>
		        </table>
			</div>	
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6b5214426df989a43073f46ca3e2ca9&libraries=services"></script>
<script>
var mapContainer = document.querySelector('.rest-map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${list.get(0).rest_address}', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px; text-align:center;padding:6px 0;">${list.get(0).rest_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<!-- 카카오톡 공유하기 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"></script>
<script>
  Kakao.init('e6b5214426df989a43073f46ca3e2ca9'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
$(function(){
	$('.share-page-ye').on('click',function(){
		//shareMessage();
		// 현재 페이지의 URL 가져오기
	      var currentPageUrl = window.location.href;

	      var textarea = document.createElement("textarea");
	      textarea.value = currentPageUrl;
	      document.body.appendChild(textarea);
	      textarea.select();
	      document.execCommand('copy');
	      document.body.removeChild(textarea);

	      alert('URL이 복사되었습니다.');
	})
}) 

function shareMessage() {
	alert('카카오톡 공유하기 http://localhost:8080');
    Kakao.Share.sendDefault({
      objectType: 'text',
      text:
        '기본 템플릿으로 제공되는 텍스트 템플릿은 텍스트를 최대 200자까지 표시할 수 있습니다. 텍스트 템플릿은 텍스트 영역과 하나의 기본 버튼을 가집니다. 임의의 버튼을 설정할 수도 있습니다. 여러 장의 이미지, 프로필 정보 등 보다 확장된 형태의 카카오톡 공유는 다른 템플릿을 이용해 보낼 수 있습니다.',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'http://localhost:8080',
        webUrl: 'http://localhost:8080',
      },
    });
  }
</script>
<script>
$(function(){
	$('.find-rest-btn').on('click',function(){
		alert('길찾기를 시작합니다.');
<<<<<<< HEAD
		
		
		let origin = '127.111202,37.394912,name=현재위치주소';
		let destination = '127.111202,37.394912,name=식당명';
=======
		$('.layer-pop-modal').stop().show();
		$('.layer-pop.find-road').stop().fadeIn(200);
>>>>>>> refs/heads/moon0131
		
<<<<<<< HEAD
		getLocation();
		
		
		
		
		
		
		
		
		/* $.ajax({
=======
		
		let origin = '127.111202,37.394912';
		let destination = '127.111202,37.394912';
		/* let origin = '';
		let destination = ''; */
	
		$.ajax({
>>>>>>> refs/heads/moon0131
			url : 'findRestKakao.ye',
			type : "GET",
			data : {origin : origin,
					destination : destination},
			dataType : "json",
			contentType : 'application/json;charset=UTF-8',
			error : function(xhr, status, msg){
				alert(status + " / " + msg);
			},
			success : function(json){
				console.log(json.routes);
				console.log(json.routes[0].summary.fare.taxi);
			}
		}) */
		
	})
	
<<<<<<< HEAD
	
=======
	$('.close-pop-btn').on('click',function(){
		$('.layer-pop.find-road, .layer-pop.find-parking').stop().fadeOut();
		$('.layer-pop-modal').stop().fadeOut(200);
	})
	

>>>>>>> refs/heads/moon0131
})

$(function(){
	$('.find-parking-btn').on('click',function(){
		alert('근처 주차장 찾기');
		$('.layer-pop-modal').stop().show();
		$('.layer-pop.find-parking').stop().fadeIn(200);
	})
})




</script>
<script>
//위치정보 사용
function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(getAddressByCoords,redirectLocation, geo_options);
        //navigator.geolocation.getCurrentPosition(successCallback,errorCallback,{ timeout: 10_000 });
	} else {
		alert('현재 위치를 가져올 수 없습니다.');
	}
}

// 위치 정보 조회 성공시 호출
function getAddressByCoords(position) {
	var longitude = position.coords.longitude;
	var latitude = position.coords.latitude;
	console.log("현재 위치  : (경도) "+longitude + ", (위도) " + latitude);
	
}

//위치 정보 조회 실패시 호출
function redirectLocation(error) {
	alert('에러 발생');
}

//타임아웃 변수
var geo_options = {
	maximumAge        : 5000, 
	timeout           : 10000
};
</script>
<script>
//위치정보 사용
function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(getAddressByCoords,redirectLocation, geo_options);
        //navigator.geolocation.getCurrentPosition(successCallback,errorCallback,{ timeout: 10_000 });
	} else {
		alert('현재 위치를 가져올 수 없습니다.');
	}
}

// 위치 정보 조회 성공시 호출
function getAddressByCoords(position) {
	var longitude = position.coords.longitude;
	var latitude = position.coords.latitude;
	console.log("현재 위치  : (경도) "+longitude + ", (위도) " + latitude);
	
}

//위치 정보 조회 실패시 호출
function redirectLocation(error) {
	alert('에러 발생');
}

//타임아웃 변수
var geo_options = {
	maximumAge        : 5000, 
	timeout           : 10000
};
</script>
<script>
$(function(){
	let restNo = '<c:out value="${param.rest_no}" />';
	let userNo = '<c:out value="${sessionScope.login_user_dto.user_no}" />';
	
	if(userNo == ''){
		userNo = 0;
	}
	
	$.ajax({
		url : 'checkRestLike.ye',
		type : 'GET', 
		data : {restNo : restNo, userNo : userNo },
		dataType : "text",
		error : function(xhr, status, msg){
			alert(status + ' / ' + msg);
		},
		success : function(text){
			if (text > 0){
				$('.heart-like').addClass('active');
			}
			
		}
	})
	
	$('.heart-like').on('click',function(){
		if(userNo == ''){
			alert('로그인 후 이용이 가능합니다.');
		}else{
			
			$.ajax({
				url : 'restLike.ye',
				type : 'GET', 
				data : {restNo : restNo, userNo : userNo },
				dataType : "json",
				error : function(xhr, status, msg){
					alert(status + ' / ' + msg);
				},
				success : function(text){
					$('.heart-like .icon-container span').html(text);
					$('.heart-like').toggleClass('active');
				}
			})
			
			
		}
	})
	
})
</script>


<script>
// 식당 리뷰 script
	$(function(){
		var reviewWriteNologin = $('#rest_review_write_btn_nologin');
		var reviewWriteBtn = $('#rest_review_write_btn');
		var reviewContent = $('#review_content');
		var sessionUserNo = $("#sessionUserNo").data('user-no');
		var deleteReviewBtn = $('.rest_review_delete_btn_input');
		
		
		reviewReadAll();
		restReviewStar();
		
		//비로그인시 리뷰 등록 클릭
		reviewWriteNologin.click(function(){
			alert('로그인 후 이용가능한 서비스입니다.');
		});
		
		reviewWriteBtn.click(function(){
			if(reviewContent.val() == ""){
				alert("리뷰가 빈칸입니다. 확인해주세요 ! ");
				reviewContent.focus();
    			return false;
			}else{
	            $.ajax({
	                url: "rest_review_write.moon?rest_no=" + ${list.get(0).rest_no},
	                type: "POST",
	                dataType: "json",
	                data: {
	                    "user_no": sessionUserNo,
	                    "review_content": reviewContent.val(),
	                    "review_star" : $(".review_star option:selected").val()
	                },
	                error: function (xhr, status, msg) {
	                    alert(status + "/" + msg);
	                },
	                success: function (json) {
	                	reviewContent.val('');
	                	reviewReadAll();
	                	restReviewStar();
	                }
	            });
    		}
			
		});
		
		//리뷰 리스트 뽑아서
        function reviewReadAll() {
            $.ajax({
                url: "rest_review.moon?rest_no=" + ${list.get(0).rest_no},
                type: "GET",
                dataType: "json",
                error: function (xhr, status, msg) {
                    alert(status + "/" + msg);
                },
                success: function (json) {
                	$(".rest_review_cnt").html("리뷰(" + json.reviewCnt + ")");
                	$(".social-item_span").html("리뷰(" + json.reviewCnt + ")");
                	$(".social-item-avg").html(json.reviewAvg.toFixed(1));
                	reviewListResult(json);
                }
            });
        }
		//뽑아온 리뷰 리스트 보여주기 ~ 
        function reviewListResult(json) {
            $("#rest_review_list").empty();
			//반복문
         	$.each(json.list, function (idx, list) {
                var deleteBtn = $(" <img src='${pageContext.request.contextPath}/images/delete_icon.svg' alt='delete버튼' class='rest_review_delete_btn_input'/>");
                var reviewItem = $("<div>").addClass("rest_review_single").attr("data-no", list.review_no)
                    .append(
					    $("<div>").addClass("rest_review")
					        .append(
					            $("<div>").addClass("rest_review_list_user")
					                .append($("<img>").attr("src", "${pageContext.request.contextPath}/images/profile.svg").attr("alt", "작성자 사진"))
					                .append($("<p>").html(list.review_auth))
					                .append($("<p>").addClass("rest_review_time_p").html(list.review_time))
					        )
					        .append(
					            $("<div>").addClass("rest_review_content")
					         		.append($("<img>").attr("src", "${pageContext.request.contextPath}/images/star" + list.review_star + ".svg").attr("alt", "별점 사진"))
					                .append($("<p>").addClass("rest_review_content_p").html(list.review_content))
					        )
					);
                   
				
                //로그인 한 유저 본인의 댓글일 경우 삭제 버튼 보여짐
                if (sessionUserNo == list.user_no) {
                	reviewItem.append(
                        $("<div>").addClass("rest_review_delete_btn")
                            .append(deleteBtn)
                    );
                }
                reviewItem.appendTo("#rest_review_list");
            });	//each end 
        }
		
        $(document).on('click', '.rest_review_delete_btn_input', function() {
            var reviewNo = $(this).closest('.rest_review_single').data('no');
            deleteReview(reviewNo);
        });

        //댓글 삭제 버튼 클릭시 
        function deleteReview(reviewNo) {
            $.ajax({
                url: "rest_review_delete.moon?rest_no=" + ${list.get(0).rest_no},
                type: "POST",
                dataType: "json",
                data: {
                    "review_no": reviewNo
                },
                error: function (xhr, status, msg) {
                    alert(status + "/" + msg);
                },
                success: function (json) {
                	reviewReadAll();
                }
            });
        }
        
        
        function restReviewStar(){
        	$.ajax({
                url: "rest_review_star.moon?rest_no=" + ${list.get(0).rest_no},
                type: "POST",
                dataType: "json",
                error: function (xhr, status, msg) {
                    alert(status + "/" + msg);
                },
                success: function (json) {
                	console.log(json);
                	$(".progress").empty();
                	$(".star1").html(json.star1);
                	$(".star2").html(json.star2);
                	$(".star3").html(json.star3);
                	$(".star4").html(json.star4);
                	$(".star5").html(json.star5);
                	
                	
                }
            });
        }
		
	
	});

</script>


<%@ include file="../inc/footer.jsp"%>