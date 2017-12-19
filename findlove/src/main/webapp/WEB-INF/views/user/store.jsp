<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::스토어</title>

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
	margin-top: 100px;
}



</style>

</head>
<body id="page-top">
	<c:import url="../include/header.jsp" />

	<!-- Portfolio Grid -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-center">
				<!-- <img class="img-fluid" src="/findlove/resources/img/ad/ad-banner.jpg"> -->
			</div>
		</div>
	</div>

	<br>
	<h1 align="center">마이페이지</h1>
	<br>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group" style="margin-bottom: 100px;">
					<a href="myinfo.do" class="list-group-item">나의 정보</a> <a
						href="myprofile.do" class="list-group-item">나의 프로필 설정</a> <a
						href="idealprofile.do" class="list-group-item">이상형 프로필 설정</a> <a
						href="store.do" class="list-group-item active">스토어</a>
				</div>
				<div class="list-group" style="margin-bottom: 24px;">
				<span class="list-group-item">보유별사탕 개수</span> 
				<span class="list-group-item"></span> 				
				</div>
				<div class="btn" style="padding-left: 75px;">
					<button>이전</button>
					<button>다음</button>
				</div>
				<div class="list-group">
				<a class="list-group-item">별사탕 이용내역</a>
				<div class="inner" style="width:1275px; height:350px; margin-left:0px;">
					<ul class="list-group" style="position: relative; height: 255px; float: left; width: 255px;">
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>					
					</ul>
					<ul class="list-group">
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>					
					</ul>
					<ul class="list-group">
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>					
					</ul>
					<ul class="list-group">
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>					
					</ul>
					<ul class="list-group">
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>
						<li class="row"></li>					
					</ul>
				</div>
				</div>
				
			</div>
			


			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">1. 별사탕 개수 선택</div>
					<div class="card-body">
						<form action="myinfo" name="myinfo" method="post">

							<!-- 사용자 이미지 -->
							<table class="table table-bordered">
								<tr>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/konpeito.jpg" alt="" width="120"
										height="120">
										</a>
										<div class="center">10개(￦1,000)</div>										
										</div>
									</td>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/konpeito.jpg" alt="" width="120"
										height="120">
										</a>
										<div class="desc">20개+보너스2개(￦2,000)</div>
										</div>
									</td>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/konpeito.jpg" alt="" width="120"
										height="120">
										</a>
										<div class="desc">30개+보너스5개(￦3,000)</div>
										</div>
									</td>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/konpeitos.jpg" alt="" width="120"
										height="120">
										</a>
										<div class="desc">50개+보너스10개(￦5,000)</div>
										</div>
									</td>
									<td>
										<div class="image1">
										<a target="_blank" href="img_fjords.jpg"> <img
										src="/findlove/resources/img/konpeitos.jpg" alt="" width="120"
										height="120">
										</a>
										<div class="desc">100개+보너스20개(￦10,000)</div>
										</div>
									</td>
								</tr>
							</table>
						</form>
						</div>
						</div>
						<div class="card card-outline-secondary my-4">
						<div class="card-header">2. 포인트 전환</div>
						<div class="card-body">
						<form action="mypoint" name="mypoint" method="post">
						<table class="table table-bordered">
							<tr>
								<td>
								</td>
							</tr>
						</table>
						</form>
						</div>
						</div>		

					<div class="card card-outline-secondary my-4">
						<div class="card-header">3. 주문 금액</div>
						<table class="table table-bordered">
							
						</table>
						</div>						
						
						<div class="card card-outline-secondary my-4">
						<div class="card-header">4. 결제 수단 선택</div>
						<ul class="payment_type">
							<li class="phone active" data-payment_type="phone"></li>
							<li class="credit" data-payment_type="credit"></li>
							<li class="vbank" data-payment_type="vbank"></li>					
						</ul>



						<a class="button" onclick="checkfield()">Register</a> <a
							class="button" onclick="">Cancel</a>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>