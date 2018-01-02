<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<title>연애의발견::QNA먜칭</title>

<!-- Page link -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<!-- CSS 및 스타일 -->
<style type="text/css">
.btn-block {
	background-color: pink;
	color: white;
	border: 1px solid pink;
}

.btn-block:hover {
	background-color: pink;
	color: white;
	border: 1px solid pink;
	Opacity: 0.8;
}

.btn-block:active {
	background-color: pink;
	color: white;
	border: 1px solid pink;
	Opacity: 0.8;
}

.list-group {
	weight: 60px;
}

.container.top {
	margin-top: 150px;
}
</style>

</head>
<body id="page-top">

	<!-- header -->
	<c:import url="../../../include/header.jsp" />

	<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">매칭게시판</strong>
			</div>
		</div>
	</div>

	<!-- Page Contents -->
	<div class="container">
		<div class="row">
		
			<!-- Side Navi -->
			<div class="col-lg-3">
				<br>
				<!-- <h1 class="my-4">Shop Name</h1> -->
				<div class="list-group">
					<a href="#" class="list-group-item">이상형 월드컵</a> <a
						href="selectuserlist.do?userId=${user_id }"
						class="list-group-item">QNA 매칭</a> <a href="listMatchqna.do"
						class="list-group-item active">내 QnA 설정</a>
				</div>
			</div>
			
			<!-- Main Content -->
			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<strong>나의 QNA 설정</strong><br> 이성이 답변할 나의 QNA를 입력합니다.
					</div>
					<div class="card-body">
						<section>
							<c:forEach var="q" items="${requestScope.list}">
								<div class="container">
									<h2>${q.question_no }.</h2>
									<div class="well">${q.question }</div>
									<div class="anser">
										<input type="radio" name="${q.question_no }"
											class="checkSelect" value="${q.question_no }/1">${q.choice1 }</div>
									<div class="anser">
										<input type="radio" name="${q.question_no }"
											class="checkSelect" value="${q.question_no }/2">${q.choice2 }</div>
									<div class="anser">
										<input type="radio" name="${q.question_no }"
											class="checkSelect" value="${q.question_no }/3">${q.choice3 }</div>
									<br>
								</div>
								<br>
							</c:forEach>

							<!-- <input type="button" value="제출하기" onclick="radioboxCheck();"> -->
							 <a class="btn btn-primary" style="color:#fff; margin-bottom:20px;" onclick="radioboxCheck()">제출</a>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  footer -->
	<hr>
	<c:import url="../../../include/footer.jsp" />


	<!-- 자바스크립트 -->
	<!-- 헤더 네비 -->
	<script>
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>

	<!-- 등록 -->
	<script type="text/javascript">
		function radioboxCheck() {
			if ($("input:radio:checked").length != $("input:radio").length / 3) {
				alert("전부 선택해주세요.");
			} else {
				alert("성공적으로 저장되었습니다.");
				var send_array = Array();
				var send_cnt = 0;
				var chkbox = $(".checkSelect");

				for (i = 0; i < chkbox.length; i++) {
					if (chkbox[i].checked == true) {
						send_array[send_cnt] = chkbox[i].value;
						send_cnt++;
					}
				}
				document.location.href = "insertMatchqna.do?check="
						+ send_array + "&userId=${user_id}";
			}
			
			submit;

		}
	</script>
</body>
</html>