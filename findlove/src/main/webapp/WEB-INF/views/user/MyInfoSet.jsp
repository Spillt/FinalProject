<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::내정보수정</title>

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
					<a href="myinfo.do?user_id=${sessionScope.user_id }" class="list-group-item active">나의 정보</a> 
					<a href="myprofile.do?user_id=${sessionScope.user_id }"	class="list-group-item">나의 프로필</a> 
					<a href="idealprofile.do?user_id=${sessionScope.user_id }"	class="list-group-item">이상형 프로필</a>
					<a href="#" class="list-group-item">일대일 문의</a> 
					<a href="store.do"	class="list-group-item">스토어</a>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">정보 수정은 아이디와 이름은 변경 불가능 합니다.</div>
					<div class="card-body">
					<form action="myinfoset.do" class="form-contaioner" name="updatemyinfo" method="post">
						<input type="hidden" name="user_id" value="${sessionScope.user_id }"/>
						<table id="tableData" class="table table-bordered">
							
								<tr>
									<td>아이디</td>
									<td>${sessionScope.user_id }</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${sessionScope.user_nm }</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" name="user_nicknm" id="nickname" value="${user.user_nicknm }"/></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="user_pwd" id="pwd1" /></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" name="pwd2" id="pwd2"/></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" id="email" value="${user.email }"/></td>
								</tr>
								<tr>
									<td>휴대폰 번호</td>
									<td><input type="text" name="phone" id="phone" value="${user.phone }"/></td>
								</tr>
							
						</table>
						</form>
						<a class="btn btn-primary" style="color:#fff; margin-bottom:20px;" onclick="checkfield()">수정하기</a> <a
							class="btn btn-primary" style="color:#fff; margin-bottom:20px;" onclick="history.go(-1)">취소</a>
					</div>
					
				</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>
	<!-- /.container -->

	
	<hr>
	
	<!-- footer -->
	<c:import url="../include/footer.jsp" />
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">
						function checkfield() {

							var form = document.updatemyinfo;
							var pattern1 = /[0-9]/; //숫자
							var pattern2 = /[a-zA-Z]/; //영문
							var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; //특수문자
							var pattern4 = /([^가-힣\x20])/i; //한글

							if (!form.nickname.value) {
								swal({
									title:"warning!",
									text:"닉네임을 입력하세요.",
									icon:"error",
									
								});
								form.nickname.focus();
								return false;
							}
							if (pattern3.test(form.nickname.value)) {
								swal({
									title:"warning!",
									text:"닉네임에는 특수문자가 들어갈 수 없습니다.",
									icon:"error",									
								});								
								form.nickname.focus();
								return false;
							}
							if (!form.pwd1.value) {
								swal({
									title:"warning!",
									text:"비밀번호를 입력하세요.",
									icon:"error",				
								});
								form.pwd1.focus();
								return false;
							} else if (!form.pwd2.value) {
								swal({
									title:"warning!",
									text:"비밀번호를 한번 더 입력하세요.",
									icon:"error",				
								});
								form.pwd2.focus();
								return false;
							}
							if (form.pwd1.value != form.pwd2.value) {
								swal({
									title:"warning!",
									text:"입력한 2개의 비밀번호가 일치하지 않습니다.",
									icon:"error",				
								});	
								form.pwd1.focus();
								return false;
							}

							if (!form.email.value) {
								swal({
									title:"warning!",
									text:"이메일을 입력하세요.",
									icon:"error",				
								});	
								form.email.focus();
								return false;
							}
							if (!form.phone.value) {
								swal({
									title:"warning!",
									text:"휴대폰 번호를 입력하세요.",
									icon:"error",				
								});	
								form.phone.focus();
								return false;
							}

							var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

							if (exptext.test(form.email.value) == false) {
								alert("이메일 형식이 올바르지 않습니다.")
								form.email.focus();
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
					<script type="text/javascript">$(function() {
         $('#mainNav').css('background-color', '#faadad');
      });
	</script>


</body>
</html>