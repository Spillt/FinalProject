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
body{
background:url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
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
	width: 400px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
	
}
  
th, td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: center;
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
					<form action="pollAnswer.do">
						<input type="hidden" name="user_id" value="user11">
						<input type="hidden" name="poll_no" value="${poll.pollNo}">
						<div>
							<input type="radio" name="answer" value=1>${poll.answer1}
						</div>
						<div>
							<input type="radio" name="answer" value=2>${poll.answer2}
						</div>
						<div>
							<input type="radio" name="answer" value=3>${poll.answer3}
						</div>
						<input type="submit" value="설문완료">
					</form>
				</td>
			</tr>
		</table>






		<ul>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="polllist.do">이전으로</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				>설문완료</a></li>

		</ul>


	</div>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>