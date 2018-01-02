<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>attendanceList</title>
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/calendar.css">
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

body {
	margin-bottom: 40px;
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	background:
		url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}
.calender {
	height: 50px;	
	margin: 0 auto;
	width: 150px;
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px #faadad;
	-webkit-box-shadow: 0px 0px 21px 2px #faadad;
	-moz-box-shadow: 0px 0px 21px 2px #faadad;
	box-shadow: 0px 0px 21px 2px #faadad;
}
.calenders {
	height: 150px;	
	margin: 0 auto;
	width: 150px;
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px 1px #faadad;
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
				href="polllist.do?userId=${user_id}">설문조사</a></li>
		</ul>
	</div>
		<div class="container">
	<div class="title">
		
		<div class="col-10 row">
			<h1>January 2018</h1>
			<div class="row" style="margin:auto;">
				<a class="col-3 btn btn-primary" href="#"> < </a>
				<a class="col-3 btn btn-primary" href="#"> > </a>
				<a class="col-6 btn btn-primary" href="#"> today </a>
			</div>
		</div>
	</div>

		<table>
			<tr>
				<td class="calender">Sun</td>
				<td class="calender">Mon</td>
				<td class="calender">Tue</td>
				<td class="calender">Wed</td>
				<td class="calender">Thu</td>
				<td class="calender">Fri</td>
				<td class="calender">Sat</td>
			</tr>
		</table>
		<table>
			<tr valign=top>
				<td class="calenders">31</td>
				<td class="calenders">1</td>
				<td class="calenders">2</td>
				<td class="calenders">3</td>
				<td class="calenders">4</td>
				<td class="calenders">5</td>
				<td class="calenders">6</td>
			</tr>
			<tr valign=top>
				<td class="calenders">7</td>
				<td class="calenders">8</td>
				<td class="calenders">9</td>
				<td class="calenders">10</td>
				<td class="calenders">11</td>
				<td class="calenders">12</td>
				<td class="calenders">13</td>
			</tr>
			<tr valign=top>
				<td class="calenders">14</td>
				<td class="calenders">15</td>
				<td class="calenders">16</td>
				<td class="calenders">17</td>
				<td class="calenders">18</td>
				<td class="calenders">19</td>
				<td class="calenders">20</td>
			</tr>
			<tr valign=top>
				<td class="calenders">21</td>
				<td class="calenders">22</td>
				<td class="calenders">23</td>
				<td class="calenders">24</td>
				<td class="calenders">25</td>
				<td class="calenders">26</td>
				<td class="calenders">27</td>
			</tr>
			<tr valign=top>
				<td class="calenders">28</td>
				<td class="calenders">29</td>
				<td class="calenders">30</td>
				<td class="calenders">31</td>
				<td class="calenders">1</td>
				<td class="calenders">2</td>
				<td class="calenders">3</td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>
