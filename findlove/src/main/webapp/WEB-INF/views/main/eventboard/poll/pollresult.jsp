<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>PollResult</title>
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/chart.css">
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

.detail {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
}

.detail ul {
	list-style: none;
}

.detail ul li {
	color: #808080;
	padding-bottom: 3px;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-color: white;
	display: inline-block;
	padding-right: 10px;
}

table, tr, td {
	border: 1px solid #bcbcbc;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: left;
}

tr:nth-child(2n), td:nth-child(2n) {
	background-color: #fff;
}

tr:nth-child(2n+1), th:nth-child(2n+1) {
	background-color: #faadad;
}
</style>
</head>
<body>

	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>




	<div class="event">
		<ul>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="attendancelist.do?userId=${sessionScope.user_id}">출석체크</a></li>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="percent.do?userId=${user_id}">나는 상위 몇 %?</a></li>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="polllist.do?userId=${user_id}">설문조사</a></li>
		</ul>
	</div>
	<div class="detail" style="width: 1100px; margin-left: 200px;">
		<table class="table table-striped text-center">
			<tr>
				<th>설문내용</th>
				<td>${poll.pollTitle}</td>
			</tr>
			<tr>
				<th>기간</th>
				<td>${poll.SDT}~${poll.EDT}</td>
			</tr>
			<tr>
				<th><br>답변</th>
				<td>
					</div>
					<div id="population_chart" data-sort="false" data-width="400px;"
						style="width: 600px; margin-left: 10px;" class="jChart chart-lg">
						<c:forEach var="sta" items="${statistics}">
							<c:choose>
								<c:when test="${sta.answer=='1'}">
									<div class="define-chart-row" data-color="#faadad"
										title="${poll.answer1}">${sta.cnt}</div>
								</c:when>
								<c:when test="${sta.answer=='2'}">
									<div class="define-chart-row" data-color="#f99191"
										title="${poll.answer2}">${sta.cnt}</div>
								</c:when>
								<c:when test="${sta.answer=='3'}">
									<div class="define-chart-row" data-color="#f87e7e"
										title="${poll.answer3}">${sta.cnt}</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>

		<ul>
			<li class="nav-item"><a class="btn btn-primary"
				href="polllist.do?userId=${user_id}">이전으로</a></li>
		</ul>




		<script type="text/javascript" src="/findlove/resources/js/jchart.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#mainNav').css('background-color', '#faadad');
				$("#population_chart").jChart({
					x_label : "Population"
				});
				$("#colors_chart").jChart();
			});
		</script>
</body>
</html>