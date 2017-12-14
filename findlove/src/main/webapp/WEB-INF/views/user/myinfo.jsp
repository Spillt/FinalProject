<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연애의발견::내정보보기</title>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/myinfo.css">
</head>
<body>
	<div class="testbox">
		<h1>내정보보기</h1>

		<form action="myinfo" name="myinfo" method="post">

			<!-- 사용자 이미지 -->
			<div class="image1">
				<a target="_blank" href="img_fjords.jpg"> <img
					src="/findlove/resources/img/team/1.jpg" alt="" width="180"
					height="180">
				</a>
				<div class="desc"></div>
			</div>
		</form>

		<hr>
		<br>
		
		<!-- 이미지 업로드 -->
		
		<form action="imageupload" method="post" enctype="multipart/form-data">
			<input type="file" name="imageFile"><br> <input
				type="submit" value="전송">
		</form>
		

	 
		<hr>

		<table class="type07">
			<thead>
				<tr>
					<th scope="cols">기본프로필</th>
					<th scope="cols"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">실명</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">닉네임</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">성별</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">직업/직장</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">휴대폰번호</th>
					<td>내용.</td>
				</tr>
			</tbody>

		</table>
	


		<a class="button" onclick="checkfield()">Register</a> <a
			class="button" onclick="">Cancel</a>
		</form>
	</div>

</body>
</html>