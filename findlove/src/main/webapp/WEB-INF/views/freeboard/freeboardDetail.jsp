<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeboardDetail</title>
<style type="text/css">

.row.panel-title {
	padding-top: 5px;
	border: 1px solid lightgray;
	text-align: left;
}

.row.panel-body {
	padding-top: 10px;
	border: 1px solid lightgray;
	border-top: 0;
}

.portfolio-caption span .material-icons.heart {
	color: #faadad
}

.portfolio-caption span .material-icons.star {
	color: #F7EC98
}

.pannel {
	margin-right: 10px;
}

.masthead {
	margin-top: 80px;
}
</style>
</head>
<body>
	<h2>자유게시판 상세보기</h2>
	<c:import url="../include/header.jsp" />
	
	<header class="masthead">
	</header>
	
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${Freeboard.freeNo }</td>
				<th scope="row">조회수</th>
				<td>${Freeboard.freeReadCnt }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${Freeboard.freeWriter }</td>
				<th scope="row">작성시간</th>
				<td>${Freeboard.freeDt }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${Freeboard.freeTitle }</td>
			</tr>
			<tr>
				<td colspan="4">${Freeboard.freeContent }</td>
			</tr>
		</tbody>
	</table>
	<a href="openFreeboardList.do" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="deleteFreeboard.do?freeNo=${Freeboard.freeNo }" class="btn" id="delete">삭제하기</a>
	
	<c:import url="../include/footer.jsp" />
	
	<script>
	$(function() {
        $('#mainNav').css('background-color', '#faadad');
     });
	</script>
</body>
</html>