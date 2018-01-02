<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile, java.util.ArrayList, java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>연애의발견::매칭게시판</title>

<!-- Page link -->
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CSS 및 스타일 -->
<style type="text/css">
.portfolio-item-inner {
	line-height: 1.42857143;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	transition: box-shadow .25s;
}
.portfolio-item-inner:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.row.panel-title {
	padding-top: 5px;
	border: 1px solid lightgray;
	text-align: left;
}

.row.panel-body {
	padding-top: 10px;
	border: 1px solid lightgray;
	border-top: 0;
}

.portfolio-caption span .material-icons.heart {
	color: #faadad
}

.portfolio-caption span .material-icons.star {
	color: #F7EC98
}

.matchQnA:link {
	color: red;
	text-decoration: none;
}

.matchQnA:visited {
	color: black;
	text-decoration: none;
}

.matchQnA:hover {
	color: black;
	text-decoration: none;
}

.matchQnA {
	color: black; 
	text-decoration: none;
}

.container.top {
	margin-top: 150px;
}
</style>

</head>

<body id="page-top" style="font-size: 1.5rem">

	<!-- header -->
	<c:import url="../../../include/header.jsp" />

	<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">매칭게시판</strong>
			</div>
		</div>
	</div>

	<!-- Page Contents -->
	<div class="container">
		<div class="row">
		
			<!-- Side Navi -->
			<div class="col-lg-3">
				<br>
				<div class="list-group">
					<a href="#" class="list-group-item">이상형 월드컵</a> <a
						href="selectuserlist.do?userId=${user_id }"
						class="list-group-item active">QnA 매칭</a>
					<c:if test="${!empty myQnA}">
						<a href="myMatchqna.do?userId=${user_id }" class="list-group-item">내
							QnA 수정</a>
					</c:if>
					<c:if test="${empty myQnA}">
						<a href="listMatchqna.do" class="list-group-item">내 QnA 작성</a>
					</c:if>

				</div>
			</div>
			
			<!-- Main Content -->
			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<strong>QnA 매칭</strong><br> 원하는 이성을 선택한 후 답변이 일치할 경우 호감메세지
						전송이 가능합니다.
					</div>
						<div class="card-body">
						<section>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="m" items="${requestScope.list}"	varStatus="status">
								<c:if test="${status.first}">
									<div class="item active">
								</c:if>
								<c:if test="${not status.first}">
									<div class="item">
								</c:if>
								<div class="container">
									<c:if test="${today_matching eq 0 }">
										<a href="selectmatchqna.do?matchingUserId=${m.user_id }"
											class="matchQnA" style="font-size:15px; color: black;"></a>
									</c:if>
									<c:if test="${today_matching eq 1 }">
										<a href="#" class="matchQnA" onclick="selectMacthQnA();"
											style="color: black;"></a>
									</c:if>
									<table class="table"
										style="width: 200pt; position: relative; left: 170px;">
										<thead>
											<tr>
												<th colspan="3" style="height: 200pt">${m.picture_nm }
													<div><strong>[${m.user_nm}](${m.rank_gb })</strong></div>
													<div style="font-size: 12pt; color: gray">${m.age }세,${m.blood_type }형,${m.area }</div>
												</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>${m.height }cm,${m.bodyform }</td>
											</tr>
											<tr>
												<td>${m.style }</td>
											</tr>
											<tr>
												<td>${m.job},${m.religion }</td>
											</tr>
											<tr>
												<td>평점 : ★★★★★</td>
											</tr>
										</tbody>
									</table>									
								</div>
								
						</div>
						</c:forEach>		

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>


	<!-- footer -->
	<hr>
	<c:import url="../../../include/footer.jsp" />

	<script>
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
	<script type="text/javascript">
		function selectMacthQnA() {
			alert("매칭은 하루에 한번 가능합니다.\n계속 하고 싶으신 경우 결제하여주십시오. ");//결제창이동 예정
		}
	</script>
</body>
</html>