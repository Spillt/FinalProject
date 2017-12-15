<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
</style>

</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container">
		
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
			$('.card:last').addClass('selected');
		});

	</script>
</body>
</html>