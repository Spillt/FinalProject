<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

th {
	color: #faadad
}

td img {
	width: 50px;
}

.table-cursor {
	cursor: pointer;
}

tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
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
						<th>승인</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="userBasic">
							<tr id="${userBasic.user_id}" class="table-cursor" data-toggle="modal">
							
								<c:if test="${userBasic.picture_nm eq null}">
									<td class="userdetail-btn-instead" style="padding: 0"><img src="/findlove/uploadfiles/profile/default.png"></td>
								</c:if>
								<c:if test="${userBasic.picture_nm ne null}">
									<td class="userdetail-btn-instead" style="padding: 0"><img src="/findlove/uploadfiles/profile/${userBasic.picture_nm}"></td>
								</c:if>
								
								<td class="userdetail-btn-instead">${userBasic.user_id}</td>
								<td class="userdetail-btn-instead">${userBasic.user_nm}</td>
								<td class="userdetail-btn-instead">${userBasic.user_nicknm}</td>
								
								<td class="userdetail-btn-instead">${userBasic.enroll_dt}</td>
								
								<td style="padding: 5px"><button id="${userBasic.user_id}" class="btn btn-primary approval-btn">승인</button></td>
							</tr>
							
						</c:forEach>
					</c:if>
				</tbody>
				
			</table>
		</div>
	</div>

	<c:import url="./usermodal.jsp" />


	<c:import url="../../include/footer.jsp" />

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			$('.card:eq(1)').addClass('selected');
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$('.userdetail-btn-instead').on('click', function() {
			userDetailModal($(this).parent('tr'));
		});
		
		$('.approval-btn').on('click', function() {
			if(confirm("승인하시겠습니까?")) {
				document.location.href="signupadmit.do?userId=" + $(this).attr('id');
			}
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