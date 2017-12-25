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

.container.top {
	margin-top: 150px;
}

#image {
	display: none;
}

#imagePreview {
	border: 1px solid;
}

#anotherImage {
	border: 1px solid;
}
</style>

</head>
<body id="page-top">
	<%-- <c:set var="p" value="${ profile }"></c:set> --%>

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
					<div class="card-header">${sessionScope.user_id }님의 프로필입니다.</div>
					<div class="card-body">
						<section id="plans">
							<div class="container">
								<div class="row" style="margin-bottom:20px;">

									<!-- 사용자 이미지 -->
									<div class="col-md-3.5 text-center" style="padding-left: 15px;">
										<div class="panel panel-danger panel-pricing">
											<div id="imagePreview" style="width: 220px; height: 220px;"></div>
										</div>
									</div>


									<div class="col-md-2.5 text-center"
										style="padding-left: 0px; padding-right: 0px;">
										<!-- 닉네임 출력 -->
										<div class="credit-body text-center">
											<h2>${sessionScope.user_id }</h2>
										</div>

										<!-- 이미지 등록 버튼 -->
										<div>
											<button type="button" id="btn" class="btn img-rounded"
												style="border: 10px;">대표 사진 등록</button>
											<input id="image" name="groupimg" type="file"
												onchange="InputImage();">
										</div>
										<!-- 추가 이미지 -->
										<div class="panel panel-danger panel-pricing">
											<div id="anotherImage"
												style="width: 120px; height: 120px; margin-top: 18px; margin-left: 10px; margin-right: 10px;">
											</div>
										</div>
									</div>
									<div class="col-md-2.5 text-center" style="padding-left: 0px;">
										<div class="panel panel-danger panel-pricing">
											<div id="anotherImage"
												style="width: 120px; height: 120px; margin-top: 100px; margin-left: 0px; margin-right: 10px;">
											</div>
										</div>
									</div>
									<div class="col-md-2.5 text-center" style="padding-left: 0px;">
										<div class="panel panel-danger panel-pricing">
											<div id="anotherImage"
												style="width: 120px; height: 120px; margin-top: 100px; margin-left: 0px;">
											</div>
										</div>
									</div>
								</div>
								
									<div class="row">
										<div class="col-md-6 mb-6">
											<div class="card h-80">
												<div class="card-header">기본 프로필</div>
												<div class="card-body">
													<table class="table">
														<tr>
															<th>실명</th>
															<td>윤찬호</td>
														</tr>
														<tr>
															<th>닉네임</th>
															<td>류하</td>
														</tr>
														<tr>
															<th>성별</th>
															<td>남자</td>
														</tr>
														<tr>
															<th>혈액형</th>
															<td>${ p.blood_Type }B</td>
														</tr>
														<tr>
															<th>직업/직장</th>
															<td>회사원</td>
														</tr>														
														<tr>
															<th>휴대폰번호</th>
															<td>010-1234-5678</td>
														</tr>
													</table>
												</div>
											</div>
										</div>
										<!-- /.col-md-4 -->
										<div class="col-md-6 mb-6">
											<div class="card h-80">
												<div class="card-header">매칭 프로필</div>
												<div class="card-body">

													<table class="table">
														<tr>
															<th>생년월일</th>
															<td>1988.4.3</td>
														</tr>
														<tr>
															<th>지역</th>
															<td>${ p.area }서울</td>
														</tr>
														<tr>
															<th>스타일</th>
															<td>${ p.style }패션에민감한,터프,열정적인</td>
														</tr>
														<tr>
															<th>키/몸무게</th>
															<td>${ p.height }175cm/68kg</td>
														</tr>
														<tr>
															<th>종교</th>
															<td>${ p.religion }무교</td>
														</tr>
														<tr>
															<th>음주여부</th>
															<td>${ p.smoking }즐겨마심</td>
														</tr>
														<tr>
															<th>흡연여부</th>
															<td>${ p.smoking }흡연</td>
														</tr>
													</table>
												</div>
											</div>
										</div>										
									</div>
									<a class="btn btn-primary"
											style="color: #fff; margin-bottom: 20px;"
											onclick="location.href='myprofileset.do'">수정하기</a> <a
											class="btn btn-primary"
											style="color: #fff; margin-bottom: 20px;"
											onclick="history.go(-1)">취소</a>
							</div>
							</section>
					</div>

					<!-- footer -->

					<!-- 자바스크립트 -->
					<script type="text/javascript">
						$(function() {
							$('#mainNav').css('background-color', '#faadad');
						});
					</script>
					<script type="text/javascript">
						$(function() {
							$('#btn').click(function(e) {
								e.preventDefault();
								$('#image').click();
							});
						});

						var InputImage = (function loadImageFile() {
							if (window.FileReader) {
								var ImagePre;
								var ImgReader = new window.FileReader();
								var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
								ImgReader.onload = function(Event) {
									if (!ImagePre) {
										var newPreview = document
												.getElementById("imagePreview");
										ImagePre = new Image();
										ImagePre.style.width = "100%";
										ImagePre.style.height = "100%";
										newPreview.appendChild(ImagePre);
									}
									ImagePre.src = Event.target.result;
								};

								return function() {
									var img = document.getElementById("image").files;

									if (!fileType.test(img[0].type)) {
										alert("이미지 파일을 업로드 하세요");
										return;
									}
									ImgReader.readAsDataURL(img[0]);
								}
							}
							document.getElementById("imagePreview").src = document
									.getElementById("image").value;

						})();
					</script>
</body>
</html>