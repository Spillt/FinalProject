<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::공지사항</title>
<!-- Page link -->
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- CSS 및 스타일 -->
<style type="text/css">
#tableData{
	align: center;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {
	color: black;
	text-decoration: none;
}
.number {
	width: 10%;
}
.title {
	width: 60%;
}
.date {
	widthd: 15%;
}
.count {
	width: 15%;
}
  .my-hr1 {
    border: 0;
    height: 3px;
    background: #ccc;
  }
.container.top {
	margin-top: 150px;
}

</style>
</head>

<body id="page-top">
	<!-- header -->
	<c:import url="../../include/header.jsp" />
	
	<!-- title -->
	<div class="container top">
		<div class ="row">
			<div class="col-lg-12 text-left">				
				<strong style="font-size: 25pt; color: #faadad;">공지사항</strong>				
			</div>
		</div>
	</div>
		
		<!-- Page Content -->	
		<div class="container">
		<table id="tableData" class="table table-bordered table-striped "
			width="90%" height="150px">
			<thead style="font-size: 15px">
				<tr align="center">
					<th class="number">번호</th>
					<th class="title">제목</th>
					<th class="date">작성일</th>
					<th class="count">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr style="font-size: 10pt;" align="center">
						<td>${row.noticeNo}</td>
						<td><a href="${path}detailnotice.do?noticeNo=${row.noticeNo}">${row.noticeTitle}</a></td>
						<td>${row.noticeDate}</td>
						<td>${row.noticeReadCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<!-- footer -->
	<hr>
	<c:import url="../../include/footer.jsp" />
	
	<!-- 자바스크립트 -->

	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/findlove/resources/js/paging.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
		$(document).ready(function() {
			$('#tableData').paging({
				limit : 8
			});
		});
	</script>
</body>
</html>