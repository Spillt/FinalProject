<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견</title>

<style type="text/css">
.container.top {
	margin-top: 150px;
}
th {
	color: #faadad
}
.table-cursor {
	cursor: pointer;
}
tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
}
</style>

<script src=" https://use.fontawesome.com/56a81332b8.js "></script>
</head>

<body id="page-top">

	<c:import url="../../include/header.jsp" />

	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">나의 매칭</strong>
			</div>
		</div>
	</div>

	<div class="container" style="min-height: 600px">

		<div class="row">
			<div class="col-lg-3">
				<br>
				<div class="list-group">
					<a href="openSendMessageList.do?user_id=${ sessionScope.user_id }" class="list-group-item">내가 호감을 보낸 이성</a>
					<a href="openReceiveMessageList.do?user_id=${sessionScope.user_id}" class="list-group-item">나에게 호감을 보낸 이성</a>
					<a href="#" class="list-group-item active">내가 높은 평점을 준 이성</a>
					<a href="openReceiveGradeList.do?user_id=${sessionScope.user_id}" class="list-group-item">나에게 높은 평점을 준 이성</a>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">내가 높은 평점을 준 이성</div>

					 <div class="card-body">
					 <c:choose>
					 <c:when test="${ fn:length(map.list) > 0}">
					 
					 <table class="table table-striped text-center">
					 	<thead>
							<tr>
								<th>사진</th>
								<th>닉네임</th>
								<th>나이</th>
								<th>지역</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ map.list }" var="profile">
							<tr>
								<td style="padding: 0"><img src="/findlove/uploadfiles/profile/${ profile.picture_NM }" style="width: 50px; height: 50px;" alt=""></td>
								<td>${ profile.user_NickNM }
									<c:choose>
										<c:when test="${ profile.gender eq 'M'}">(남)</c:when>
										<c:otherwise>(여)</c:otherwise>
									</c:choose>
								</td>
								<td>${ profile.age }세</td>
								<td>${ profile.area }</td>
							</tr>
							</c:forEach>
						</tbody>				 
					 </table>
					 
					 
					 </c:when>
					 <c:otherwise>
					  <br><br><br>
					  <br><br><br>
					  <br><br><br>
					  <h2 align="center" style="color:#faadad;">내가 높은 평점을 준 이성이 없습니다</h2>
					  <br><br><br>
					  <br><br><br>
					  <br><br><br>
					</c:otherwise>
    				 
					 </c:choose>
					 </div>
					
				</div>

			</div>

		</div>

	</div>

	<hr>


	<c:import url="../../include/footer.jsp" />

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>

</html>
