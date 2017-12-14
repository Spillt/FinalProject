<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
header.subhead {
	height: 56px
}

@media ( min-width :992px) {
	header.subhead {
		height: 103px
	}
}

button.tab-btn {
	padding: 20px !important;
	margin: 5px !important;
	background-color: #faadad;
	border: 0
}

th {
	color: #faadad
}

button.tab-btn.selected {
	background-color: #f77070;
}

.material-icons.icons-detail {
	color: #faadad;
}
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<div class="container">
		<header class="subhead"> </header>

		<div class="tab">
			<h1>관리자 페이지</h1>
			<div class="text-center">
				<button onclick="window.location.href='userlist.do'" class="tab-btn">전체 회원 관리</button>
				<button onclick="window.location.href='registerlist.do'" class="tab-btn">가입 승인 관리</button>
				<button onclick="window.location.href='reporterlist.do'" class="tab-btn selected">신고 회원 관리</button>
			</div>
			<hr>
		</div>

		<div class="tab-content">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>아이디</th>
						<th>신고 사유</th>
						<th>신고자</th>
						<th>정지보류</th>
						<th>상세</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>chanwo1993</td>
						<td>신고 사유 내용</td>
						<td>익명</td>
						<td style="padding: 2"class="btn-group"><button class="btn btn-danger">정지</button><button class="btn btn-warning">보류</button></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td>chanwo1993</td>
						<td>신고 사유 내용</td>
						<td>익명</td>
						<td style="padding: 2"class="btn-group"><button class="btn btn-danger">정지</button><button class="btn btn-warning">보류</button></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td>chanwo1993</td>
						<td>신고 사유 내용</td>
						<td>익명</td>
						<td style="padding: 2"class="btn-group"><button class="btn btn-danger">정지</button><button class="btn btn-warning">보류</button></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
	</div>




	<%-- <c:import url="../include/footer.jsp" /> --%>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});

	</script>
</body>
</html>