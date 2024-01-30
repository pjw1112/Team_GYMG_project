<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>
<!-- header -->
<!-- header -->
<!-- header -->


<style>
* {
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
	color: currentColor;
}

a:link, a:visited, a:hover, a:focus {
	text-decoration: none;
	color: currentColor;
}

body {
	font-family: "Malgun Gothic", dotum, sans-serif;
}

li {
	list-style-type: none;
}

.join_container {
	/* border: 1px solid red; */
	width: 100%;
	height: 1800px;
	/*padding: 100px 0;*/
}

.login_box {
	width: 900px;
	height: 1182px;
	/*border: 4px solid #DDDDDD;*/
	border-radius: 40px;
	margin: 0 auto;
	margin-top: 50px;
	box-sizing: border-box;
	padding: 80px 0;
}

.inner_container {
	width: 100%;
	margin: 0 auto;
	position : relative;
}

.row_box {
	/* border: 1px solid black; */
	height: 40px;
	text-align: center;
}

.row1 {
	color: #FD9B36;
	font-size: 34px;
	font-weight: bold;
}

.main_form {
	/*border: 1px solid black;*/
	width: 720px;
	height: 450px;
	margin: 35px auto;
	display: grid;
	grid-template-columns: 1fr 2fr 1fr;
	grid-gap: 20px;
}

.item {
	/*border: 1px solid blue;*/
	height: 50px;
}

label {
	font-size: 18px;
	color: #FD9B36;
	line-height: 45px;
}

.btn {
	width: 147px;
	height: 45px;
	font-size: 18px;
	color: white;
	background-color: #FD9B36;
}

.btn-block {
	width: 100%;
}

.middle_input {
	width: 338px;
	height: 45px;
}

.readonly {
	background-color: #E7E7E7;
}

.readonly:focus {
	background-color: #E7E7E7;
}

input {
	height: 45px;
}

.pass_intro {
	width: 600px;
	margin: 80px auto;
	margin-bottom: 50px;
	/*border : 1px solid red;*/
	font-size: 21px;
	color: #FD9B36;
	line-height: 40px;
	font-size: 21px
}

.column1 {
	text-align: right;
}

.main_form2 {
	/*border: 1px solid red;*/
	height: 100px;
}

.btn-cancel {
	width: 162px;
	height: 51px;
	line-height: 39px;
	background-color: #D9D9D9;
	border: none;
	float: left;
	margin-left: 265px;
}

.btn-save {
	width: 162px;
	height: 51px;
	background-color: #FD5A36;
	border: none;
	float: left;
	margin-left: 50px;
}

hr {
	border: none; /* 기본 선 제거 */
	border-top: 2px solid #BBBBBB; /* 원하는 선 색 및 두께 지정 */
}

.tab {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
}

.tab:after {
	clear: both;
}

.tab_item {
	line-height: 55px;
	background-color: #FFF5EB;
	color: #FD9B36;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
}

.tab_1 {
	background-color: #FD9B36;
	color: white;
}

.tab_2 {
	
}

.tab_3 {
	
}

.profile {
	width: 720px;
	height: 265px;
	/*border: 1px solid black;*/
	margin: 100px auto;
	display: grid;
	grid-template-columns: 1fr 5fr;
}

.profile_sec1 {
	/*border: 1px solid blue;*/
	
}

.profile_sec2 {
	/*border: 1px solid blue;*/
	
}

.profile_img {
	width: 80px;
	margin: 0 auto;
	position: relative;
}

.img_upload_wrapper {
	display: none;
	position: absolute;
	padding : 20px;
	width: 350px;
	height: 420px;
	border: 3px solid #FD9B36;
	color : #FD9B36;
	left: -285px;
	top: 70px;
	border-radius: 15px;
	z-index: 100;
}
.img_upload_wrapper .tri1 {
	z-index: 101;
	position: absolute;
	top: 105px;
	right: -28px;
	width: 35px;
	transform: rotate(270deg);
}

.img_upload_wrapper .tri2 {
	z-index: 99;
	position: absolute;
	top: 105px;
	right: -34px;
	width: 35px;
	transform: rotate(270deg);
}
#img {
	max-width: 100%;  /* 부모 요소의 너비를 초과하지 않음 */
  max-height: 100%; /* 부모 요소의 높이를 초과하지 않음 */
  height: auto;     /* 원래 비율 유지 */
  width: auto;      /* 원래 비율 유지 */
}
.img_wrap{
	background-color: #eeeeee;
	border-radius: 15px;
	display: flex;
    align-items: center; /* 세로 방향에서 중앙 정렬 */
    justify-content: center; /* 선택적으로 가로 방향에서도 중앙 정렬 */
    height : 230px;
}
#file{
 color : #aaaaaa;
}
.img_submit{
	background-color: #FD9B36;
	color : white;
	border : none;
}
.img_row2{
margin : 10px 0;
}
.img_row3{
margin-bottom : 10px;
}

.profile_row2, .profile_row4 {
	color: #909090;
	font-size: 14px;
}

.profile_row2 {
	margin-top: 3px;
	margin-bottom: 35px;
}

.profile_row4 {
	margin-top: 3px;
}

.no-resize {
	resize: none;
	height: 125px;
}

.readonly,
#profile_img_button {
	cursor: pointer;
}
#profile_img_button{
border : 1px solid #dddddd;
border-radius : 20px;
max-width: 100%;  /* 부모 요소의 너비를 초과하지 않음 */
  max-height: 100%; /* 부모 요소의 높이를 초과하지 않음 */
  height: auto;     /* 원래 비율 유지 */
  width: auto;      /* 원래 비율 유지 */
}
/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */
.check_message1 {
	margin-top : 3px;
	font-size: 16px;
	/*border : 1px solid red;*/
	
	text-align: right;
	
	position: relative;
}
.check_message1 p{
	line-height: 22px;
}
.check_success1 {
	position: absolute;
	color: rgb(56, 255, 56);
	top: -53px;
	right: 12px;
	font-size: 25px;
}

.check_ing1 {
	position: absolute;
	color: #A7C5FF;
	top: -53px;
	right: 12px;
	font-size: 25px;
	
}

.check_fail1 {
	position: absolute;
	color: rgb(252, 87, 16);
	top: -53px;
	right: 12px;
	font-size: 25px;
}

.ing {
	color: #A7C5FF;
	margin-bottom: 0;
}

.success {
	color: rgb(56, 255, 56);
	margin-bottom: 0;
}

.fail {
	color: rgb(252, 87, 16);
	margin-bottom: 0;
}
.header_column1 a {
    color: #fd9b36;
}
.user_nick_length_check,
.user_intro_length_check{
	float : right;
	
}
.label_check{
position: relative;
}


/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */
.check_message {
	margin-top : 5px;
	font-size: 16px;
	/*border : 1px solid red;*/
	width: 100%;
	text-align: right;
	line-height: 18px;
	position: relative;
}
.check_message p{
	line-height: 22px;
}
.check_success {
	position: absolute;
	color: rgb(56, 255, 56);
	top: -39px;
	right: 12px;
	font-size: 25px;
}

.check_ing {
	position: absolute;
	color: #A7C5FF;
	top: -39px;
	right: 12px;
	font-size: 25px;
	
}

.check_fail {
	position: absolute;
	color: rgb(252, 87, 16);
	top: -39px;
	right: 12px;
	font-size: 25px;
}
/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */
/* 회원가입form 유효성 검사 관련 CSS */

.column3_sms, .column3_location {
	position: relative;
}

/* sms 인증 메시지 창 관련 CSS */
/* sms 인증 메시지 창 관련 CSS */
/* sms 인증 메시지 창 관련 CSS */
.sms_check_wrapper {
	display: none;
}

.sms_check_wrapper .tri1 {
	z-index: 101;
	position: absolute;
	top: -65px;
	left: 70px;
}

.sms_check_wrapper .tri2 {
	z-index: 99;
	position: absolute;
	top: -70px;
	left: 64px;
}

.sms_check_window {
	z-index: 100;
	position: absolute;
	width: 400px;
	height: 200px;
	border: 3px solid #FD9B36;
	box-sizing: border-box;
	padding: 15px;
	padding-top : 25px;
	border-radius: 15px;
	top: -230px;
	left: 10px;
	background-color: white;
	border-radius: 15px;
}

.sms_redirect {
	width: 100%;
	height: 100%;
	/*border: 1px solid black;*/
	text-align: center;
}

.sms_row1 {
	color: #FD9B36;
	font-size: 15px;
}

.sms_row2 {
	/*border : 1px solid blue;*/
	width: 200px;
	margin: 30px auto;
	margin-bottom: 30px;
	margin-left: 133px;
}

#sms_4number {
	width: 100px;
	height: 30px;
}

.btn_sms4 {
	width: 120px;
	height: 35px;
	font-size: 16px;
}

.timerDisplay {
	/*border : 1px solid blue;*/
	position: absolute;
	color: gray;
	top: 77px;
	right: 85px;
}

.timerDisplay img {
	position: absolute;
	top: -10px;
	right: 3px;
	width: 40px;
}
/* sms 인증 메시지 창 관련 CSS */
/* sms 인증 메시지 창 관련 CSS */
/* sms 인증 메시지 창 관련 CSS */

/* location 선택 창 관련 CSS */
/* location 선택 창 관련 CSS */
/* location 선택 창 관련 CSS */
.location_check_wrapper {
	
}

.location_check_wrapper .tri1 {
	z-index: 101;
	position: absolute;
	top: 61px;
	left: 67px;
	width: 30px;
	transform: rotate(180deg);
}

.location_check_wrapper .tri2 {
	z-index: 99;
	position: absolute;
	top: 55px;
	left: 67px;
	width: 30px;
	transform: rotate(180deg);
}

.location_check_window {
	z-index: 100;
	position: absolute;
	width: 400px;
	border: 3px solid #FD9B36;
	box-sizing: border-box;
	padding: 15px;
	border-radius: 15px;
	top: 80px;
	left: 10px;
	background-color: white;
	
}

.location_row1 {
	text-align: center;
	color: #FD9B36;
	font-size: 16px;
	margin-bottom: 15px;
}

.location_row2 {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(80px, 1fr));
	gap: 6px;
}

.location_item {
	font-size: 14px;
	color: white;
	text-align: center;
	border-radius: 8px;
	background-color: #FD9B36;
	cursor: pointer;
	line-height: 23px;
}

.location_item:hover {
	opacity: 0.7;
}

.location_item_selected {
	opacity: 0.3;
}

.location_item_selected:hover {
	opacity: 0.3;
}

.displayNone {
	display: none;
}
/* location 선택 창 관련 CSS */
/* location 선택 창 관련 CSS */
/* location 선택 창 관련 CSS */


</style>
<div class="ye-container">
	<div class="join_container">

		<div class="login_box">
			<div class="inner_container">
				<div class="img_upload_wrapper">
					<form action="upload.jin?user_no=${login_user_dto.user_no}" method="post" id="img_upload_form" enctype="multipart/form-data">
						<div class="img_row1">프로필 이미지 올리기</div>
						<div class="img_row2">
							<div class="img_wrap">
								<img id="img" />
							</div>
						</div>
						<div class="img_row3">
							<input type="file" name="file" id="file" class="form-control">
							</div>
								<div class="img_row4">
									<input type="submit" class="form-control submit img_submit" value="업로드"
										title="업로드" class="form-control">
								</div>
					</form>
					<img class="tri1"
								src="${pageContext.request.contextPath}/images/tri1.svg">
							<img class="tri2"
								src="${pageContext.request.contextPath}/images/tri2.svg">
				</div>


				<div class="tab">
					<!-- 
				<div class="tab_item tab_1"><a href="GoToMic_tab1Page.jin">회원정보 변경</a></div>
				<div class="tab_item tab_2"><a href="GoToMic_tab2Page.jin">비밀번호 변경</a></div>
				<div class="tab_item tab_3"><a href="GoToMic_tab3Page.jin">회원 탈퇴</a></div>
			 -->
					<a href="GoToMic_tab1Page.jin"><div class="tab_item tab_1">회원정보
							변경</div></a> <a href="GoToMic_tab2Page.jin"><div class="tab_item tab_2">비밀번호
							변경</div></a> <a href="GoToMic_tab3Page.jin"><div class="tab_item tab_3">회원
							탈퇴</div></a>


				</div>


				<form action="user_update.jin" id="user_update_form" method="post">
					<div class="profile">
						<div class="profile_sec1">
							<div class="profile_img">
								<img src="${pageContext.request.contextPath}/images/no_profile.svg" id="profile_img_button">

							</div>
						</div>
						<div class="profile_sec2">
							<div class="profile_row profile_row1">
								<input type="hidden" name="user_no" id="user_no" value="${login_user_dto.user_no }">
								<input type="text" class="form-control" name="user_nick" id="user_nick" value="${login_user_dto.user_nick }">
							</div>
							
							<div class="profile_row profile_row2">
							2~15자 이내, 공백 불가능, 한글 가능
							<div class="user_nick_length_check check_message1"></div>
							<div class="nick_form_label_Check label_check"></div>
							</div>
							
							<div class="profile_row profile_row3">
								<textarea class="form-control no-resize" name="user_intro" id="user_intro" >${login_user_dto.user_intro }</textarea>
							</div>
							
							<div class="profile_row profile_row4">
							100자 이내 입력 가능
							<div class="user_intro_length_check check_message1"></div>
							<div class="intro_form_label_Check label_check"></div>
							</div>

						</div>
					</div>

					<hr>
					<br>
					<div class="main_form">

						<div class="item column1">
							<label for="user_id" class="form-label">아이디(이메일)</label>
						</div>
						<div class="item column2 id_check">
							<input type="email" id="user_id" name="user_id"
								class="form-control" value="${login_user_dto.user_id }">
							<label for="user_id" class="check_message"></label>	
						</div>
						<div class="item column3">
							<button type="button" class="btn btn-warning id_check_btn">중복확인</button>
						</div>
						<!-- #################################################### -->

						<div class="item column1">
							<label for="user_phone" class="form-label">휴대폰 번호</label>
						</div>
						<div class="item column2 phone_check">
							<input type="tel" id="user_phone" name="user_phone"
								class="form-control"
								value="${login_user_dto.user_phone }" ><label
							for="user_phone" class="check_message"></label>
						</div>
						<div class="item column3 column3_sms">
						<div class="sms_check_wrapper">
							<div class="sms_check_window">
								<div class="sms_redirect">
									<div class="sms_row1">메시지 보내는 중...</div>
									<div class="sms_row2">
										<input type="tel" id="sms_4number" name="sms_4number"
											class="form-control">
										<p class="timerDisplay">
											<img
												src="${pageContext.request.contextPath}/images/Spinner.svg">
										</p>
									</div>
									<div class="sms_row3">
										<button type="button" class="btn btn-warning btn_sms4">인증 확인</button>
									</div>
								</div>

							</div>
							<img class="tri1"
								src="${pageContext.request.contextPath}/images/tri1.svg">
							<img class="tri2"
								src="${pageContext.request.contextPath}/images/tri2.svg">

						</div>
							<button type="button" class="btn btn-warning phone_check_button">전화번호
								변경</button>
						</div>
						<!-- #################################################### -->

						<div class="item column1">
							<label for="user_name" class="form-label">이름</label>
						</div>
						<div class="item column2 name_check">
							<input type="text" id="user_name" name="user_name"
								class="form-control middle_input"
								value="${login_user_dto.user_name}">
								<label for="user_name" class="check_message"></label>
						</div>
						<div class="item column3"></div>
						<!-- #################################################### -->

						<div class="item column1">
							<label for="user_phone" class="form-label">관심장소</label>
						</div>
						<div class="item column2 location_check">
							<input type="text" id="user_location" name="user_location"
								class="form-control middle_input" readonly="readonly"
								placeholder="관심장소 추가 버튼을 이용해주세요"> <label
							for="user_location" class="check_message"></label>
						</div>
						<div class="item column3 column3_location">
						<div class="location_check_wrapper displayNone">
							<img class="tri1"
								src="${pageContext.request.contextPath}/images/tri1.svg">
							<img class="tri2"
								src="${pageContext.request.contextPath}/images/tri2.svg">
							<div class="location_check_window">
								<div class="location_row1">관심장소를 추가해주세요 (토글, 최대3개)</div>
								<div class="location_row2"></div>
								<div class="location_row3"></div>

							</div>

						</div>
						
						
							<button type="button" class="btn btn-warning location_check_button">관심장소
								추가</button>
						</div>
						<!-- #################################################### -->

					</div>
					<hr>
					<div class="pass_intro">
						변경 사항을 저장하려면 비밀번호를 입력 후 저장버튼을 눌러 주세요. <br> 저장하지 않은 모든 변경 사항은
						적용되지 않습니다.
					</div>
					<div class="main_form main_form2">

						<div class="item column1">
							<label for="user_pw" class="form-label">비밀번호</label>
						</div>
						<div class="item column2">
							<input type="password" id="user_pw" name="user_pw"
								class="form-control middle_input">
						</div>
						<div class="item column3"></div>
						<!-- #################################################### -->

					</div>
					<hr>
					<br> <br>

					<div class="reset">
						<a href="" class="btn btn-secondary btn-cancel">취소</a>
					</div>
					<div class="submit">
						<input type="submit" class="btn btn-danger btn-save" value="저장">
					</div>
					<div class="item column3"></div>
					<!-- #################################################### -->




				</form>




			</div>
		</div>
	</div>
</div>
<script>
//유효성 검사 스크립트

let user_nick_ok=true;
let user_intro_ok=true;

let id_ok = true;
let id_verify_ok = true;
let name_ok = true;
let phone_ok = true;
let phone_verify_ok = true;


let nick_form_label_Check = document.querySelector(".nick_form_label_Check");
let intro_form_label_Check = document.querySelector(".intro_form_label_Check");

let email_form = document.querySelector("#user_id");
let name_form = document.querySelector("#user_name");
let pass_form = document.querySelector("#user_pw");
let phone_form = document.querySelector("#user_phone");
let sms_4number = document.querySelector("#sms_4number");
let location_form = document.querySelector("#user_location");

let id_check_btn = document.querySelector(".id_check_btn");

let pcb = document.querySelector(".phone_check_button");
let scw = document.querySelector(".sms_check_wrapper");
let timerDisplay = document.querySelector(".timerDisplay");
let sms_row1 = document.querySelector(".sms_row1");
let btn_sms4 = document.querySelector(".btn_sms4");

let lcw = document.querySelector(".location_check_wrapper");
let lcb = document.querySelector(".location_check_button");

let email_form_label_Check = document.querySelector(".id_check .check_message");
let name_form_label_Check = document.querySelector(".name_check .check_message");
let phone_form_label_Check = document.querySelector(".phone_check .check_message");
let location_form_label_Check = document.querySelector(".location_check .check_message");





//nick check
//nick check
//nick check
$(".user_nick_length_check").html("( "+$("#user_nick").val().length+" / 15 )");
if( 2 <= $("#user_nick").val().length &&  $("#user_nick").val().length <= 15){
	$(".user_nick_length_check").addClass("success");
	$(".user_nick_length_check").removeClass("fail");
	
	nick_form_label_Check.innerHTML = "";
	let fail = document.createElement("div");
    fail.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
    fail.classList.add("check_success1");
    nick_form_label_Check.appendChild(fail);
	
	user_nick_ok=true;
	}else{
	$(".user_nick_length_check").addClass("fail");
	$(".user_nick_length_check").removeClass("success");
	
	nick_form_label_Check.innerHTML = "";
	let fail = document.createElement("div");
    fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
    fail.classList.add("check_fail1");
    nick_form_label_Check.appendChild(fail);
	
	user_nick_ok=false;
}
$("#user_nick").on("input", () => {
	
	$(".user_nick_length_check").html("( "+$("#user_nick").val().length+" / 15 )");
	
	if( 2 <= $("#user_nick").val().length &&  $("#user_nick").val().length <= 15){
		$(".user_nick_length_check").addClass("success");
		$(".user_nick_length_check").removeClass("fail");
		
		nick_form_label_Check.innerHTML = "";
		let fail = document.createElement("div");
	    fail.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
	    fail.classList.add("check_success1");
	    nick_form_label_Check.appendChild(fail);
		
		
		user_nick_ok=true;
		}else{
			
		$(".user_nick_length_check").addClass("fail");
		$(".user_nick_length_check").removeClass("success");
		
		nick_form_label_Check.innerHTML = "";
		let fail = document.createElement("div");
	    fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
	    fail.classList.add("check_fail1");
	    nick_form_label_Check.appendChild(fail);
		
		
		user_nick_ok=false;
	}
	
});
//nick check
//nick check
//nick check





//intro check
//intro check
//intro check
$(".user_intro_length_check").html("( "+$("#user_intro").val().length+" / 15 )");
if( $("#user_intro").val().length <= 100){
	$(".user_intro_length_check").addClass("success");
	$(".user_intro_length_check").removeClass("fail");
	
	intro_form_label_Check.innerHTML = "";
	let fail = document.createElement("div");
    fail.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
    fail.classList.add("check_success1");
    intro_form_label_Check.appendChild(fail);
	
	user_intro_ok=true;
	}else{
	$(".user_intro_length_check").addClass("fail");
	$(".user_intro_length_check").removeClass("success");
	
	intro_form_label_Check.innerHTML = "";
	let fail = document.createElement("div");
    fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
    fail.classList.add("check_fail1");
    intro_form_label_Check.appendChild(fail);
	
	user_intro_ok=false;
}
$("#user_intro").on("input", () => {
	$(".user_intro_length_check").html("( "+$("#user_intro").val().length+" / 100 )");
	if( $("#user_intro").val().length <= 100){
		$(".user_intro_length_check").addClass("success");
		$(".user_intro_length_check").removeClass("fail");
		
		intro_form_label_Check.innerHTML = "";
		let fail = document.createElement("div");
	    fail.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
	    fail.classList.add("check_success1");
	    intro_form_label_Check.appendChild(fail);
		
		user_intro_ok=true;
		}else{
		$(".user_intro_length_check").addClass("fail");
		$(".user_intro_length_check").removeClass("success");
		
		intro_form_label_Check.innerHTML = "";
		let fail = document.createElement("div");
	    fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
	    fail.classList.add("check_fail1");
	    intro_form_label_Check.appendChild(fail);
		
		user_intro_ok=false;
	}
	
	
});
//intro check
//intro check
//intro check



//1. 아이디(email) 조건 확인
email_form.addEventListener("input", () =>{

    let email = email_form.value;
    let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
    if (email_form.value.length != 0) {
        if (emailRegex.test(email)) {
          email_form_label_Check.innerHTML = "";
          let p = document.createElement("p");
          p.innerHTML = "이메일 형식 충족, 중복확인 진행해주세요";
          p.classList.add("ing");
          email_form_label_Check.appendChild(p);
    
          let success = document.createElement("div");
          success.innerHTML = "<i class='fa-regular fa-circle-right'></i>";
          success.classList.add("check_ing");
          email_form_label_Check.appendChild(success);

          id_ok = true;
          id_verify_ok = false;

        } else {
          email_form_label_Check.innerHTML = "";
          let p = document.createElement("p");
          p.innerHTML = "이메일 형식으로 입력해주세요";
          p.classList.add("fail");
          email_form_label_Check.appendChild(p);
    
          let fail = document.createElement("div");
          fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
          fail.classList.add("check_fail");
          email_form_label_Check.appendChild(fail);

          id_ok = false;
          id_verify_ok = false;
        }
      } else {
        email_form_label_Check.innerHTML = "";
        id_ok = false;
        id_verify_ok = false;
      }

});


//1-1 아이디 중복 검사
id_check_btn.addEventListener("click",function(){
	if(id_ok){
		
		 $.ajax({
				url : "IDduplicateCheck.jin",
				type : "POST",
				dataType : "text",
				data : {
					inputID : email_form.value
				},
				error : function(xhr, status, msg) {
					alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
				},
				success : function(data){
					
					console.log(data);
					console.log(typeof(data));
					
					if(data=="0"){
						  email_form_label_Check.innerHTML = "";
				          let p = document.createElement("p");
				          p.innerHTML = "아이디 조건 충족";
				          p.classList.add("success");
				          email_form_label_Check.appendChild(p);
				    
				          let success = document.createElement("div");
				          success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
				          success.classList.add("check_success");
				          email_form_label_Check.appendChild(success);
				          
				          id_verify_ok = true;
						
					}else{
												
						  email_form_label_Check.innerHTML = "";
				          let p = document.createElement("p");
				          p.innerHTML = "이메일 중복! 다른 아이디를 입력해주세요";
				          p.classList.add("fail");
				          email_form_label_Check.appendChild(p);
				    
				          let fail = document.createElement("div");
				          fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
				          fail.classList.add("check_fail");
				          email_form_label_Check.appendChild(fail);

				          id_verify_ok = false;
						
						
					}
				}
			});
		
		
		
		
	}else{
		email_form_label_Check.innerHTML = "";
        let p = document.createElement("p");
        p.innerHTML = "이메일 형식을 만족한뒤 중복확인해주세요";
        p.classList.add("fail");
        email_form_label_Check.appendChild(p);
  
        let fail = document.createElement("div");
        fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
        fail.classList.add("check_fail");
        email_form_label_Check.appendChild(fail);

	}
});

email_form_label_Check.innerHTML = "";
p = document.createElement("p");
p.innerHTML = "&nbsp&nbsp&nbsp&nbsp&nbsp ";
p.classList.add("success");
email_form_label_Check.appendChild(p);

success = document.createElement("div");
success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
success.classList.add("check_success");
email_form_label_Check.appendChild(success);
id_ok = true;
id_verify_ok = true;



//2. 이름 조건 확인
let namePattern = /^[A-Za-z가-힣ㄱ-ㅎ]+$/;
name_form.addEventListener("input", () => {
	  if (name_form.value.length != 0) {
	    if (2 <= name_form.value.length && name_form.value.length <= 10) {
	    	if (namePattern.test(name_form.value)) {
	      name_form_label_Check.innerHTML = "";
	      let p = document.createElement("p");
	      p.innerHTML = "이름 조건 충족";
	      p.classList.add("success");
	      name_form_label_Check.appendChild(p);

	      let success = document.createElement("div");
	      success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
	      success.classList.add("check_success");
	      name_form_label_Check.appendChild(success);
			name_ok = true;
	    	}else{
	    	  name_form_label_Check.innerHTML = "";
	  	      let p = document.createElement("p");
	  	      p.innerHTML = "이름은 한글,영문만 가능합니다.";
	  	      p.classList.add("fail");
	  	      name_form_label_Check.appendChild(p);

	  	      let fail = document.createElement("div");
	  	      fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
	  	      fail.classList.add("check_fail");
	  	      name_form_label_Check.appendChild(fail);

	  	      name_ok = false;
	  	    
	    	}
			
	    } else {
	      name_form_label_Check.innerHTML = "";
	      let p = document.createElement("p");
	      p.innerHTML = "이름은 2자이상 10자이하";
	      p.classList.add("fail");
	      name_form_label_Check.appendChild(p);

	      let fail = document.createElement("div");
	      fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
	      fail.classList.add("check_fail");
	      name_form_label_Check.appendChild(fail);

	      name_ok = false;
	    }
	  } else {
	    name_form_label_Check.innerHTML = "";
	    name_ok = false;
	  }
	});

name_form_label_Check.innerHTML = "";
p = document.createElement("p");
p.innerHTML = "&nbsp&nbsp&nbsp&nbsp&nbsp";
p.classList.add("success");
name_form_label_Check.appendChild(p);

success = document.createElement("div");
success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
success.classList.add("check_success");
name_form_label_Check.appendChild(success);


//6. 폰넘버형식 조건 확인
let phoneNumberRegex = /^010\d{8}$/;
phone_form.addEventListener("input", () =>{
	if (phone_form.value.length != 0) {
      if (phoneNumberRegex.test(phone_form.value)) {
        phone_form_label_Check.innerHTML = "";
        let p = document.createElement("p");
        p.innerHTML = "핸드폰 형식 만족! 휴대폰 인증을 진행해주세요";
        p.classList.add("ing");
        phone_form_label_Check.appendChild(p);
  
        let success = document.createElement("div");
        success.innerHTML = "<i class='fa-regular fa-circle-right'></i>";
        success.classList.add("check_ing");
        phone_form_label_Check.appendChild(success);

        phone_ok = true;

      } else {
        phone_form_label_Check.innerHTML = "";
        let p = document.createElement("p");
        p.innerHTML = "핸드폰 번호 11자리 필요(- 하이픈 제외)";
        p.classList.add("fail");
        phone_form_label_Check.appendChild(p);
  
        let fail = document.createElement("div");
        fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
        fail.classList.add("check_fail");
        phone_form_label_Check.appendChild(fail);

        phone_ok = false;
        
      }
    } else {
      phone_form_label_Check.innerHTML = "";
      phone_ok = false;
    }
	phone_verify_ok = false;
});

//7. 휴대폰 인증 문자 보내기
let phone_4number_verify_timer;
pcb.addEventListener("click", () => {
	
 if(phone_ok){
	   
	   scw.style.display = "initial";
	   
	   $.ajax({
			url : "sendsmsverify.jin",
			type : "POST",
			dataType : "text",
			data : {
				verify_nubmer : phone_form.value
			},
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
			},
			success : function(data){
				if(data=="2000"){
					
					setTimeout(() => {
						sms_row1.innerHTML ="휴대폰으로 전송된 4자리 인증번호를 확인해주세요";
					}, 1000);
					let timeLeft = 300; // 초 단위로 5분 설정 (5 * 60)
					 
				       phone_4number_verify_timer = setInterval(function () {
				           if (timeLeft <= 0) {
				               clearInterval(timerInterval);
				               
				               phone_form.value ="";
				               timerDisplay.innerHTML ="";
				               scw.style.display = none;
				               
				               alert("휴대폰 인증 유효기간(5분)이 지났습니다. 다시 시도해주세요.");
				           } else {
				        	   
				               let minutes = Math.floor(timeLeft / 60);
				               let seconds = timeLeft % 60;
				               
				               let text="0"+minutes+":";
				               
				               if(seconds < 10){ text+="0"+seconds}else{text+=seconds};
				               console.log(timeLeft);
				               console.log(text);
				               timerDisplay.innerHTML = text;
				               timeLeft--;
				           }
				       }, 1000);
				}
			}
		});
	   
	   
	   
 }else{
		phone_form_label_Check.innerHTML = "";
      let p = document.createElement("p");
      p.innerHTML = "핸드폰 번호 형식을 갖춘 후 인증해주세요";
      p.classList.add("fail");
      phone_form_label_Check.appendChild(p);
      
      let fail = document.createElement("div");
      fail.innerHTML = "<i class='fa-regular fa-circle-xmark'></i>";
      fail.classList.add("check_fail");
      phone_form_label_Check.appendChild(fail);
      
      
}
});



//receivesmsverify.jin
//8. 휴대폰 인증 문자 일치 확인하기
btn_sms4.addEventListener("click", () => {

	if(sms_4number.value.length ==4){
		console.log("4넘버 일치체크");
		
		$.ajax({
			url : "receivesmsverify.jin",
			type : "POST",
			dataType : "text",
			data : {
				input4number : sms_4number.value
			},
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
			},
			success : function(data){
				
				console.log(data);
				if(data=="2000"){
				
				
					clearInterval(phone_4number_verify_timer);
					console.log("문자인증 과정 최종 통과!!");
					scw.style.display = "none";
					phone_verify_ok = true;
					
					phone_form_label_Check.innerHTML="";
					let p = document.createElement("p");
			        p.innerHTML = "휴대폰 본인 인증 완료!";
			        p.classList.add("success");
			        phone_form_label_Check.appendChild(p);
					
					let success = document.createElement("div");
			        success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
			        success.classList.add("check_success");
			        phone_form_label_Check.appendChild(success);
			        
				
				
				}else{
					phone_verify_ok = false;
					sms_row1.innerHTML ="인증번호가 일치하지 않습니다. 다시 확인해주세요";
				}
				
				
			}
		});
		
			       
	}
});

phone_form_label_Check.innerHTML="";
p = document.createElement("p");
p.innerHTML = "&nbsp&nbsp&nbsp&nbsp&nbsp";
p.classList.add("success");
phone_form_label_Check.appendChild(p);

success = document.createElement("div");
success.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
success.classList.add("check_success");
phone_form_label_Check.appendChild(success);


//9. 관심장소 추가하기
//9-1. 관심장소 버튼 토글
lcb.addEventListener("click", () => {
	if (lcw.classList.contains("displayNone")) {
		lcw.classList.remove("displayNone");
	}else{
		lcw.classList.add("displayNone");
	}
});

//9-2. 관심장소 리스트 아작스로 불러오기
let location_row2 = document.querySelector(".location_row2");
let selectedNum=0;
$.ajax({
			url : "locationListPull.jin",
			type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
			},
			success : function(json){
				/////////////////////////////////////
				json.data.forEach((item) => {
					let div = document.createElement("div");
			        div.innerHTML = item.location_name;
			        div.classList.add("location_item");
			        location_row2.appendChild(div);
			       
			        div.addEventListener("click",function(){
			        	if (div.classList.contains("location_item_selected")) {
			        		
			        		if(location_form.value.includes(div.innerHTML+", ")){
			        			 location_form.value=location_form.value.replace(div.innerHTML+", ","");
			        			  }else if(location_form.value.includes(", "+div.innerHTML)){
			        			 location_form.value=location_form.value.replace(", "+div.innerHTML,"");
			        			  }else{
			        				  location_form.value=location_form.value.replace(div.innerHTML,"");
			        			  }
			        		div.classList.remove("location_item_selected");
			        		 selectedNum--;
			        	  } else {
			        	   
			        		  if(selectedNum<3){
			        			  
			        			  if(selectedNum==0){
				        			  location_form.value=div.innerHTML;
			        			  }else if(selectedNum>=1){
				        			  location_form.value=location_form.value+", "+div.innerHTML;
			        			  }
			        			 div.classList.add("location_item_selected");
			        		  selectedNum++;
			        		  
			        		  }
			        	  }
			        	console.log(selectedNum);
			        	
			        });
			        
					});
				
				
				
				
				
				
				////////////////////////////////////////////
				$.ajax({
			url : "user_locationListPull.jin",
			type : "POST",
			dataType : "text",
			data : {
				"user_no" : ${login_user_dto.user_no}
			},
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
			},
			success : function(text){
				
				console.log(text);
				$("#user_location").val(text);
								
				 var parentElement = $(".location_row2");

			      // 자식 요소들을 순회하면서 innerHTML을 확인하고 특정 문자열이 포함되어 있는 경우 클래스를 추가합니다.
			      parentElement.children().each(function() {
			        var innerHTML = $(this).html();
			        var searchString = "특정 문자열"; // 포함 여부를 확인할 문자열

			        if (text.includes(innerHTML)) {
			          $(this).addClass("location_item_selected");
			          selectedNum++;
			        }
			      });
				
				
			}
		});
		////////////////////////////////////////		
				
				/////////////////////////////////////////	
			}
		});










//유효성 검사 스크립트
</script>


<script type="text/javascript">
//이미지 업로드 스크립트
	//이미지 미리보기
	var sel_file;

	$(document).ready(function() {
		$("#file").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

		filesArr.forEach(function(f) {
			if (!f.type.match(reg)) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	$("#profile_img_button").on("click", () => {
		$(".img_upload_wrapper").toggle();
		
	});
	
	$("#img_upload_form").on("submit", () => {
		$(".img_upload_wrapper").hide();
		
	});

	
	 $.ajax({
			url : "user_profile_img_check.jin",
			type : "POST",
			dataType : "text",
			data : {
				"user_no" : ${login_user_dto.user_no}
			},
			error : function(xhr, status, msg) {
				alert("오류가 발생했습니다. 관리자에게 문의해주세요.\n"+"status : "+status + "/n" +"msg : "+ msg);
			},
			success : function(data){
				
				console.log(data);
				console.log(typeof(data));
				
				if(data!="false"){
					
					$("#profile_img_button").attr("src", "${pageContext.request.contextPath}/resources/upload/"+data);
					
				}else{
					
				}
				
				
				
			}
		});
	
	
	
	 let user_update_form = document.getElementById("user_update_form");
	 user_update_form.addEventListener('submit', function(event) {
	 	
	 	
	 	if(!user_nick_ok ){
	 		alert("닉네임 입력을 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!user_intro_ok ){
	 		alert("자기소개를 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!id_ok ){
	 		alert("아이디(이메일) 입력을 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!id_verify_ok ){
	 		alert("아이디(이메일) 유효성 검사를 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!name_ok ){
	 		alert("이름 입력을 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!phone_ok  ){
	 		alert("핸드폰 입력을 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	if(!phone_verify_ok ){
	 		alert("핸드폰 인증을 확인해주세요.");
	 		event.preventDefault();
	 		return;
	 	}
	 	
	 	
	
	 });	
	
	
	
	
	
	
</script>

<script>
	//파일 업로드
	/*
	 function fn_submit(){
	
	 var form = new FormData();
	 form.append( "file1", $("#file1")[0].files[0] );
	
	 jQuery.ajax({
	 url : "upload.jin"
	 , type : "POST"
	 , processData : false
	 , contentType : false
	 , data : form
	 , success:function(response) {
	 alert("성공하였습니다.");
	 console.log(response);
	 }
	 ,error: function (jqXHR) 
	 { 
	 alert(jqXHR.responseText); 
	 }
	 });
	 }
	 */
</script>




<!-- footer -->
<!-- footer -->
<!-- footer -->
<%@ include file="../inc/footer.jsp"%>