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

body {
	background:
		url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
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
	width: 800px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: left;
}

tr:nth-child(2n), td:nth-child(2n) {
	background-color: #e3f2fd;
}

tr:nth-child(2n+1), td:nth-child(2n+1) {
	background-color: #bbdefb;
}
</style>
</head>
<body>

	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>




	<div class="event">
		<ul>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="attendancelist.do">출석체크</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="polllist.do">설문조사</a></li>
		</ul>
	</div>
	<div class="detail">
		<table>
			<tr>
				<td>설문내용</td>
				<td>${poll.pollTitle}</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>${poll.SDT}~${poll.EDT}</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					</div>
					<div id="population_chart" data-sort="false" data-width="400"
						class="jChart chart-lg">
						<c:forEach var="sta" items="${statistics}">
							<c:choose>
								<c:when test="${sta.answer=='1'}">
									<div class="define-chart-row" data-color="#008DD3" title="${poll.answer1}">${sta.cnt}</div>
								</c:when>
								<c:when test="${sta.answer=='2'}">
									<div class="define-chart-row" data-color="#0074AA" title="${poll.answer2}">${sta.cnt}</div>
								</c:when>
								<c:when test="${sta.answer=='3'}">
									<div class="define-chart-row" data-color="#005882" title="${poll.answer3}">${sta.cnt}</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>

		<ul>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
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