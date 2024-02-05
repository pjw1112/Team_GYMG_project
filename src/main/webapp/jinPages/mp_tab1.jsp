<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>

<style>
.admin-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 10px;
}

.admin-table tbody tr {
	height: 40px;
	text-align: center;
	background-color: rgba(253, 155, 54, 0.1);
}

.admin-table tr td {
	margin-top: 5px;
}

.admin-table tr td, .admin-table tr th {
	padding: 10px 10px;
}

.admin-table tr td:first-child, .admin-table tr th:first-child {
	border-radius: 30px 0 0 30px;
	/* padding: 20px 10px; */
}

.admin-table tr td:last-child, .admin-table tr th:last-child {
	border-radius: 0 30px 30px 0;
	padding: 10px 20px;
}

.admin-table thead th {
	font-weight: 600;
	background-color: #ffdfbe;
	font-size: 16px;
}

.admin-table tr td a:hover {
	color: #fd9b36;
	font-weight: 700;
	transition: 0.1s;
	cursor: pointer;
}

a.edit_btn {
	display: inline-block;
}

/* ------------------change------------ */
.admin-table tr th {
	text-align: center;
}

/* reset.css 일부*/
button {
	border: none;
	background-color: unset;
	cursor: pointer;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.bar1 {
	display: flex;
	margin-left: 30px;
	gap: 20px;
	font-size: 14px;
	padding-top: 100px;
	padding-bottom: 20px;
}

.navbar0-1 {
	margin-top: 15px;
}

.navbar1-2 {
	margin-top: 15px;
}

.navbar1-1 {
	margin-top: 15px;
}

.bar2 {
	display: flex;
	justify-content: space-evenly;
	font-size: 18px;
}

.bar3 {
	display: flex;
}

.navbar3-1 {
	padding-top: 10px margin-left: auto;
}

.hr {
	border: 1px solid #FD9B36;
}

.tr2 {
	text-align: right;
}

.checkbox-container {
	display: flex;
	justify-content: space-between; /* 요소들을 좌우로 간격을 두고 정렬합니다. */
	align-items: center; /* 요소들을 세로로 정렬합니다. */
	margin-bottom: 10px;
}

a {
	color: #858585; /* 링크의 기본 색상을 지정합니다. */
	text-decoration: none; /* 밑줄 제거 */
}

/* 링크에 호버(마우스를 올렸을 때) 시의 스타일 */
a:hover {
	color: #000000; /* 링크의 호버 시 색상을 지정합니다. */
}

.likeresmain {
	width: 1300px;
	margin-left: 250px;
}

.bar5 {
	display: flex;
	justify-content: space-between; /* 요소 간의 간격을 최대한 확보 */
	align-items: center;
}

.bar4 {
	padding-bottom: 10px;
}


</style>





<div class="likeresmain">

<div class="bar1">
    
    <div>
        <p class="navbar0-1"><img src="" ></p>
    </div>
    <div class="navbar1-1">
        <a href=""><strong style="font-weight:  bold;">피지환</strong>님</a>
    </div>
    <div class="navbar1-2 navbar1-1-2">
        <a href="">회원 정보 변경</a>
    </div>
    
</div>
<hr class="hr">

<div class="bar2">
  
    <a href="postwrite.jee">작성 게시글</a>
    
    <a href="writereply.jee">작성 댓글</a>
    
    <a href="writereview.jee">작성 리뷰</a>
    
    <a href="likeres.jee">좋아요 식당</a>
    
    <a href="likewrite.jee">좋아요 게시글</a>
    
</div>

<hr class="hr">

<div class="bar4">
  
      

</div>


   
<div class="bar3">
    <div style=" font-weight: bold;margin-top: 10px;">게시글 (10)</div>
    
    <div class="navbar3-1">
        <form action="#">
            <label for=""></label>
            <select name="" id="">
                <option>전체</option>
                <option>자유게시판</option>
                <option>맛집게시판</option>
            </select>
        </form>
    </div>
    
    <div class="navbar3-2">
        <form action="#">
            <label for=""></label>
            <select name="" id="">
                <option>최신순</option>
                <option>오래된순</option>
            </select>
        </form>
    </div> 
</div>



<table class="admin-table">
    <!-- <caption>
        작성게시글
    </caption> -->

<thead>
    <tr>
        <th scope="col">no</th>
        <th scope="col">게시글 제목</th>
        <th scope="col">조회수</th>
        <th scope="col">주천수</th>
        <th scope="col">작성일</th>
        <th scope="col"></th>
    </tr>
</thead>
<tbody class="board-table">
    <tr>
        <td scope="col"></td>
        <td scope="col"></td>
        <td scope="col"></td>
        <td scope="col"></td>
        <td scope="col"></td>
        <td scope="col">
            <a href="#" class="edit_btn"><img src="images/edit_icon.svg" alt="수정" /></a>
            <button class="rest-delete" onclick="deleteRest();">
                <img src="images/delete_icon.svg" alt="삭제" />
            </button>
        </td>
    </tr> 
    </tbody>
</table>
</div>

<script>
	$(function(){
		readAllBoardReply();

	function readAllBoardReply(){
		console.log('readAllBoardReply');
		$.ajax({
			url:"postwriteall.jee",
			type:"GET",
			dataType:"json",
			error:function(xhr, status, msg){
				alert(status + "/" + msg);
				
			},success:result
		})
	}
	function result(json){
		console.log('.......boardListResult');
		$(".board-table").empty();
		let total = json.result.length;
		$.each(json.result, function(idx, board_reply){
			$("<tr>")
			.append($("<td>").html(board_reply.board_no))
			.append($("<td>").html(board_reply.board_title))
			.append($("<td>").html(board_reply.board_hit))
			.append($("<td>").html(board_reply.board_time)
			.append($("<td>").html(board_reply.board_nick))
			.appendTo(".board-table");
		})
	}
	});
</script>




<%@ include file="../inc/footer.jsp" %>