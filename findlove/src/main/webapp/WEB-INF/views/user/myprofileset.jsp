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
	width: 120px;
	height: 120px;
	margin-top: 18px;
	margin-left: 10px;
	margin-right: 10px;
}

#bloodType {
	padding-right: 15px;
	margin-bottom: 0px;
}

#gender {
	padding-right: 15px;
	margin-bottom: 0px;
}

ul {
	list-style: none;
	padding: 0px;
	margin-bottom: 0px;
}

#style {
	width: 30%;
}

#smoking {
	padding-right: 15px;
	margin-bottom: 0px;
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
					<a href="myprofile.do?user_id=${sessionScope.user_id }" class="list-group-item active">나의 프로필</a> 
					<a href="idealprofile.do?user_id=${sessionScope.user_id }" class="list-group-item">이상형 프로필</a> 
					<a href="#" class="list-group-item">일대일 문의</a>
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
							<form action="myprofileset.do" name="myprofileset"
										method="post" enctype="multipart/form-data">
										<input type="hidden" name="user_id"
											value="${sessionScope.user_id }">
								<div class="row" style="margin-bottom: 20px;">


									<!-- 사용자 이미지 -->									
										<div class="col-md-3.5 text-center"
											style="padding-left: 15px;">
											<div class="panel panel-danger panel-pricing">
												<div id="imagePreview" style="width: 220px; height: 220px;"></div>
											</div>
										</div>


										<div class="col-md-2.5 text-center"
											style="padding-left: 0px; padding-right: 0px;">
											<!-- 닉네임 출력 -->
											<div class="credit-body text-center">
												<h2>${user.user_nicknm }</h2>
											</div>
										

											<!-- 이미지 등록 버튼 -->
											<div>
												<button type="button" id="btn" class="btn img-rounded"
													style="border: 10px;">대표 사진 등록</button>
												<input id="image" name="groupimg" type="file"
													onchange="InputImage();">
											</div>
											</div>
											</div>
											<!-- 추가 이미지 -->
											<!-- <div class="panel panel-danger panel-pricing">
												<div id="anotherImage"></div>
											</div>
										</div>
										<div class="col-md-2.5 text-center" style="padding-left: 0px;">
											<div class="panel panel-danger panel-pricing">
												<div id="anotherImage" style="margin-top: 100px;"></div>
											</div>
										</div>
										<div class="col-md-2.5 text-center" style="padding-left: 0px;">
											<div class="panel panel-danger panel-pricing">
												<div id="anotherImage" style="margin-top: 100px;"></div>
											</div>
										</div> -->



										<div class="row">

											<div class="col-md-12 mb-12" style="margin-bottom: 30px;">
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
																<td>
																	<label id="gender">
																		<input type="radio" name="gender" value="M"/>남자 
																	</label> 
																	<label id="gender">
																		<input type="radio" name="gender" value="F" />여자 
																	</label>
																</td>
															</tr>
															<tr>
																<th>혈액형</th>
																<td><label id="bloodType"><input
																		type="radio" name="blood_type" value="A"
																		checked="checked" />A </label> <label id="bloodType"><input
																		type="radio" name="blood_type" value="B" />B </label> <label
																	id="bloodType"><input type="radio"
																		name="blood_type" value="O" />O </label> <label
																	id="bloodType"><input type="radio"
																		name="blood_type" value="AB" />AB</label></td>
															</tr>
															<tr>
																<th style="padding-right: 0px;">직업/직장</th>
																<td><input type="text" name="job"
																	value="${profile.job }" style="width: 70%;"></td>
															</tr>
															<tr>
																<th style="padding-right: 0px;">학력</th>
																<td><input type="text" name="achievement"
																	value="${profile.achievement }" style="width: 70%;">
																</td>
															</tr>

														</table>
													</div>
												</div>
											</div>

											<div class="col-md-12 mb-12" style="margin-bottom: 30px;">
												<div class="card h-80">
													<div class="card-header">
														<strong>매칭 프로필</strong><br> <font size=2>매칭에
															필요한 내 정보를 입력합니다.</font>
													</div>
													<div class="card-body">

														<table class="table" style="margin-bottom: 0px;">
															<tr>
																<th>나이</th>
																<td><select name="age" value="${profile.age }">
																		<option value>선택</option>
																		<option value="15">15</option>
																		<option value="16">16</option>
																		<option value="17">17</option>
																		<option value="18">18</option>
																		<option value="19">19</option>
																		<option value="20">20</option>
																		<option value="21">21</option>
																		<option value="22">22</option>
																		<option value="23">23</option>
																		<option value="24">24</option>
																		<option value="25">25</option>
																		<option value="26">26</option>
																		<option value="27">27</option>
																		<option value="28">28</option>
																		<option value="29">29</option>
																		<option value="30">30</option>
																		<option value="31">31</option>
																		<option value="32">32</option>
																		<option value="33">33</option>
																		<option value="34">34</option>
																		<option value="35">35</option>
																		<option value="36">36</option>
																		<option value="37">37</option>
																		<option value="38">38</option>
																		<option value="39">39</option>
																		<option value="40">40</option>
																		<option value="41">41</option>
																		<option value="42">42</option>
																		<option value="43">43</option>
																		<option value="44">44</option>
																		<option value="45">45</option>
																		<option value="46">46</option>
																		<option value="47">47</option>
																		<option value="48">48</option>
																		<option value="49">49</option>
																		<option value="50">50</option>
																</select></td>
															</tr>
															<tr>
																<th>지역</th>
																<td><select name="area">
																		<option value>선택</option>
																		<option value="서울">서울</option>
																		<option value="부산">부산</option>
																		<option value="인천">인천</option>
																		<option value="광주">광주</option>
																		<option value="대전">대전</option>
																		<option value="대구">대구</option>
																		<option value="울산">울산</option>
																		<option value="경기">경기</option>
																		<option value="경기-일산 인근">경기-일산 인근</option>
																		<option value="경기-의정부 인근">경기-의정부 인근</option>
																		<option value="경기-안양 인근">경기-안양 인근</option>
																		<option value="경기-분당 인근">경기-분당 인근</option>
																		<option value="경기-수원 인근">경기-수원 인근</option>
																		<option value="강원">강원</option>
																		<option value="충북">충북</option>
																		<option value="충남">충남</option>
																		<option value="전북">전북</option>
																		<option value="전남">전남</option>
																		<option value="경북">경북</option>
																		<option value="경남">경남</option>
																		<option value="제주">제주</option>
																</select></td>
															</tr>
															<tr>
																<th>스타일<br>(3개 선택)
																</th>
																<td>
																	<ul style="margin-bottom: 0px;">
																		<li>
																		<label id="style"> 
																			<input class="checkbox" type="checkbox" name="style" value="섹시"> 섹시	
																		</label> 
																		<label id="style"> 
																			<input class="checkbox" type="checkbox" name="style" value="터프"> 터프
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="귀여운">
																				귀여운
																		</label></li>
																		<li><label id="style"> <input
																				class="checkbox" type="checkbox" name="style"
																				value="지적인"> 지적인
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="패셔너블">
																				패셔너블
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="듬직한">
																				듬직한
																		</label></li>
																		<li><label id="style"> <input
																				class="checkbox" type="checkbox" name="style"
																				value="착한"> 착한
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="유머있는">
																				유머있는
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="끈기있는">
																				끈기있는
																		</label></li>
																		<li><label id="style"> <input
																				class="checkbox" type="checkbox" name="style"
																				value="도도한"> 도도한
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="스포티">
																				스포티
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="섬세"> 섬세
																		</label></li>
																		<li><label id="style"> <input
																				class="checkbox" type="checkbox" name="style"
																				value="신중한"> 신중한
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="상냥"> 상냥
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="대범"> 대범
																		</label></li>
																		<li><label id="style"> <input
																				class="checkbox" type="checkbox" name="style"
																				value="창의적인"> 창의적인
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="낙천적인">
																				낙천적인
																		</label> <label id="style"> <input class="checkbox"
																				type="checkbox" name="style" value="열정적인">
																				열정적인
																		</label></li>
																	</ul>
																</td>
															</tr>
															<tr>
																<th style="padding-right: 0px;">키/체형</th>
																<td><input type="text" name="height"
																	style="width: 60px;" value="${profile.height }">
																	cm / <select name="bodyform">
																		<option value>선택</option>
																		<option value="스키니">스키니</option>
																		<option value="조금 마름">조금 마름</option>
																		<option value="보통">보통</option>
																		<option value="슬림 탄탄">슬림 탄탄</option>
																		<option value="조금 통통">조금 통통</option>
																		<option value="통통">통통</option>
																</select></td>
															</tr>
															<tr>
																<th>종교</th>
																<td><select name="religion">
																		<option value>선택</option>
																		<option value="기독교">기독교</option>
																		<option value="천주교">천주교</option>
																		<option value="불교">불교</option>
																		<option value="무교">무교</option>
																</select></td>
															</tr>
															<tr>
																<th>음주여부</th>
																<td><select name="drinking">
																		<option value>선택</option>
																		<option value="전혀 마시지 않아요">전혀 마시지 않아요</option>
																		<option value="어쩔 수 없을 때만 마셔요">어쩔 수 없을 때만 마셔요</option>
																		<option value="가끔 마셔요">가끔 마셔요</option>
																		<option value="어느정도 즐기는 편이에요">어느정도 즐기는 편이에요</option>
																		<option value="자주 술자리를 가져요">자주 술자리를 가져요</option>
																</select></td>
															</tr>
															<tr>
																<th>흡연여부</th>
																<td><label id="smoking"><input type="radio"
																		name="smoking" value="선택안함" checked="checked" />선택안함
																</label> <label id="smoking"><input type="radio"
																		name="smoking" value="흡연" />흡연 </label> <label id="smoking"><input
																		type="radio" name="smoking" value="비흡연" />비흡연 </label></td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
										</form>

										<a class="btn btn-primary"
											style="color: #fff; margin-bottom: 20px;"
											onclick="checkfield()">등록하기</a> <a class="btn btn-primary"
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

	<!-- 자바스크립트 -->
	<!-- 네비게이션 바 -->
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
	<!-- 이미지 등록 및 미리보기 -->
	
	
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
							text:"이미지 파일을 등록하세요.",
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
	<!-- 체크박스 개수 제한 -->
	<script>
		jQuery(document)
				.ready(
						function($) {
							$("input[name=style]:checkbox")
									.change(
											function() {
												var cnt = 3; //3개까지 선택 가능함
												if (cnt == $("input[name=style]:checkbox:checked").length) {
													$(
															"input[name=style]:checkbox:not(:checked)")
															.attr("disabled",
																	"disalbed");
												} else {
													$(
															"input[name=style]:checkbox")
															.removeAttr(
																	"disabled");
												}
											});
						});
	</script>
	<!-- 등록하기 -->
	<script>
		function checkfield() {

			var form = document.myprofileset;

			$("input:checkbox[name='style']:checkbox[value='${profile.style}']")
					.attr("checked", true);

			if ($("input[name=style]:checkbox:checked").length < 3) {
				swal({
					title:"warning!",
					text:"스타일 3가지를 체크하여 주세요.",
					icon:"error",			
				});					
				return false;
			}
			if (!form.height.value) {
				swal({
					title:"warning!",
					text:"키를 입력하여 주세요",
					icon:"error",				
				});	
				form.height.focus();
				return false;
			}
			form.submit();
			swal({
				title:"Good Job!",
				text:"회원 정보가 수정되었습니다.",
				icon:"success",				
			});	

		}
	</script>


</body>
</html>