<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>1대1 문의</title>
<!-- Page link -->
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- CSS 및 스타일 -->
<style type="text/css">
#tableData {
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
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">1대1 문의</strong>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container" style="min-height: 600px;">

		<div class="row">
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group">
					<a href="myinfo.do?user_id=${sessionScope.user_id }"
						class="list-group-item">나의 정보</a> <a
						href="myprofile.do?user_id=${sessionScope.user_id }"
						class="list-group-item">나의 프로필</a> <a
						href="idealprofile.do?user_id=${sessionScope.user_id }"
						class="list-group-item">이상형 프로필</a> <a
						href="InqList.do?userId=${user_id }" class="list-group-item active">일대일
						문의</a> <a href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">



				<table id="tableData" class="table table-bordered table-striped "
					width="90%" height="150px">
					<thead style="font-size: 15px">
						<tr align="center">
							<th class="number">번호</th>
							<th class="title">제목</th>
							<th class="date">작성자</th>
							<th class="count">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0 }">
								<c:forEach var="row" items="${list}" varStatus="status">
									<tr style="font-size: 10pt;" align="center">
										<td>${status.count }</td>
										<td><a href="detailInq.do?inqNo=${row.inqNo }" id="Title"
											name="inqTitle">${row.inqTitle }</a></td>
										<td>${row.inqWriter }</td>
										<td><fmt:formatDate value="${row.inqDate }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<c:if test="${user_id != 'admin' }">
					<div class="row" style="margin: auto">
						<div class="col-12 float-right">
							<a href="openInqWrite.do?userId=${user_id }"
								class="btn float-right" id="write"
								style="margin-top: -29px;">문의하기</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
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