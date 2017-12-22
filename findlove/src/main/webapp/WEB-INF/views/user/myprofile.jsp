<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::마이페이지</title>

<!-- Page link -->

<!-- CSS 및 스타일 -->
<style type="text/css">
.portfolio-item-inner {
	line-height: 1.42857143;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	transition: box-shadow .25s;
}

.portfolio-item-inner:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.row.panel-title {
	padding-top: 5px;
	border: 1px solid lightgray;
	text-align: left;
}

.row.panel-body {
	padding-top: 10px;
	border: 1px solid lightgray;
	border-top: 0;
}

.portfolio-caption span .material-icons.heart {
	color: #faadad
}

.portfolio-caption span .material-icons.star {
	color: #F7EC98
}

.pannel {
	margin-right: 10px;
}

.masthead {
	margin-bottom: 20px;
}

.table {
	width: 50%;
}

.container.top {
	margin-top: 150px;
}
</style>

</head>
<body id="page-top">

	<!-- header -->
	<c:import url="../include/header.jsp" />

	<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">마이페이지</strong>	
			</div>
		</div>
	</div>	

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group">
					<a href="myinfo.do" class="list-group-item">나의 정보</a> <a
						href="myprofile.do" class="list-group-item active">나의 프로필 설정</a> <a
						href="idealprofile.do" class="list-group-item">이상형 프로필 설정</a> <a
						href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
					<div class="card-body">
						<form action="myinfo" name="myinfo" method="post">

							<!-- 사용자 이미지 -->
							<table class="table table-bordered">
								<tr>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/team/1.jpg" alt="Responsive image" class="img-thumbnail">
										
										</a>
										<div class="desc"></div>
										</div>
									</td>
									<td>
										<!-- 이미지 업로드 -->
										<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
										<div id='View_area' style='position:relative; width: 180px; height: 180px; color: black; 
										border: 1px solid black; dispaly: inline; '>
										</div>
									</td>
								</tr>
							</table>
						</form>	
						
			
				
					
					<hr>

					<div class="card-body">
						<table class="table table-bordered">
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
				</div>
			</div>
		</div>

	</div>
	
	<!-- footer -->
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
			<script type="text/javascript">
					function previewImage(targetObj, View_area) {
						var preview = document.getElementById(View_area); //div id
						var ua = window.navigator.userAgent;

					  //ie일때(IE8 이하에서만 작동)
						if (ua.indexOf("MSIE") > -1) {
							targetObj.select();
							try {
								var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
								var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


								if (ie_preview_error) {
									preview.removeChild(ie_preview_error); //error가 있으면 delete
								}

								var img = document.getElementById(View_area); //이미지가 뿌려질 곳

								//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
								img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
							} catch (e) {
								if (!document.getElementById("ie_preview_error_" + View_area)) {
									var info = document.createElement("<p>");
									info.id = "ie_preview_error_" + View_area;
									info.innerHTML = e.name;
									preview.insertBefore(info, null);
								}
							}
					  //ie가 아닐때(크롬, 사파리, FF)
						} else {
							var files = targetObj.files;
							for ( var i = 0; i < files.length; i++) {
								var file = files[i];
								var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
								if (!file.type.match(imageType))
									continue;
								var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
								if (prevImg) {
									preview.removeChild(prevImg);
								}
								var img = document.createElement("img"); 
								img.id = "prev_" + View_area;
								img.classList.add("obj");
								img.file = file;
								img.style.width = '180px'; 
								img.style.height = '180px';
								preview.appendChild(img);
								if (window.FileReader) { // FireFox, Chrome, Opera 확인.
									var reader = new FileReader();
									reader.onloadend = (function(aImg) {
										return function(e) {
											aImg.src = e.target.result;
										};
									})(img);
									reader.readAsDataURL(file);
								} else { // safari is not supported FileReader
									//alert('not supported FileReader');
									if (!document.getElementById("sfr_preview_error_"
											+ View_area)) {
										var info = document.createElement("p");
										info.id = "sfr_preview_error_" + View_area;
										info.innerHTML = "not supported FileReader";
										preview.insertBefore(info, null);
									}
								}
							}
						}
					}
					
					</script>
	
</body>
</html>