<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::마이페이지</title>

<!-- Page link -->

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

.pannel {
	margin-right: 10px;
}

.masthead {
	margin-bottom: 20px;
}

.container.top {
	margin-top: 150px;
}

#image {
	display: none;
}

#imagePreview {
	border: 1px solid;
}

#anotherImage {
	border: 1px solid;
}
</style>

</head>
<body id="page-top">
	<%-- <c:set var="p" value="${ profile }"></c:set> --%>

	<!-- header -->
	<c:import url="../include/header.jsp" />

	<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">마이페이지</strong>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group">
					<a href="myinfo.do" class="list-group-item">나의 정보</a> <a
						href="myprofile.do" class="list-group-item">나의 프로필</a> <a
						href="idealprofile.do" class="list-group-item active">이상형 프로필
						</a> <a href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header"><strong>${sessionScope.user_id }님의 이상형 프로필입니다.</strong></div>
					<div class="card-body">
						<section id="plans">
							<div class="container">
								<div class="row">
									<div class="col-md-12 mb-12" style="margin-bottom: 20px;">
										<div class="card h-80">
											<div class="card-body">
												<table class="table">
													<tr>
														<th>나이</th>
														<td>상관없음</td>
													</tr>
													<tr>
														<th>지역</th>
														<td>서울</td>
													</tr>
													<tr>
														<th>스타일</th>
														<td>낙천,신중한,열정적인</td>
													</tr>
													<tr>
														<th>키/체형</th>
														<td>160~165cm / 마름</td>
													</tr>
													<tr>
														<th>종교</th>
														<td>무교</td>
													</tr>
													<tr>
														<th>음주여부</th>
														<td>즐겨 마셔요</td>
													</tr>
													<tr>
														<th>흡연여부</th>
														<td>비흡연</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

									<a class="btn btn-primary"
										style="color: #fff; margin-left: 20px; margin-bottom: 20px;"
										onclick="location.href='idealprofileset.do'">수정하기</a> <a
										class="btn btn-primary"
										style="color: #fff; margin-left: 5px; margin-bottom: 20px;"
										onclick="history.go(-1)">취소</a>
								</div>
								</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- footer -->
	<hr>
	<c:import url="../include/footer.jsp" />

	<!-- 자바스크립트 -->
	<!-- 헤더 변경 -->
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>



</body>
</html>