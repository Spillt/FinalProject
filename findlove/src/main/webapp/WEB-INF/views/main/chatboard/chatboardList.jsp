<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<script src=" https://use.fontawesome.com/56a81332b8.js"> </script>
<script src="/findlove/resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript"
	src="/findlove/resources/js/jquery-3.2.1.min.js"></script>


<style type="text/css">
.container.top {
	margin-top: 100px;
}
</style>
</head>
<body id="page-top">

	<c:import url="../../include/header.jsp" />

	<br>
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">수락한 이성 리스트</strong>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<tr>
				<td></td>
				</tr>
			</table>
		
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
