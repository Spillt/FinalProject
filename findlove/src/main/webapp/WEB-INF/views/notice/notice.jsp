<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<style type="text/css">
#tableData{
	align: center;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {2z
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

</style>
<body>
	<c:import url="../../views/include/header.jsp" />
	<div class="container" style="margin-top: 150px;">
		<strong style="font-size: 25pt; color: white; text-shadow: 1px 1px 2px black, 0 0 25px #faadad, 0 0 5px #faadad;">공지사항</strong>
		<hr class="my-hr1">
		<table id="tableData" class="table table-bordered table-striped "
			width="90%" height="150px">
			<thead style="font-s ize: 20px">
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
	<%@ include file="../../views/include/footer.jsp"%>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
	<script src="js/jquery-3.1.1.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>