<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

th, .material-icons.icons-detail {
	color: #faadad
}


td img {
	width: 50px;
}

.table-cursor {
	cursor: pointer;
}

.material-icons.state {
	padding-top: 4px;
	font-size: 15px;
}

.material-icons.blue {
	color: #66ccff;
}
.material-icons.green {
	color: #99ff99;
}
.material-icons.yellow {
	color: #ffff66;
}
.material-icons.red {
	color: #ff5050;
}
.material-icons.black {
	color: #333333;
}

tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
}

.page-content ul li.page-item a.page-link {
	color: #faadad;
}

.bage-usertable-order {
	background-color: #faadad;
	color: #fff;
}

</style>

</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="tab-content">
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>사진</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>등급</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="userBasic">
							<tr id="${userBasic.user_id}" class="table-cursor userdetail-btn" data-toggle="modal">
							
								<c:if test="${userBasic.picture_nm eq null}">
									<td style="padding: 0"><img src="/findlove/uploadfiles/profile/default.png"></td>
								</c:if>
								<c:if test="${userBasic.picture_nm ne null}">
									<td style="padding: 0"><img src="/findlove/uploadfiles/profile/${userBasic.picture_nm}"></td>
								</c:if>
								
								<td>${userBasic.user_id}</td>
								<td>${userBasic.user_nm}</td>
								<td>${userBasic.user_nicknm}</td>
								
								<td>${userBasic.enroll_dt}</td>
								<c:choose>
									<c:when test="${userBasic.rank_gb eq 'B'}">
										<td>BRONZE</td>
									</c:when>
									<c:when test="${userBasic.rank_gb eq 'S'}">
										<td>SILVER</td>
									</c:when>
									<c:when test="${userBasic.rank_gb eq 'G'}">
										<td>GOLD</td>
									</c:when>
									<c:when test="${userBasic.rank_gb eq 'P'}">
										<td>PLATINUM</td>
									</c:when>
									<c:when test="${userBasic.rank_gb eq 'D'}">
										<td>DIAMOND</td>
									</c:when>
									<c:when test="${userBasic.rank_gb eq 'M'}">
										<td>관리자</td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${userBasic.user_st eq 0}">
										<td><i class="material-icons state blue" data-toggle="tooltip" data-placement="bottom" title="가입승인대기">lens</i></td>
									</c:when>
									<c:when test="${userBasic.user_st eq 1}">
										<td></td>
									</c:when>
									<c:when test="${userBasic.user_st eq 2}">
										<td><i class="material-icons state yellow" data-toggle="tooltip" data-placement="bottom" title="휴면">lens</i></td>
									</c:when>
									<c:when test="${userBasic.user_st eq 3}">
										<td><i class="material-icons state red" data-toggle="tooltip" data-placement="bottom" title="정지">lens</i></td>
									</c:when>
									<c:when test="${userBasic.user_st eq 4}">
										<td><i class="material-icons state black" data-toggle="tooltip" data-placement="bottom" title="삭제대기">lens</i></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
			<div class="page-content row justify-content-center">
				<ul class="pagination">
					<c:if test="${pageNo eq 1}">
						<li class="page-item"><a class="page-link" style="background-color: #e9ecef; color: lightgray">이전</a></li>
					</c:if>
					<c:if test="${pageNo ne 1}">
						<li class="page-item"><a class="page-link" href="userlist.do?pageNo=${pageNo-1}">이전</a></li>
					</c:if>
					<c:forEach begin="1" end="${pageCnt}" var="idx">
						<c:if test="${pageNo eq idx }">
							<li class="page-item"><a class="page-link" style="background-color:#faadad; color: #f77070; font-weight:bold" href="userlist.do?pageNo=${idx}">${idx}</a></li>
						</c:if>
						<c:if test="${pageNo ne idx }">
							<li class="page-item"><a class="page-link" href="userlist.do?pageNo=${idx}">${idx}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageNo eq pageCnt}">
						<li class="page-item"><a class="page-link" style="background-color: #e9ecef; color: lightgray">다음</a></li>
					</c:if>
					<c:if test="${pageNo ne pageCnt}">
						<li class="page-item"><a class="page-link" href="userlist.do?pageNo=${pageNo+1}">다음</a></li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</div>
	<c:import url="./usermodal.jsp" />
	
	<c:import url="../../include/footer.jsp" />

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			$('.card:first').addClass('selected');
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		function searchFunction() {
			$("#search").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				$("table tr:gt(0)").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		}
	</script>
</body>

</html>


