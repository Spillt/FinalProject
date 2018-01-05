<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>PollDetail</title>
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
	border: 1px solid #000;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 10px;
	text-align: center;
}

tr:nth-child(2n), td:nth-child(2n) {
	background-color: #fff;
}

tr:nth-child(2n+1), th:nth-child(2n+1) {
	background-color: #faadad;
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
	<div class="poll" id="polltitle"
		style="width: 1100px; margin-left: 200px;">
		<form action="pollAnswer.do">
			<table class="table table-bordered">

				<tr>
					<th style="width: 15%;">설문내용</th>
					<td style="width: 85%; text-align: left">${poll.pollTitle}</td>
				</tr>
				<tr>
					<th>기간</th>
					<td style="text-align: left">${poll.SDT}~${poll.EDT}</td>
				</tr>
				<tr>
					<th><br>
					<br>답변</th>
					<td style="text-align: left"><input type="hidden"
						name="user_id" value="${sessionScope.user_id}"> <input
						type="hidden" name="poll_no" value="${poll.pollNo}">
						<div>
							<input type="radio" name="answer" value=1>${poll.answer1}
						</div> <br>
						<div>
							<input type="radio" name="answer" value=2>${poll.answer2}
						</div> <br>
						<div>
							<input type="radio" name="answer" value=3>${poll.answer3}
						</div></td>
				</tr>
			</table>





			<div class="event">
				<ul>
					<li class="nav-item"><a class="btn btn-primary"
						href="polllist.do?userId=${user_id}">이전으로</a></li>
					<li class="nav-item"><input class="btn btn-primary"
						type="submit" value="설문완료"
						style="border-right: 0px solid; border-left: 0px solid; border-top: 0px solid; border-bottom: 0px solid;"></li>
				</ul>
			</div>

		</form>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>