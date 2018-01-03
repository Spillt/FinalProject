<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>PollList</title>
<style>
header.subhead {
	height: 56px
}

@media ( min-width :992px) {
	header.subhead {
		height: 103px
	}
}



.event {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
}

.event ul {
	list-style: none;
}

.event ul li {
	color: #808080;
	padding-bottom: 3px;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-color: white;
	display: inline-block;
	padding-right: 10px;
}

.poll {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
}

th {
	background-color: #faadad;
}

td {
	background-color: white;
}
</style>
</head>
<body>
	설문조사
	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>



	<div class="event ">
		<ul>
			<li class="nav-item"><a class="btn btn-primary nav-link js-scroll-trigger"
				href="attendancelist.do?userId=${sessionScope.user_id}">출석체크</a></li>
			<li class="nav-item"><a class="btn btn-primary nav-link js-scroll-trigger"
				href="polllist.do?userId=${user_id}">설문조사</a></li>
		</ul>
	</div>
	<hr>
	<div class="poll" id="polltitle" style="width:1100px; margin-left:110px;">
		<table id="tableData" class="table table-bordered text-center">
			<thead>
				<tr>
					<th>설문내용</th>
					<th>기간</th>
					<th>설문시작</th>
					<th>결과보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.pollTitle}</td>
						<td>${list.SDT}~${list.EDT}</td>
						<c:set var="doneLoop" value="false" />
						<c:forEach var="mylist" items="${mylist}" varStatus="status">
							<c:if test="${not doneLoop}">
								<c:if test="${list.pollNo eq mylist.pollNo}">
									<td><a href="#" class="btn btn-secondary">설문완료</a></td>
									<c:set var="doneLoop" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${not doneLoop}">
							<td><a href="polldetail.do?pollNo=${list.pollNo }"
								class="btn btn-primary">시작하기</a></td>
						</c:if>
						<td><a href="pollresult.do?pollNo=${list.pollNo }"
							class="btn btn-primary">결과보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

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
				limit : 5
			});
		});
	</script>

</body>
</html>
