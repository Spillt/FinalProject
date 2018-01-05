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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.fileDrop{
	width:200px;
	height:300px;
	border: 1px dotted blue;
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
					<a href="myinfo.do?user_id=${sessionScope.user_id }" class="list-group-item">나의 정보</a> 
					<a href="myprofile.do?user_id=${sessionScope.user_id }"	class="list-group-item active">나의 프로필</a> 
					<a href="idealprofile.do?user_id=${sessionScope.user_id }" class="list-group-item">이상형 프로필</a>
					<a href="InqList.do?userId=${user_id }" class="list-group-item">일대일 문의</a>
					<a href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<strong>${user.user_nicknm }</strong>님의 프로필입니다.
					</div>
					<div class="card-body">
						<section id="plans">
							<div class="container">							
										<input type="hidden" name="user_id"
											value="${sessionScope.user_id }">
								<%-- <div class="row" style="margin-bottom: 20px;">

									<!-- 사용자 이미지 -->
									<div class="col-md-3.5 text-center" style="padding-left: 15px;">
										<div class="panel panel-danger panel-pricing">
											<div id="imagePreview" style="width: 220px; height: 220px;"></div>
										</div>
									</div>


									<div class="col-md-2.5 text-center"
										style="padding-left: 0px; padding-right: 0px;">
										
										<!-- 이미지 등록 버튼 -->
										<div>
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
								</div> --%>
								<div class="row">
									<div class="col-6">
										<div class="card h-80">
											<div class="card-header">
												<strong> 기본 프로필</strong><br> <font size=2>상대에게
													나를 표현하는 기본 프로필 정보입니다.</font>
											</div>
											<div class="card-body">
												<table class="table">
													<tr>
														<th>실명</th>
														<td>${user.user_nm }</td>
													</tr>
													<tr>
														<th>닉네임</th>
														<td>${user.user_nicknm }</td>
													</tr>
													<tr>
														<th>성별</th>
														<td>${profile.gender }</td>
													</tr>
													<tr>
														<th>혈액형</th>
														<td>${profile.blood_type }</td>
													</tr>
													<tr>
														<th>직업/직장</th>
														<td>${profile.job }</td>
													</tr>

												</table>
											</div>
										</div>
									</div>
									<div class="col-6">
									
										<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
										  <div class="carousel-inner" role="listbox">
										  	<c:forEach items="${imageList}" var="picture"  varStatus="status">
										  		<c:if test='${status.index eq 0}'>
										  			<div class="carousel-item active">
												      <img class="d-block img-fluid" src="/findlove/uploadfiles/profile/${picture.picture_nm }" alt="no image">
												    </div>
												</c:if>
												<c:if test='${status.index ne 0}'>
													<div class="carousel-item">
												      <img class="d-block img-fluid" src="/findlove/uploadfiles/profile/${picture.picture_nm }" alt="no image">
												    </div>
												</c:if>
										  	</c:forEach>
										  </div>
										  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="sr-only">Previous</span>
										  </a>
										  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="sr-only">Next</span>
										  </a>
										</div>
									
									</div>
								
								
								</div>

								<div class="row" style="margin-top: 10px">
									<!-- /.col-md-4 -->
									<div class="col-12">
										<div class="card h-80">
											<div class="card-header">
												<strong>매칭 프로필</strong><br> <font size=2>매칭에 필요한
													내 정보입니다.</font>
											</div>
											<div class="card-body">

												<table class="table">
													<tr>
														<th>나이</th>
														<td>${profile.age }</td>
													</tr>
													<tr>
														<th>지역</th>
														<td>${profile.area }</td>
													</tr>
													<tr>
														<th>스타일</th>
														<td>${profile.style}</td>
													</tr>
													<tr>
														<th>키/체형</th>
														<td>${ profile.height }cm/${profile.bodyform }</td>
													</tr>
													<tr>
														<th>종교</th>
														<td>${ profile.religion }</td>
													</tr>
													<tr>
														<th>음주여부</th>
														<td>${ profile.drinking }</td>
													</tr>
													<tr>
														<th>흡연여부</th>
														<td>${ profile.smoking }</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								<a class="btn btn-primary"
									style="color: #fff; margin-bottom: 20px;"
									href='myprofilesetview.do?user_id=${user.user_id }'>수정하기</a> <a
									class="btn btn-primary"
									style="color: #fff; margin-bottom: 20px;"
									onclick="history.go(-1)">취소</a>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- footer -->
	<hr>
	<c:import url="../include/footer.jsp" />

	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
	<!-- <script>
		$(document).ready(function() {
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				//드래그된 파일 정보
				var files = event.originalEvent.dateTransfer.files;
				//첫번째 파일
				var file = files[0];
				//콘솔에서 파일정보 확인
				console.log(file);

				var formData = new FormData();

				formData.append("file", file);

				$.ajax({
					type : "post",
					url : "${path}/uploadfiles",
					data : formData,
					dataType : "text",
					processData : false,
					contentType : false,
					success : function(data) {
						alert(data);
					}
				});
			});
		});
		
	</script> -->


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
						swal({
							title:"warning!",
							text:"이미지 파일을 업로드 하세요.",
							icon:"error",				
						});							
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