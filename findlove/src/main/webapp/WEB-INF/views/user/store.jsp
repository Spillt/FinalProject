<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::스토어</title>

<!-- Page link -->
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/credit.css">


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

.container.middle {
	margin: 0px;
}

a.buy-btn {
	cursor: pointer;
	color: #fff !important;
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

	<!-- <br>
	<h1 align="center">마이페이지</h1>
	<br> -->

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group" style="margin-bottom: 100px;">
					<a href="myinfo.do?user_id=${sessionScope.user_id }" class="list-group-item">나의 정보</a> <a
						href="myprofile.do" class="list-group-item">나의 프로필</a> <a
						href="idealprofile.do" class="list-group-item">이상형 프로필</a> <a
						href="store.do" class="list-group-item active">스토어</a>
				</div>
				<div class="list-group" style="margin-bottom: 24px;">
					<span class="list-group-item" align="center">보유별사탕 개수</span> <span
						class="list-group-item"><img
						src="/findlove/resources/img/credit/konpeito.png"
						style="margin-left: 15px; width: 90px; height: 60px;"><font
						size="6";> 25</font></span>
				</div>
				<div class="btn" style="padding-left: 40px;">
					<button class="btn btn-danger">이전</button>
					<button class="btn btn-danger">다음</button>
				</div>
				<div class="list-group">
					<a class="list-group-item" align="center">별사탕 이용내역</a>
					<div class="inner"
						style="width: 1275px; height: 350px; margin-left: 0px;">
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
					<div class="card-body" style="margin-top: 0px; margin-bottom: 0px;">
						<form action="myinfo" name="myinfo" method="post">

							<section id="plans">
								<div class="container">
									<div class="row">

										<!-- item -->
										<div class="col-md-4 text-center">
											<div class="panel panel-danger panel-pricing">
												<div class="panel-body text-center">
													<img src="/findlove/resources/img/credit/konpeito.png"
														alt="" style="margin-bottom: 15px;"> <br> <span>10개</span>
												</div>
												<ul class="list-group text-center">
													<li class="list-group-item">￦ 1,000</li>
												</ul>
												<div class="panel-footer">
													<a class="btn btn-lg btn-block btn-danger buy-btn"
														data-price=1000>BUY NOW!</a>
												</div>
											</div>
										</div>

										<!-- item -->
										<div class="col-md-4 text-center">
											<div class="panel panel-danger panel-pricing">
												<div class="panel-body text-center">
													<img src="/findlove/resources/img/credit/konpeito.png"
														alt="" style="margin-bottom: 15px;"> <br> <span>30개(+5)</span>
												</div>
												<ul class="list-group text-center">
													<li class="list-group-item">￦ 3,000</li>
												</ul>
												<div class="panel-footer">
													<a class="btn btn-lg btn-block btn-danger buy-btn"
														data-price=3000>BUY NOW!</a>
												</div>
											</div>
										</div>

										<!-- item -->
										<div class="col-md-4 text-center">
											<div class="panel panel-danger panel-pricing">
												<div class="panel-body text-center">
													<img src="/findlove/resources/img/credit/konpeito.png"
														alt="" style="margin-bottom: 15px;"> <br> <span>100개(+20)</span>
												</div>
												<ul class="list-group text-center">
													<li class="list-group-item">￦ 10,000</li>
												</ul>
												<div class="panel-footer">
													<a class="btn btn-lg btn-block btn-danger buy-btn"
														data-price=10000>BUY NOW!</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</form>
					</div>
				</div>
				<!-- /item -->
				<div class="card card-outline-secondary my-4">
					<div class="card-header">2. 포인트 사용</div>
					<div class="card-body">
						<!-- <form action="mypoint" name="mypoint" method="post"> -->
							<section id="plans" style="padding: 0px;">
								<div class="container">
									<div class="row">
										<div class="col-md-3 text-center" style="padding: 0px;">
											<ul class="list-group text-center">
												<li class="list-group-item"
													style="padding: auto; border: 0px;">내 보유 포인트 :</li>
											</ul>
										</div>
										<div class="col-md-3 text-center" style="padding-left: 0px;">
											<ul class="list-group text-center"
												style="padding-top: 11px; padding-bottom: 11px;">
												<li id="myPoint" class="list-group-item"
													style="padding: 0px;" data-point="1000">1,000</li>
											</ul>
										</div>
										<div class="col-md-3 text-center"
											style="padding-top: 11px; padding-bottom: 11px; padding-left: 0px; padding-right: 0px;">
											<input type="text" name="point_cnt" id="point_cnt"
												style="width: 150px;" />
										</div>
										<div class="col-md-1 text-center"
											style="padding-top: 7px; padding-right: 0px; padding-left: 0px;">
											<button type="button" class="btn btn-danger" id="discountBtn">사용</button>

										</div>
										<div class="col-md-2 text-center"
											style="padding-top: 7px; padding-right: 0px; padding-left: 0px;">
											<button class="btn btn-danger">전액사용</button>

										</div>
									</div>
								</div>
							</section>
						<!-- </form> -->
					</div>
				</div>
				<div class="card card-outline-secondary my-4">
					<div class="card-header">3. 주문 금액</div>
					<!-- <table class="table table-bordered">
						
					</table> -->
					<div class="card-body">
						<div class="container credit">
							<div class="row">
								<div class="panel panel-danger panel-pricing">
									<div class="credit-body text-center">총 주문 금액</div>
									<div class="price-body text-center" id="default-price">0</div>
								</div>
								<div class="panel panel-danger panel-pricing">
									<div class="calculate-body text-center">-</div>
									
								</div>
								<div class="panel panel-danger panel-pricing">
									<div class="credit-body text-center">포인트</div>								
									<div class="price-body text-center" id="using-point">0</div>
								</div>
								<div class="panel panel-danger panel-pricing">
									<div class="calculate-body text-center">=</div>
									
								</div>
								<div class="panel panel-danger panel-pricing">
									<div class="credit-body text-center">최종 결제 금액</div>							
									<div class="price-body text-center" id="total-price">0</div>
								</div>
						</div>
					</div>
				</div>
				</div>
			
		



		<div class="card card-outline-secondary my-4">
			<div class="card-header">4. 결제 수단 선택</div>
			<form action="credit" name="credit" method="post">
				<section id="plans">
					<div class="container">
						<div class="row">

							<!-- 신용카드 -->
							<div class="col-md-4 text-center">
								<div class="panel panel-danger panel-pricing">
									<div class="panel-body text-center">
										<img src="/findlove/resources/img/credit/card.png" alt=""
											style="width: 152px; height: 180px;"> <br>
									</div>
									<div class="panel-footer"></div>
								</div>
							</div>
							<!-- 모바일 -->
							<div class="col-md-4 text-center">
								<div class="panel panel-danger panel-pricing">
									<div class="panel-body text-center">
										<img src="/findlove/resources/img/credit/phone.png" alt=""
											style="width: 152px; height: 180px;"> <br>
									</div>
									<ul class="list-group text-center">
									</ul>
									<div class="panel-footer"></div>
								</div>
							</div>
							<!-- 가상계좌 -->
							<div class="col-md-4 text-center">
								<div class="panel panel-danger panel-pricing">
									<div class="panel-body text-center">
										<img src="/findlove/resources/img/credit/virtual account.png"
											alt="" style="width: 152px; height: 180px;"> <br>
									</div>
									<ul class="list-group text-center">
									</ul>
									<div class="panel-footer"></div>
								</div>
							</div>
						</div>
					</div>
				</section>



			</form>
			<!-- <ul class="payment_type">
							<li class="phone active" data-payment_type="phone"></li>
							<li class="credit" data-payment_type="credit"></li>
							<li class="vbank" data-payment_type="vbank"></li>					
						</ul> -->
		</div>
	</div>

	<!-- footer -->


	<!-- 자바스크립트 -->

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});

		$('.buy-btn').on('click', function() {
			$('#default-price').text($(this).data('price'));
			updateTotalPrice();
		});

		$('#discountBtn').on('click', function() {
			if ($('#myPoint').data('point') < $('#point_cnt').val()) {
				alert("다시 입력해주세요.");
				$('#point_cnt').val('');
			} else {
				$('#using-point').text($('#point_cnt').val());
				updateTotalPrice();
			}
		});

		function updateTotalPrice() {
			$('#total-price').text(
					$('#default-price').text() - $('#using-point').text());
		}
	</script>
</body>
</html>