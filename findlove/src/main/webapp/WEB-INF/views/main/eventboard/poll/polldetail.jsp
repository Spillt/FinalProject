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
  tr:nth-child(2n+1), td:nth-child(2n+1) {
    background-color: #faadad;
  }

</style>
</head>
<body>

	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>




	<div class="event">
		<ul>
			<li class="nav-item"><a class="btn btn-primary nav-link js-scroll-trigger"
				href="attendancelist.do">출석체크</a></li>
			<li class="nav-item"><a class="btn btn-primary nav-link js-scroll-trigger"
				href="polllist.do?userId=${user_id}">설문조사</a></li>
		</ul>
	</div>
	<div class="<!-- detail -->">
	<form action="pollAnswer.do">
		<table class="table table-striped">
		
			<tr>
				<td style="width:10%; text-align: left">설문내용</td>
				<td style="width:90%; text-align: left">${poll.pollTitle}</td>
			</tr>
			<tr>
				<td style="text-align: left">기간</td>
				<td style="text-align: left">${poll.SDT}~${poll.EDT}</td>
			</tr>
			<tr>
				<td style="text-align: left"><br>답변
				</td>
				<td style="text-align: left">
					
					
						<input type="hidden" name="user_id" value="${sessionScope.user_id}">
						<input type="hidden" name="poll_no" value="${poll.pollNo}">
						<div>
							<input type="radio" name="answer" value=1>${poll.answer1}
						</div>
						<div>
							<input type="radio" namer="answer" value=2>${poll.answer2}
						</div>
						<div>
							<input type="radio" name="answer" value=3>${poll.answer3}
						</div>
						
					
				</td>
			</tr>
		</table>






		<ul>
			<li class="nav-item"><a class="btn btn-primary"
				href="polllist.do?userId=${user_id}">이전으로</a></li>
			<li class="nav-item"><input class="btn btn-primary" type="submit" value="설문완료"
			style="border-right: 0px solid; border-left: 
				0px solid; border-top: 0px solid; 
				border-bottom: 0px solid; "></li>
				

		</ul>

	</form>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>