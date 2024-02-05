<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container panel panel-info">
		<h3 class="panel-heading">JSOUP</h3>
		<pre>
			1. 사이트명/robots.txt 허용되는 부분 확인
			2. https://mvnrepository.com/artifact/org.jsoup/jsoup
			3. 라이브러리 다운로드
			JSOUP Java HTML Parser >> 1.14.3
		</pre>
	</div>
	<div class="container panel panel-info">
		<h3 class="panel-heading">JSOUP1</h3>
		<div class="r1 well result"></div>
		<script>
		$(function(){
			
			$.ajax({
				url : "${pageContext.request.contextPath}/goCrawling",
				type : "get",
				dataType : "text",
				success : function(json	){
					$(".r1").html(json);
				}, error : function(xhr, textStatus, errorThrown){
					$(".r1").html(textStatus + "(HTTP-" + xhr.status + ")");
				}
			})
		})
		</script>
	</div>

</body>
</html>