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


ul{
   list-style:none;
   padding:0px;
   margin-bottom:0px;
   }
   
#age{
	width : 30%;
}
#style{
	width : 30%;

}
#height {
	width : 22%;
}
#bodyform{
	width : 22%;
}
#religion{
	width : 40%;
}

#drinking{
	width : 40%;
}
#smoking{
	width: 40%;
}
#area{
	width: 30%;
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
						href="myprofile.do?user_id=${sessionScope.user_id }" class="list-group-item">나의 프로필</a> <a
						href="idealprofile.do?user_id=${sessionScope.user_id }" class="list-group-item active">이상형 프로필
						</a> 
						<a href="#" class="list-group-item">일대일 문의</a>
						<a href="store.do" class="list-group-item">스토어</a>
				</div>
			</div>


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header"><strong>내 이상형</strong><br>
					<font size=2>내가 입력한 프로필 항목에 대해 이상형 조건을 설정할 수 있습니다.</font>
					</div>
					<div class="card-body">
						<section id="plans">
							<div class="container">
								<div class="row">
									<div class="col-md-12 mb-12" style="margin-bottom: 20px;">
										<div class="card h-80">
											<div class="card-body">
												<table class="table">
													<tr>
														<th>나이</th>
														<td>
														<ul style="margin-bottom:0px;">
															<li>
															<label id="age"><input class="radio" type="radio" name="age" value="1" checked="checked">상관 없음</label>
															<label id="age"><input class="radio" type="radio" name="age" value="2" checked="checked">4살 이하 연하</label>
															<label id="age"><input class="radio" type="radio" name="age" value="3" checked="checked">2살~3살 연하</label>
															</li>
															<li>
															<label id="age"><input class="radio" type="radio" name="age" value="4" checked="checked">동갑</label>
															<label id="age"><input class="radio" type="radio" name="age" value="5" checked="checked">2살~3살 연상</label>
															<label id="age"><input class="radio" type="radio" name="age" value="6" checked="checked">4살 이상 연상</label>															
															</li>
														</ul>
														</td>
													</tr>
													<tr>
														<th>지역</th>
														<td>
														<ul style="margin-bottom:0px;">
															<li>
															<label id="area"><input class="radio" type="radio" name="area" value="1" checked="checked">상관 없음</label>
															<label id="area"><input class="radio" type="radio" name="area" value="2">같은 도시의 이성</label>
															<label id="area"><input class="radio" type="radio" name="area" value="2">인근 도시까지 선호</label>																					
															</li>
														</ul>
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
														<th>키</th>
														<td>
														<ul style="margin-bottom:0px;">
														<li>
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="1">
																상관없음
															</label>
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="2">
																154이하
															</label>															
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="3">
																155~159
															</label>															
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="4">
																160~164
															</label>
														</li>
														<li>
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="5">
																165~169
															</label>
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="6">
																170~174
															</label>
															<label id="height">
																<input class="checkbox" type="checkbox" name="height" value="7">
																175이상
															</label>
														</li>
														</ul>
														</td>
													</tr>
													<tr>
														<th>체형</th>
														<td>
														<ul style="margin-bottom:0px;">
														<li>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="1">
																상관없음
															</label>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="2">
																스키니
															</label>															
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="3">
																조금 마름
															</label>															
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="4">
																보통
															</label>
														</li>
														<li>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="5">
																슬림 탄탄
															</label>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="6">
																글래머
															</label>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="7">
																조금 통통
															</label>
															<label id="bodyform">
																<input class="checkbox" type="checkbox" name="bodyform" value="8">
																통통
															</label>
														</li>
														</ul>
														</td>
													</tr>
													<tr>
														<th>종교</th>
														<td>
														<ul style="margin-bottom:0px;">
															<li>
															<label id="religion"><input class="radio" type="radio" name="religion" value="1" checked="checked">상관 없음</label>
															<label id="religion"><input class="radio" type="radio" name="religion" value="2">같은 종교인이면 더 좋아요</label>																					
															</li>
														</ul>
														
														</td>
													</tr>
													<tr>
														<th>음주여부</th>
														<td>
														<ul style="margin-bottom:0px;">
														<li>
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="1">
																상관 없음
															</label>
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="2">
																전혀 마시지 않아요
															</label>
														</li>
														<li>
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="3">
																어쩔수 없을 때만 마셔요
															</label>														
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="4">
																가끔 마셔요
															</label>
														</li>
														<li>
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="5">
																어느정도 즐기는 편이에요
															</label>
															<label id="drinking">
																<input class="checkbox" type="checkbox" name="drinking" value="6">
																자주 술자리를 가져요
															</label>
															
														</li>
														</ul>
														</td>
													</tr>
													<tr>
														<th>흡연여부</th>
														<td>
														<ul style="margin-bottom:0px;">
															<li>
															<label id="smoking"><input class="radio" type="radio" name="smoking" value="1" checked="checked">상관 없음</label>
															<label id="smoking"><input class="radio" type="radio" name="smoking" value="2">비흡연자만 찾아요</label>
															</li>
														</ul>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

									<a class="btn btn-primary"
										style="color: #fff; margin-left: 20px; margin-bottom: 20px;"
										onclick="location.href='idealprofileset.do'">수정하기</a> <a
										class="btn btn-primary"
										style="color: #fff; margin-left: 5px; margin-bottom: 20px;"
										onclick="history.go(-1)">취소</a>
								</div>
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
	<!-- 헤더 변경 -->
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
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



</body>
</html>