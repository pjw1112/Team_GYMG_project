<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>
<div class="container">
	<!-- header end -->
	<section class="top-section">
		<div class="top-content">
			<h2>숨겨진 맛봄을 알려줘!</h2>
			<p>
				가봄,맛봄에 나만의 맛집을 공유해주세요!<br />매달 추첨을 통해 소정의 선물을 드려요.
			</p>
			<a href="">자세히보기</a>
		</div>
	</section>
	<div class="wrapper-yeeun">
		<section class="section-yeeun sec1">
			<h2>전국 맛봄 검색</h2>
			<div class="main-search-box">
				<form action="searchResult.ye?" method="get" id="rest-search-form">
					<fieldset>
						<legend>전국 맛집 검색</legend>
						<input type="search" name="ctg_no" hidden />
						<input type="search" id="search" name="searchKey"
							placeholder="식당 이름, 지역명, 메뉴명으로 검색" /> <input
							type="submit" value="" title="식당 검색을 시작합니다" />
					</fieldset>
				</form>
			</div>
		</section>
		<!-- <section class="section-yeeun sec2">
					<h2>지하철 근처 맛봄 찾기</h2>
					<ul>
						<li>
							<a href="?loc_no=1">
								<span>서울/경기/인천</span>
							</a>
						</li>
						<li>
							<a href="?loc_no=2"><span>부산</span></a>
						</li>
						<li>
							<a href="?loc_no=3"><span>대구</span></a>
						</li>
						<li>
							<a href="?loc_no=4"><span>대전</span></a>
						</li>
						<li>
							<a href="?loc_no=5"><span>광주</span></a>
						</li>
					</ul>
				</section> -->
		<section class="section-yeeun sec3">
			<h2>메뉴별 맛봄 찾기</h2>
			<ul class="ctg-list">
				<c:forEach var="ctg" items="${ctgList}" varStatus="status">
					<c:if test="${!status.last}">
					<li><a href="searchResult.ye?ctg_no=${ctg.ctg_no}">
							<figure>
								<img src="${pageContext.request.contextPath}/images/ctg_icon_${ctg.ctg_no}.svg" alt="" />
							</figure> <span>${ctg.ctg_name}</span>
					</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</section>
		<section class="section-yeeun sec4">
			<h2>
				<strong>경기도 과천시</strong> 근처 맛봄 추천
			</h2>
			<a href="searchResult.ye?ctg_no=&searchKey=경기도+과천시" class="more-btn org-short-btn">전체보기</a>
			<ul class="main-rest-list1">
				<c:forEach var="list" items="${locList}">
					<li class="rest-small-card"><a href="detail.ye?rest_no=${list.rest_no}" title="식당명 상세페이지 이동">
							<div>
								<figure class="rest-img-box">
									<img src="${pageContext.request.contextPath}/images/dummy_rest_img.png" alt="" />
								</figure>
								<p class="review-box">
									<img src="${pageContext.request.contextPath}/images/star_icon.svg" alt="별 아이콘" /> <span>${list.review_avg}
										(${list.review_cnt})</span>
								</p>
								<p class="rest-name">${list.rest_name}</p>
								<p class="rest-desc">${list.rest_desc}</p>
								<span class="ctg-name">${list.ctg_name}</span>
								<div class="like-box">
									<figure>
										<img src="${pageContext.request.contextPath}/images/heart_icon.svg" alt="하트 아이콘" />
									</figure>
									<span class="like-count">${list.rest_like_cnt}</span>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</section>
		<section class="section-yeeun sec5">
			<h2>
				<strong>가보고싶어요!</strong> 전국 TOP 6 맛봄
			</h2>
			<ul class="main-rest-list1">
				<c:forEach var="list" items="${likeList}">
					<li class="rest-small-card"><a href="detail.ye?rest_no=${list.rest_no}" title="식당명 상세페이지 이동">
								<div>
									<figure class="rest-img-box">
										<img src="${pageContext.request.contextPath}/images/dummy_rest_img.png" alt="" />
									</figure>
									<p class="review-box">
										<img src="${pageContext.request.contextPath}/images/star_icon.svg" alt="별 아이콘" /> <span>${list.review_avg}
											(${list.review_cnt})</span>
									</p>
									<p class="rest-name">${list.rest_name}</p>
									<p class="rest-desc">${list.rest_desc}</p>
									<span class="ctg-name">${list.ctg_name}</span>
									<div class="like-box">
										<figure>
											<img src="${pageContext.request.contextPath}/images/heart_icon.svg" alt="하트 아이콘" />
										</figure>
										<span class="like-count">${list.rest_like_cnt}</span>
									</div>
								</div>
						</a></li>
				</c:forEach>
			</ul>
		</section>
		<!--footer start-->
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>
