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
	width: 120px; height: 120px; margin-top: 18px; margin-left: 10px; margin-right: 10px;
}

#bloodType{
	padding-right:15px;
	margin-bottom:0px;
}
#gender{
	padding-right:15px;
	margin-bottom:0px;
}

ul{
   list-style:none;
   padding:0px;
   margin-bottom:0px;
   }

#style{
	width : 30%;

}
#smoking{
	padding-right:15px;
	margin-bottom:0px;
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
					<a href="myinfo.do?user_id=${sessionScope.user_id }" class="list-group-item">나의 정보</a> <a
						href="myprofile.do" class="list-group-item active">나의 프로필</a> <a
						href="idealprofile.do" class="list-group-item">이상형 프로필</a> <a
						href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header"><strong>${sessionScope.user_id }님의프로필입니다.</strong></div>
					<div class="card-body">
						<section id="plans">
							<div class="container">
								<div class="row" style="margin-bottom: 20px;">

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
											<div id="anotherImage">
											</div>
										</div>
									</div>
									<div class="col-md-2.5 text-center" style="padding-left: 0px;">
										<div class="panel panel-danger panel-pricing">
											<div id="anotherImage"
												style="margin-top: 100px;">
											</div>
										</div>
									</div>
									<div class="col-md-2.5 text-center" style="padding-left: 0px;">
										<div class="panel panel-danger panel-pricing">
											<div id="anotherImage"
												style="margin-top: 100px;">
											</div>
										</div>
									</div>
								</div>
								
								<form action="" name="myprofileset" method="post">							

								<div class="row">
									
									<div class="col-md-12 mb-12" style="margin-bottom:30px;">
										<div class="card h-80">
										
											<div class="card-header"><strong>
											기본 프로필</strong><br>
											<font size=2>상대에게 나를 표현하는 기본 프로필 정보입니다.</font>
											</div>
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
														<td>
														<label id = "gender"><input type="radio" name="gender" value="male" checked="checked" />남자 </label>
														<label id = "gender"><input type="radio" name="gender" value="female" />여자 </label>
														</td> 
													</tr>
													<tr>
														<th>혈액형</th>
														<td>
														<label id = "bloodType"><input type="radio" name="blood_Type" value="A"	checked="checked" />A </label>
														<label id = "bloodType"><input type="radio"	name="blood_Type" value="B" />B </label>
														<label id = "bloodType"><input type="radio"	name="blood_Type" value="O" />O </label>
														<label id = "bloodType"><input type="radio"	name="blood_Type" value="AB" />AB</label>
														</td>
													</tr>
													<tr>
														<th style="padding-right:0px;">직업/직장</th>
														<td>
														<input type="text" name="job" style="width:70%;">
														</td>
													</tr>
													<tr>
														<th style="padding-right:0px;">학력</th>
														<td>
														<input type="text" name="acheievement" style="width:70%;">
														</td>
													</tr>
													<tr>
														<th>휴대폰</th>
														<td><input type="text" name="job" style="width:70%;"></td>
													</tr>
												</table>
											</div>
										</div>
									</div>									
													
									<div class="col-md-12 mb-12" style="margin-bottom:30px;">
										<div class="card h-80">
											<div class="card-header"><strong>매칭 프로필</strong><br>
											<font size=2>매칭에 필요한 내 정보를 입력합니다.</font>												
											</div>
											<div class="card-body">

												<table class="table" style="margin-bottom:0px;">
													<tr>
														<th>생년월일</th>
														<td>
														<select name = "birthday_year">
															<option value>선택</option>
															<option value="2000">2000</option>
															<option value="1999">1999</option>
															<option value="1998">1998</option>
															<option value="1997">1997</option>
															<option value="1996">1996</option>
															<option value="1995">1995</option>
															<option value="1994">1994</option>
															<option value="1993">1993</option>
															<option value="1992">1992</option>
															<option value="1991">1991</option>
															<option value="1990">1990</option>
															<option value="1989">1989</option>
															<option value="1988">1988</option>
															<option value="1987">1987</option>
															<option value="1986">1986</option>
															<option value="1985">1985</option>
															<option value="1984">1984</option>
															<option value="1983">1983</option>
															<option value="1982">1982</option>
															<option value="1981">1981</option>
															<option value="1980">1980</option>
															<option value="1979">1979</option>
															<option value="1978">1978</option>
															<option value="1977">1977</option>
															<option value="1976">1976</option>
															<option value="1975">1975</option>
															<option value="1974">1974</option>
															<option value="1973">1973</option>
															<option value="1972">1972</option>
															<option value="1971">1971</option>
															<option value="1970">1970</option>
															<option value="1969">1969</option>
															<option value="1968">1968</option>
															<option value="1967">1967</option>
															<option value="1966">1966</option>
															<option value="1965">1965</option>
															<option value="1964">1964</option>
															<option value="1963">1963</option>
															<option value="1962">1962</option>
															<option value="1961">1961</option>
															<option value="1960">1960</option>
															<option value="1959">1959</option>
															<option value="1958">1958</option>
															<option value="1957">1957</option>
															<option value="1956">1956</option>
															<option value="1955">1955</option>
															<option value="1954">1954</option>
															<option value="1953">1953</option>
															<option value="1952">1952</option>
															<option value="1951">1951</option>
															<option value="1950">1950</option>															
														</select>							
														<select name = "birthday_month">
															<option value>선택</option>
															<option value="1">1월</option>
															<option value="2">2월</option>
															<option value="3">3월</option>
															<option value="4">4월</option>
															<option value="5">5월</option>
															<option value="6">6월</option>
															<option value="7">7월</option>
															<option value="8">8월</option>
															<option value="9">9월</option>
															<option value="10">10월</option>
															<option value="11">11월</option>
															<option value="12">12월</option>
														</select>
														<select name ="birthday_date">
															<option value>선택</option>
															<option value="1">1일</option>
															<option value="2">2일</option>
															<option value="3">3일</option>
															<option value="4">4일</option>
															<option value="5">5일</option>
															<option value="6">6일</option>
															<option value="7">7일</option>
															<option value="8">8일</option>
															<option value="9">9일</option>
															<option value="10">10일</option>
															<option value="11">11일</option>
															<option value="12">12일</option>
															<option value="13">13일</option>
															<option value="14">14일</option>
															<option value="15">15일</option>
															<option value="16">16일</option>
															<option value="17">17일</option>
															<option value="18">18일</option>
															<option value="19">19일</option>
															<option value="20">20일</option>
															<option value="21">21일</option>
															<option value="22">22일</option>
															<option value="23">23일</option>
															<option value="24">24일</option>
															<option value="25">25일</option>
															<option value="26">26일</option>
															<option value="27">27일</option>
															<option value="28">28일</option>
															<option value="29">29일</option>
															<option value="30">30일</option>
															<option value="31">31일</option>
														</select>
														</td>
													</tr>
													<tr>
														<th>지역</th>
														<td>
														<select name ="area">
															<option value>선택</option>
															<option value="1">서울</option>
															<option value="2">부산</option>
															<option value="3">인천</option>
															<option value="4">광주</option>
															<option value="5">대전</option>
															<option value="6">대구</option>
															<option value="7">울산</option>
															<option value="8">경기</option>
															<option value="9">경기-일산 인근</option>
															<option value="10">경기-의정부 인근</option>
															<option value="11">경기-안양 인근</option>
															<option value="12">경기-분당 인근</option>
															<option value="13">경기-수원 인근</option>
															<option value="14">강원</option>
															<option value="15">충북</option>
															<option value="16">충남</option>
															<option value="17">전북</option>
															<option value="18">전남</option>
															<option value="19">경북</option>
															<option value="20">경남</option>
															<option value="21">제주</option>												
															</select>
														</td>																												
													</tr>
													<tr>
														<th>스타일<br>(3개 선택)</th>
														<td>
														<ul style="margin-bottom:0px;">
															<li>
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="1">
																섹시
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="2">
																터프
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="3">
																귀여운
															</label>
															</li>
															<li>
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="4">
																지적인
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="5">
																패셔너블
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="6">
																듬직한
															</label>
															</li>
															<li>
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="7">
																착한
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="8">
																유머있는
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="9">
																끈기있는
															</label>
															</li>
															<li>
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="10">
																도도한
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="11">
																스포티
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="12">
																섬세
															</label>
															</li>
															<li>
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="13">
																신중한
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="14">
																상냥
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="15">
																대범
															</label>
															</li>
															<li>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="16">
																창의적인
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="17">
																낙천적인
															</label>															
															<label id="style">
																<input class="checkbox" type="checkbox" name="style" value="18">
																열정적인
															</label>
															</li>															
														</ul>
														</td>
													</tr>
													<tr>
														<th style="padding-right:0px;">키/체형</th>
														<td>
														<input type="text" name="height" style="width:60px;"> cm /
														<select name ="bodyform">
															<option value>선택</option>
															<option value="1">스키니</option>
															<option value="2">조금 마름</option>
															<option value="3">보통</option>
															<option value="4">슬림 탄탄</option>
															<option value="5">조금 통통</option>
															<option value="5">통통</option>																										
														</select>
														</td>
													</tr>													
													<tr>
														<th>종교</th>
														<td>
														<select name ="religion">
															<option value>선택</option>
															<option value="1">기독교</option>
															<option value="2">천주교</option>
															<option value="3">불교</option>
															<option value="4">무교</option>																										
															</select>
														</td>
													</tr>
													<tr>
														<th>음주여부</th>
														<td>
														<select name ="drinking">
															<option value>선택</option>
															<option value="1">전혀 마시지 않아요</option>
															<option value="2">어쩔 수 없을 때만 마셔요</option>
															<option value="3">가끔 마셔요</option>
															<option value="4">어느정도 즐기는 편이에요</option>
															<option value="5">자주 술자리를 가져요</option>																										
														</select>
														</td>
													</tr>
													<tr>
														<th>흡연여부</th>
														<td>
														<label id = "smoking"><input type="radio"name="smoking" value="notselect" checked="checked"  />선택안함 </label>
														<label id = "smoking"><input type="radio" name="smoking" value="smoking"/>흡연 </label>
														<label id = "smoking"><input type="radio" name="smoking" value="nosmoking" />비흡연 </label>														
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								<a class="btn btn-primary"
									style="color: #fff; margin-bottom: 20px;"
									onclick="submit()">등록하기</a> <a
									class="btn btn-primary"
									style="color: #fff; margin-bottom: 20px;"
									onclick="history.go(-1)">취소</a>
								</form>
							</div>
						</section>
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
										alert("이미지 파일을 업로드 하세요");
										return;
									}
									ImgReader.readAsDataURL(img[0]);
								}
							}
							document.getElementById("imagePreview").src = document.getElementById("image").value;

						})();
					</script>
					<!-- 체크박스 개수 제한 -->
					<script>
						jQuery(document).ready(function($){
							$("input[name=style]:checkbox").change(function(){
								var cnt = 3; //3개까지 선택 가능함
								if(cnt == $("input[name=style]:checkbox:checked").length){
									$("input[name=style]:checkbox:not(:checked)").attr("disabled", "disalbed");
								}else{
									$("input[name=style]:checkbox").removeAttr("disabled");
								}			
							});
						});
					</script>
					<!-- 등록하기 -->
					<script>
					function submit(){
						
					}
					</script>
					
</body>
</html>