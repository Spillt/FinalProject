
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDetail</title>

</head>
<style>
th {
	background-color: #faadad;
}

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
	<c:import url="../../views/include/header.jsp" />

	<div class="container" style="margin-top: 200px;">

		<strong style="font-size: 25pt; color: white; text-shadow: 1px 1px 2px black, 0 0 25px #faadad, 0 0 5px #faadad;">${dto.noticeNo }번게시글 </strong>
		<hr class="my-hr1">
		<center>
			<table class="table table-bordered text-center" style="width: 70%">
				<tr>
					<th>제목</th>
					<td colspan="4" height: 100px;">${dto.noticeTitle}</td>
				</tr>
				<tr>
					<th style="width: 25%">조회수</th>
					<td style="width: 25%" colspan="2">${dto.noticeReadCnt}</td>
					<th style="width: 25%">작성일자</th>
					<td style="width: 25%" olspan="2">${dto.noticeDate}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="4" height: 100px;">${dto.noticeFileOName}</td>
				</tr>
				<tr>
					<th colspan="6">내용</th>
				</tr>
				<tr>
					<td colspan="6" align="left" style="height: 150px;">${dto.noticeContent}</td>
				</tr>
			</table>
		</center>
		<center>
			<a href="notice.do" class="myButton">목록으로</a>
		</center>
	</div>

	<div style="width: 650px; text-align: center;"></div>
	<%@ include file="../../views/include/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>