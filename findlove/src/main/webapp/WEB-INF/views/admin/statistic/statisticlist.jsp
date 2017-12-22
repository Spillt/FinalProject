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
			<hr>
		</div>

		<div class="tab-content">
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