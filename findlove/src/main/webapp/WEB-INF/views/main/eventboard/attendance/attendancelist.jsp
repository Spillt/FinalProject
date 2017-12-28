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

.containers {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	background-color: #fff;
	padding-right: 20px;
	padding-left: 20px;
}

@media ( min-width :992px) {
	header.subhead {
		height: 103px;
		background-color: #faadad;
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

.container {
	background: transparent;
	background-color: transparent;
}
</style>
</head>
<body>
	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>





	<div class="attendance">

		<form action="attendancelist.do">
			<div class="container theme-showcase">
				<div class="event" style="border: 0px; background: transparent;">
					<ul style="margin-left: 70px">
						<li class="nav-item"><a
							class="btn btn-primary nav-link js-scroll-trigger"
							href="attendancelist.do">출석체크</a></li>
						<li class="nav-item"><a
							class="btn btn-primary nav-link js-scroll-trigger"
							href="polllist.do?userId=${user_id}">설문조사</a></li>
						<li class="nav-item float-right"><input
							class="btn btn-primary" type="submit" value="출석체크"></li>
					</ul>
				</div>
				<div id="holder" class="containers"></div>

			</div>
		</form>

		<script type="text/tmpl" id="tmpl">
  {{ 
  var date = date || new Date(),
      month = date.getMonth(), 
      year = date.getFullYear(), 
      first = new Date(year, month, 1), 
      last = new Date(year, month + 1, 0),
      startingDay = first.getDay(), 
      thedate = new Date(year, month, 1 - startingDay),
      dayclass = lastmonthcss,
      today = new Date(),
      i, j; 
  if (mode === 'week') {
    thedate = new Date(date);
    thedate.setDate(date.getDate() - date.getDay());
    first = new Date(thedate);
    last = new Date(thedate);
    last.setDate(last.getDate()+6);
  } else if (mode === 'day') {
    thedate = new Date(date);
    first = new Date(thedate);
    last = new Date(thedate);
    last.setDate(thedate.getDate() + 1);
  }
  
  }}
  <table class="calendar-table table table-condensed table-tight">
    <thead>
      <tr>
        <td colspan="7" style="text-align: center">
          <table style="white-space: nowrap; width: 100%">
            <tr>
              <td style="text-align: left;">
                <span class="btn-group">
                  <button class="js-cal-prev btn btn-default"><</button>
                  <button class="js-cal-next btn btn-default">></button>
                </span>
                <button class="js-cal-option btn btn-default {{: first.toDateInt() <= today.toDateInt() && today.toDateInt() <= last.toDateInt() ? 'active':'' }}" data-date="{{: today.toISOString()}}" data-mode="month">{{: todayname }}</button>
              </td>
              <td>
                <span class="btn-group btn-group-lg">
                  {{ if (mode !== 'day') { }}
                    {{ if (mode === 'month') { }}<button class="js-cal-option btn btn-link" data-mode="year">{{: months[month] }}</button>{{ } }}
                    {{ if (mode ==='week') { }}
                      <button class="btn btn-link disabled">{{: shortMonths[first.getMonth()] }} {{: first.getDate() }} - {{: shortMonths[last.getMonth()] }} {{: last.getDate() }}</button>
                    {{ } }}
                    <button class="js-cal-years btn btn-link">{{: year}}</button> 
                  {{ } else { }}
                    <button class="btn btn-link disabled">{{: date.toDateString() }}</button> 
                  {{ } }}
                </span>
              </td>
              <td style="text-align: right">
                <span class="btn-group">
                  <button class="js-cal-option btn btn-default {{: mode==='month'? 'active':'' }}" data-mode="month">Month</button>
                  <button class="js-cal-option btn btn-default {{: mode==='week'? 'active':'' }}" data-mode="week">Week</button>
                </span>
              </td>
            </tr>
          </table>
          
        </td>
      </tr>
    </thead>
    {{ if (mode ==='year') {
      month = 0;
    }}
    <tbody>
      {{ for (j = 0; j < 3; j++) { }}
      <tr>
        {{ for (i = 0; i < 4; i++) { }}
        <td class="calendar-month month-{{:month}} js-cal-option" data-date="{{: new Date(year, month, 1).toISOString() }}" data-mode="month">
          {{: months[month] }}
          {{ month++;}}
        </td>
        {{ } }}
      </tr>
      {{ } }}
    </tbody>
    {{ } }}
    {{ if (mode ==='month' || mode ==='week') { }}
    <thead>
      <tr class="c-weeks">
        {{ for (i = 0; i < 7; i++) { }}
          <th class="c-name">
            {{: days[i] }}
          </th>
        {{ } }}
      </tr>
    </thead>
    <tbody>
      {{ for (j = 0; j < 6 && (j < 1 || mode === 'month'); j++) { }}
      <tr>
        {{ for (i = 0; i < 7; i++) { }}
        {{ if (thedate > last) { dayclass = nextmonthcss; } else if (thedate >= first) { dayclass = thismonthcss; } }}
        <td class="calendar-day {{: dayclass }} {{: thedate.toDateCssClass() }} {{: date.toDateCssClass() === thedate.toDateCssClass() ? 'selected':'' }} {{: daycss[i] }} js-cal-option" data-date="{{: thedate.toISOString() }}">
          <div class="date">{{: thedate.getDate() }}</div>
          {{ thedate.setDate(thedate.getDate() + 1);}}
        </td>
        {{ } }}
      </tr>
      {{ } }}
    </tbody>
    {{ } }}
    {{ if (mode ==='day') { }}
    <tbody>
      <tr>
        <td colspan="7">
          <table class="table table-striped table-condensed table-tight-vert" >
            <thead>
              <tr>
                <th> </th>
                <th style="text-align: center; width: 100%">{{: days[date.getDay()] }}</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th class="timetitle" >All Day</th>
                <td class="{{: date.toDateCssClass() }}">  </td>
              </tr>
              <tr>
                <th class="timetitle" >Before 6 AM</th>
                <td class="time-0-0"> </td>
              </tr>
              {{for (i = 6; i < 22; i++) { }}
              <tr>
                <th class="timetitle" >{{: i <= 12 ? i : i - 12 }} {{: i < 12 ? "AM" : "PM"}}</th>
                <td class="time-{{: i}}-0"> </td>
              </tr>
              <tr>
                <th class="timetitle" >{{: i <= 12 ? i : i - 12 }}:30 {{: i < 12 ? "AM" : "PM"}}</th>
                <td class="time-{{: i}}-30"> </td>
              </tr>
              {{ } }}
              <tr>
                <th class="timetitle" >After 10 PM</th>
                <td class="time-22-0"> </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </tbody>
    {{ } }}
  </table>
</script>


		<script>
			var $currentPopover = null;

			//quicktmpl is a simple template language I threw together a while ago; it is not remotely secure to xss and probably has plenty of bugs that I haven't considered, but it basically works
			//the design is a function I read in a blog post by John Resig (http://ejohn.org/blog/javascript-micro-templating/) and it is intended to be loosely translateable to a more comprehensive template language like mustache easily
			$.extend({
				quicktmpl : function(template) {
					return new Function("obj",
							"var p=[],print=function(){p.push.apply(p,arguments);};with(obj){p.push('"
									+ template.replace(/[\r\t\n]/g, " ").split(
											"{{").join("\t").replace(
											/((^|\}\})[^\t]*)'/g, "$1\r")
											.replace(/\t:(.*?)\}\}/g, "',$1,'")
											.split("\t").join("');")
											.split("}}").join("p.push('")
											.split("\r").join("\\'")
									+ "');}return p.join('');")
				}
			});

			$.extend(Date.prototype, {
				//provides a string that is _year_month_day, intended to be widely usable as a css class
				toDateCssClass : function() {
					return '_' + this.getFullYear() + '_'
							+ (this.getMonth() + 1) + '_' + this.getDate();
				},
				//this generates a number useful for comparing two dates; 
				toDateInt : function() {
					return ((this.getFullYear() * 12) + this.getMonth()) * 32
							+ this.getDate();
				}
			});

			(function($) {

				//t here is a function which gets passed an options object and returns a string of html. I am using quicktmpl to create it based on the template located over in the html block
				var t = $.quicktmpl($('#tmpl').get(0).innerHTML);

				function calendar($el, options) {
					//actions aren't currently in the template, but could be added easily...
					$el
							.on(
									'click',
									'.js-cal-prev',
									function() {
										switch (options.mode) {
										case 'month':
											options.date.setMonth(options.date
													.getMonth() - 1);
											break;
										case 'week':
											options.date.setDate(options.date
													.getDate() - 7);
											break;
										case 'day':
											options.date.setDate(options.date
													.getDate() - 1);
											break;
										}
										draw();
									})
							.on(
									'click',
									'.js-cal-next',
									function() {
										switch (options.mode) {
										case 'month':
											options.date.setMonth(options.date
													.getMonth() + 1);
											break;
										case 'week':
											options.date.setDate(options.date
													.getDate() + 7);
											break;
										case 'day':
											options.date.setDate(options.date
													.getDate() + 1);
											break;
										}
										draw();
									})
							.on('click', '.js-cal-option', function() {
								var $t = $(this), o = $t.data();
								if (o.date) {
									o.date = new Date(o.date);
								}
								$.extend(options, o);
								draw();
							})
							.on(
									'click',
									'.js-cal-years',
									function() {
										var $t = $(this), haspop = $t
												.data('popover'), s = '', y = options.date
												.getFullYear() - 2, l = y + 5;
										if (haspop) {
											return true;
										}
										$t.popover({
											content : s,
											html : true,
											placement : 'auto top'
										}).popover('toggle');
										return false;
									})
							.on(
									'click',
									'.event',
									function() {
										var $t = $(this), index = +($t
												.attr('data-index')), haspop = $t
												.data('popover'), data, time;

										if (haspop || isNaN(index)) {
											return true;
										}
										data = options.data[index];
										time = data.start.toTimeString();
										if (time && data.end) {
											time = time + ' - '
													+ data.end.toTimeString();
										}
										$t.data('popover', true);
										$t.popover(
												{
													content : '<p><strong>'
															+ time
															+ '</strong></p>'
															+ data.text,
													html : true,
													placement : 'auto left'
												}).popover('toggle');
										return false;
									});

					function monthAddEvent(index, event) {
						var $event = $('<div/>', {
							'class' : 'event',
							text : event.title,
							title : event.title,
							'data-index' : index
						}), e = new Date(event.start), dateclass = e
								.toDateCssClass(), day = $('.'
								+ e.toDateCssClass()), empty = $('<div/>', {
							'class' : 'clear event',
							html : ' '
						}), numbevents = 0, time = event.start.toTimeString(), endday = event.end
								&& $('.' + event.end.toDateCssClass()).length > 0, checkanyway = new Date(
								e.getMonth(), e.getDate() + 40), existing, i;
						$event.toggleClass('all-day', !!event.allDay);
						if (!!time) {
							$event.html('<strong>' + time + '</strong> '
									+ $event.html());
						}
						if (!event.end) {
							$event.addClass('begin end');
							$('.' + event.start.toDateCssClass())
									.append($event);
							return;
						}

						while (e <= event.end
								&& (day.length || endday || options.date < checkanyway)) {
							if (day.length) {
								existing = day.find('.event').length;
								numbevents = Math.max(numbevents, existing);
								for (i = 0; i < numbevents - existing; i++) {
									day.append(empty.clone());
								}
								day.append($event.toggleClass(
										'begin',
										dateclass === event.start
												.toDateCssClass()).toggleClass(
										'end',
										dateclass === event.end
												.toDateCssClass()));
								$event = $event.clone();
								$event.html(' ');
							}
							e.setDate(e.getDate() + 1);
							dateclass = e.toDateCssClass();
							day = $('.' + dateclass);
						}
					}

					function draw() {
						$el.html(t(options));
						//potential optimization (untested), this object could be keyed into a dictionary on the dateclass string; the object would need to be reset and the first entry would have to be made here
						$('.' + (new Date()).toDateCssClass())
								.addClass('today');
						if (options.data && options.data.length) {
							if (options.mode === 'month'
									|| options.mode === 'week') {
								$.each(options.data, monthAddEvent);
							} else {
								$.each(options.data, dayAddEvent);
							}
						}
					}

					draw();
				}

				;
				(function(defaults, $, window, document) {
					$.extend({
						calendar : function(options) {
							return $.extend(defaults, options);
						}
					}).fn.extend({
						calendar : function(options) {
							options = $.extend({}, defaults, options);
							return $(this).each(function() {
								var $this = $(this);
								calendar($this, options);
							});
						}
					});
				})({
					days : [ "Sunday", "Monday", "Tuesday", "Wednesday",
							"Thursday", "Friday", "Saturday" ],
					months : [ "January", "February", "March", "April", "May",
							"June", "July", "August", "September", "October",
							"November", "December" ],
					shortMonths : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun",
							"Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ],
					date : (new Date()),
					daycss : [ "c-sunday", "", "", "", "", "", "c-saturday" ],
					todayname : "Today",
					thismonthcss : "current",
					lastmonthcss : "outside",
					nextmonthcss : "outside",
					mode : "month",
					data : []

				}, jQuery, window, document);

			})(jQuery);

			var data = [], date = new Date(), d = date.getDate(), d1 = d, m = date
					.getMonth(), i, end, j, c = 1063, c1 = 3329, h, m, names = [
					'All Day Event', 'Long Event', 'Birthday Party',
					'Repeating Event', 'Training', 'Meeting', 'Mr. Behnke',
					'Date', 'Ms. Tdddubbs' ]
			for (i = 0; i < 500; i++) {
				j = Math.max(i % 15 - 10, 0);
				//c and c1 jump around to provide an illusion of random data
				c = (c * 1063) % 1061;
				c1 = (c1 * 3329) % 3331;
				d = (d1 + c + c1) % 839 - 440;
				h = i % 36;
				m = (i % 4) * 15;
				if (h < 18) {
					h = 0;
					m = 0;
				} else {
					h = Math.max(h - 24, 0) + 8;
				}
				end = !j ? null : new Date(m, d + j, h + 2, m);
				data.push({
					title : names[c1 % names.length],
					start : new Date(m, d, h, m),
					end : end,
					allDay : !(i % 6)
				});
			}

			//data must be sorted by start date

			//Actually do everything
			$('#holder').calendar({
				data : data
			});
		</script>
</body>
</html>
