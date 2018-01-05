<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시글 관리</title>

<style>
	
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="text-center" style="color:#faadad">
			<h3>신고된 게시판이 없습니다.</h3>
		</div>
	</div>
	<c:import url="../../include/footer.jsp" />
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		$('.card:last').addClass('selected');
	});
</script>
</body>
</html>