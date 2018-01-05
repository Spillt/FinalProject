<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Percent</title>
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

.event ul li {
	color: #808080;
	padding-bottom: 3px;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-color: white;
	display: inline-block;
	padding-right: 10px;
	
}

#gongbek{
	background: #fde1e1;
	border-radius: 25px;
	width: 100px;
}
</style>
</head>
<body>
	설문조사
	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>
	<div class="event">
		<ul>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="attendancelist.do">출석체크</a></li>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scroll-trigger"
				href="percent.do?userId=${user_id}">나는 상위 몇 %?</a></li>
			<li class="nav-item"><a
				class="btn btn-primary nav-link js-scro 	ll-trigger"
				href="polllist.do?userId=${user_id}">설문조사</a></li>
		</ul>
	</div>
	<div class="event">
		<div class="col-lg-12 text-center">
			<c:forEach var="list" items="${list}">
				<strong style="font-size: 25pt; color: black;">${list.userId}(${list.userNickNm})
					님의 정보<br><br></strong>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<table id="tableData" style="width: 100%; height: 220px" align="center">
			<tbody>
				<tr style="font-size: 15pt;" align="center"	valign="middle">
					<c:forEach var="list" items="${list}">
						<td id="gongbek">
							${list.userNickNm} 님은<br> <br>
							<c:set var="count" value="${list.count}" />
							<fmt:formatNumber value="${count-1}" /> 명중
							${list.rank} 등입니다.
						</td>
					<td style="width: 10px;" ></td>
						<td id="gongbek"><c:set var="rank" value="${list.rank}" /> 
						<c:set var="count" value="${list.count}" /> ${list.userNickNm} 님은 <br>
							<br> 상위 <fmt:formatNumber value="${rank/(count-1)*100}"
								pattern=".00" /> % 입니다.</td>
					<td style="width: 10px;" ></td>
						<td id="gongbek">${list.userNickNm} 님이<br> 다른 이성에게 받은<br>평점은 ${list.gradeAvg} 점 입니다.</td>
					</c:forEach>
				</tr>

			</tbody>
		</table>
	</div>
	<!-- footer -->
	
	<c:import url="../../../include/footer.jsp" />
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/findlove/resources/js/paging.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>

</body>
</html>