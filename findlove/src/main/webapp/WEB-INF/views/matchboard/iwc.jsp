<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iwc</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<style>
.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #f7c5c0;
	-webkit-box-shadow: inset 0px 1px 0px 0px #f7c5c0;
	box-shadow: inset 0px 1px 0px 0px #f7c5c0;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fc8d83
		), color-stop(1, #e4685d));
	background: -moz-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background: -webkit-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background: -o-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background: -ms-linear-gradient(top, #fc8d83 5%, #e4685d 100%);
	background: linear-gradient(to bottom, #fc8d83 5%, #e4685d 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fc8d83',
		endColorstr='#e4685d', GradientType=0);
	background-color: #fc8d83;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #d83526;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #b23e35;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e4685d
		), color-stop(1, #fc8d83));
	background: -moz-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background: -webkit-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background: -o-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background: -ms-linear-gradient(top, #e4685d 5%, #fc8d83 100%);
	background: linear-gradient(to bottom, #e4685d 5%, #fc8d83 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e4685d',
		endColorstr='#fc8d83', GradientType=0);
	background-color: #e4685d;
}

.myButton:active {
	position: relative;
	top: 1px;
}
  .my-hr1 {
    border: 0;
    height: 3px;
    background: #ccc;
  }

</style>
<body>
	<div class="container" style="margin-top: 200px;">
		<c:import url="../../views/include/header.jsp" />
		<strong
			style="font-size: 25pt; color: white; text-shadow: 1px 1px 2px black, 0 0 25px #faadad, 0 0 5px #faadad;">이상형
			월드컵 </strong>
		<hr class="my-hr1">
		<center>
			<table class="table table-bordered text-center" style=""middle">
				<input type="hidden" name="chk_info" value="#">남자여자 히든으로 확인
				<tr>
					<th>지역</th>
					<td><input type="checkbox" name="chk_info" value="#">서울</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
					<td><input type="checkbox" name="chk_info" value="#">경기도</td>
				<tr>
					<th>나이</th>
					<td><inputtype-"text"> ~ 
					<input type-"text">
					<input type="submit" value="확인"></td>
				</tr>

			</table>
		</center>
		<center>
			<a href="idealworldcup.do" class="myButton">다시하기</a>
		</center>
	</div>
	<%@ include file="../../views/include/footer.jsp"%>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>