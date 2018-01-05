<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 시작하기</title>
<style>
header.subhead {
	height: 76px
}

@media ( min-width :992px) {
	header.subhead {
		height: 123px
	}
}

.matching-launcher {
	background-color: gray;
	height: 200px;
}

.box {
	width: 300px;
	height: 450px;
	margin: 3em auto;
	background: #fff;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	position: relative;
	z-index: 90;
	border-radius: 0;
}

.ribbon-wrapper-corner {
	width: 85px;
	height: 88px;
	overflow: hidden;
	position: absolute;
	top: -3px;
	right: -3px;
}

.ribbon-corner {
	color: #fff;
	text-align: center;
	text-shadow: rgba(255, 255, 255, 0.5) 0 1px 0;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
	position: relative;
	padding: 7px 0;
	left: -5px;
	top: 15px;
	width: 120px;
	background-color: #791d0d;
	-webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
	background: #FAADAD
}

.card-container {
	display: inline-block;
	padding: 0 12px;
	perspective: 900px;
	text-align: center;
}

.card {
	width: 300px;
	height: 440px;
	margin: 3em auto;
	background-color: #fff;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	position: relative;
	width: 300px;
	height: 430px;
	transition: all 0.6s ease;
	transform-style: preserve-3d;
}

.front, .back {
	position: absolute;
	background-color: #fff;
	top: 0;
	left: 0;
	width: 300px;
	height: 430px;
	color: black;
	box-shadow: 0 27px 55px 0 rgba(0, 0, 0, 0.3), 0 17px 17px 0
		rgba(0, 0, 0, 0.15);
	backface-visibility: hidden;
}

.front {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 30px;
}

.back {
	font-size: 18px;
}

.card-container:hover .card {
	transform: rotateY(180deg);
}

.back {
	transform: rotateY(180deg);
}
.card-back-text {
	height: 200px;
	padding: 25px;
	text-align: left;
}

.btn.start-matching-btn {
	border-radius: 0 !important;
	height: 61px;
	padding-left: 55px !important;
}

.badge.badge-point {
	margin-left: 10px;
	background-color: gray;
	color: #fff;
	padding: 5px;
	padding-left: 8px;
	padding-right: 8px;
	border-radius: 8px;
}

</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<div class="container" style="min-height: 800px;">
		<header class="subhead"> </header>
		<div class="row">
			<div>
				<h2>MATCHING GAME</h2>
			</div>
		</div>


		<div class="row">
			<div class="col-sm-4">
				<div class="card-container">
					<div class="card">
						<div class="front">
							<img class="img-fluid" src="/findlove/resources/img/iwc3.png">
						</div>
						<div class="back">
							<img class="img-fluid" src="/findlove/resources/img/iwc.png">
							<div class="card-back-text">
								<h4 style="font-weight: bold; color: gray">&nbsp;이상형 월드컵</h4>
								<h5 style="font-size:15px; color: #f77070">&nbsp;&nbsp;원하는 이성을 골라보아요~</h5>
								<p style="font-size: 13px; color: gray">
									&nbsp;&nbsp;총 8명의 이성의 사진과 닉네임이 두명씩 나타납니다.
									마지막까지 남은 사람의 프로필을 볼수도 있으니 신중하게 골라주시길 바랍니다.
								</p>
							</div>
							<button id="iwcBtn" class="btn btn-primary start-matching-btn w-100">시작하기<span class="badge badge-point float-right">FREE</span></button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card-container">
					<div class="card">
						<div class="front">
							<img class="img-fluid" src="/findlove/resources/img/mqna3.png">
						</div>
						<div class="back">
							<img class="img-fluid" src="/findlove/resources/img/mqna.png">
							<div class="card-back-text">
								<h4 style="font-weight: bold; color: gray;">&nbsp;텔레파시 시그널</h4>
								<h5 style="font-size:15px; color: #f77070">&nbsp;&nbsp;나와 취향이 같은 이성을 찾아요.</h5>
								<p style="font-size: 13px; color: gray">
									&nbsp;&nbsp;렌덤의 이성이 질문과 답변을 작성해놨을거에요. 질문은 총 세번!! 그렇다면 그 질문에 대하여 당신은 어떠한 답을 누를지 결정하면 되요.
								</p>
							</div>
							<button id="mqaBtn" class="btn btn-primary start-matching-btn w-100">시작하기<span class="badge badge-point float-right">1회 FREE</span></button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card-container">
					<div class="card">
						<div class="front">
							<img class="img-fluid" src="/findlove/resources/img/mqnaset3.png">
						</div>
						<div class="back">
							<img class="img-fluid" src="/findlove/resources/img/mqnaset.png">
							<div class="card-back-text">
									<h4 style="font-weight: bold; color: gray">&nbsp;시그널 설정</h4>
								<h5 style="font-size:15px; color: #f77070">&nbsp;&nbsp;질문과 답변을 설정해요.</h5>
								<p style="font-size: 13px; color: gray">
									&nbsp;&nbsp;주어진 질문에 어떤 답변을 설정할지 골라주시면 렌덤으로 다른 이성에게 텔레파시 시그널에서 띄워드려요. 
									질문과 답변의 선택 또한 신중하게 결정해주세요.
								</p>
							</div>
							<c:if test="${checkfl eq 0}">
								<button id="mqiBtn" class="btn btn-primary start-matching-btn w-100">작성하기<span class="badge badge-point float-right">FREE</span></button>
							</c:if>
							<c:if test="${checkfl eq 1}">
								<button id="mqiBtn2" class="btn btn-primary start-matching-btn w-100">수정하기<span class="badge badge-point float-right">FREE</span></button>
							</c:if>
						</div>
					</div>
				</div>
			</div>

		</div>
		
	</div>
	<hr>
	<c:import url="../../include/footer.jsp" />

	<script>
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			
			$('.start-matching-btn').on('click', function() {
				
				var btnId = $(this).attr('id');
				$.ajax({
					url : "selectMyProfile.do",
					type : "POST",
					data : {user_id : userId
					},							
					success : function(data){
						if(data == 1){
							
							if(btnId=="iwcBtn")
								location.href="iwcrun.do?userId=${user_id }&round=8";
							else if(btnId=="mqaBtn") {
							
							document.location.href = "selectuserlist.do?userId=${user_id}";
							} else if(btnId=="mqiBtn") {
									location.href="listMatchqna.do";
							} else {
								location.href="myMatchqna.do?userId=${user_id }";
							}
						}else{
							alert("프로필 작성이 필요한 게시판입니다.");
						}
					},
					error : function(request, status, error){
						 if(request.status != '0'){
							alert("code : " + request.status + "\r\nmessage : "
									+ request.reponseText + "\r\nerror : " + error);
						} 
					 }
				 })
					 
			});
		});
	</script>
</body>
</html>