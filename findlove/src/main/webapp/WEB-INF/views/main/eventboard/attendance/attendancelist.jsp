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

#calendar {
	/* 		float: right; */
	margin: 0 auto;
	width: 900px;
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px #C3C3C3;
	-webkit-box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
	-moz-box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
	box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
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
			<div style="position:absolute; margin-left:560px; margin-top:25px">
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="attendancebtn.do?userId=${user_id}">Today Check</a></li>
				</div>

		</ul>
	</div>
	<div class="attendance">
		<div id='wrap'>

			<div id='calendar'></div>

			<div style='clear: both'></div>
		</div>
	</div>



	<script type="text/javascript" src="/findlove/resources/js/calendar.js"></script>
	<script type="text/javascript">
		var schedule = [];
		$(function() {
			$('#mainNav').css('background-color', '#faadad');

			var att;
			var date = [];
			<c:forEach var="i" items="${list}">

			att = '${i.attendanceDT}';

			date = [ att.substr(0, 4), att.substr(5, 2), att.substr(8, 2) ];
			schedule.push({
				id : 1,
				title : '출석체크',
				start : new Date(date[0], date[1] - 1, date[2], 16, 0),
				allDay : true,
			});

			</c:forEach>
		});
		$(document).ready(function() {
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
			/*  className colors
			
			className: default(transparent), important(red), chill(pink), success(green), info(blue)
			
			 */

			/* initialize the external events
			-----------------------------------------------------------------*/

			$('#external-events div.external-event').each(function() {

				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text())
				// use the element's text as the event title
				};

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 999,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});

			});

			/* initialize the calendar
			-----------------------------------------------------------------*/

			$('.test-btn').on('click', function() {
				schedule.push({
					id : 1,
					title : '출석체크',
					start : new Date(y, m, d - 1, 16, 0),
					allDay : true,
				});
			});

			var calendar = $('#calendar').fullCalendar({
				header : {
					left : 'title',
					right : 'prev,next today'
				},
				editable : true,
				firstDay : 0, //  1(Monday) this can be changed to 0(Sunday) for the USA system

				columnFormat : {
					month : 'ddd', // Mon
				},
				titleFormat : {
					month : 'MMMM yyyy', // September 2009
				},
				select : function(start, end, allDay) {
					var title = prompt('Event Title:');
					if (title) {
						calendar.fullCalendar('renderEvent', {
							title : title,
							start : start,
							end : end,
							allDay : allDay
						}, true // make the event "stick"
						);
					}
				},
				drop : function(date, allDay) { // this function is called when something is dropped
				},

				events : schedule
			});
		});
	</script>
</body>
</html>
