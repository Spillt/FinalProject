<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeboardWrite</title>
<style type="text/css">
	.masthead {
		margin-top: 120px;
	}
</style>
</head>
<body>
	<c:import url="../include/header.jsp" />

	<header class="masthead">
	</header>
	
	
	<form id="frm" name="frm" enctype="multipart/form-data" action="insertFreeboard.do">
	<table class="freeboard_view">
		<colgroup>
			<col width="15%">
			<col width="*"/>
		</colgroup>
		<caption>게시글 작성</caption>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" id="Title" name="freeTitle" class="wdp_90"></input></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="Writer" name="freeWriter"></input></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" class="view_text">
					<textarea rows="20" cols="100" id="Content" name="freeContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input name="FREE_FILE_ONM" type="file">
				</td>
			</tr>
		</tbody>
	</table>
	
	<input type="submit" href="insertFreeboard.do" class="btn" id="write" value="작성하기">
	<a href="openFreeboardList.do" class="btn" id="list">목록으로</a>
	</form>
	
	<script>
		$(function() {
	        $('#mainNav').css('background-color', '#faadad');
	     });
	</script>
</body>
</html>