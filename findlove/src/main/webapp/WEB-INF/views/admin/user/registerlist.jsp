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
		</div>
		
		
	</div>




	<%-- <c:import url="../include/footer.jsp" /> --%>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			$('.card:eq(1)').addClass('selected');
		});

	</script>
</body>
</html>