<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/agency.min.css">

<style>
.material-icons, #account-lg-txt a, button {
	color: #fff;
	cursor: pointer;
}

.material-icons:hover {
	color: #f77070
}

.material-icons.md-36 {
	font-size: 30px;
}

.material-icons.md-80 {
	font-size: 80px;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #11161e;
	overflow-x: hidden;
	padding-top: 10px;
	transition: 0.5s;
	opacity: 0.7
}

.sidenav a {
	padding: 8px 8px 8px 0px;
	text-decoration: none;
	font-size: 17px;
	font-weight: 400;
	color: #fff;
	display: block;
	transition: 0.3s;
	font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	white-space: nowrap
}

.sidenav .closebtn {
	margin-left: 265px;
	padding: 0px;
	font-size: 10px;
	font-weight: bold;
	transition: 0.3s;
}

.sidenav .closebtn .material-icons {
	color: #fff;
}

.sidenav .closebtn .material-icons:hover {
	color: #faadad;
}

.sidenav a:hover, .offcanvas a:focus {
	color: #faadad
}

.sidenav .nav-text {
	margin-left: 105px
}

.horiz-divide {
	margin-left: 30px;
	margin-right: 30px;
	color: #fff;
	background-color: #fff;
}

#account-lg-txt a {
	color: #fff;
	white-space: nowrap;
}

#account-lg-txt a:hover {
	color: #f77070;
}

@media ( max-width :992px) {
	#account-lg {
		display: none;
	}
	#account-lg-txt {
		display: none;
	}
	.divider {
		display: none;
	}
}

@media ( min-width :992px) {
	#account-sm {
		display: none;
	}
	.divider {
		border-right: 1px solid #fff;
	}
	#account-lg {
		margin-left: 15px;
	}
	#account-lg-txt {
		margin-right: auto;
	}
	.navbar .container {
		margin-right: 0px;
		padding-right: 0px;
	}
}

#container2 {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between
}

.nav-link {
	font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: 400;
}

.logo {
	height: 70px;
	margin-left: 100px
}

.sidenav div {
	font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: bold;
	color: #faadad;
	white-space: nowrap
}

.form-container {
	margin-left: 30px
}

.form-control {
	width: 240px;
	border-radius: 1px;
	color: #faadad
}

.form-control:focus {
	border-color: #faadad;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(250, 173, 173, .9);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(250, 173, 173);
}

.form-control::placeholder {
	color: #faadad
}

.form-control.btn {
	border-color: #faadad;
	background-color: #faadad;
	color: #fff
}

.sidenav label {
	color: #fff;
	white-space: nowrap
}

.btn-toolbar {
	margin-left: 30px;
	display: inline-block;
	white-space: nowrap
}

.btn-naver, .btn-face {
	width: 115px;
	border-radius: 1px;
	font-weight: bold;
	color: #fff;
}

.btn-naver {
	background-color: #08c83a
}

.btn-face {
	background-color: #4e6495
}

.i-a-group {
	margin-left: 33px;
	width: 100px;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: nowrap;
	flex-wrap: nowrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between
}

.i-a-group a {
	padding-left: 20px;
}

#go-to-top {
	display: none;
	position: fixed;
	bottom: 30px;
	right: 30px;
	z-index: 99;
	outline: none;
	background-color: #faadad;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 1px;
	opacity: 0.7
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Find
				love</a>
			<div id="container2">
				<span id="menu-btn" class="navbar-toggler navbar-toggler-right"
					data-toggle="collapse" data-target="#navbarResponsive"><i
					class="material-icons">menu</i><i class="fa fa-bars"></i></span> <span
					id="account-sm" onclick="openNav()"><i
					class="material-icons md-36">account_circle</i></span>
			</div>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="notice.do">공지사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="idealworldcup.do?userId=${user_id}">매칭 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/findlove/openProfileList.do">프로필 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">자유 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">이벤트 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">Q&A</a></li>
				</ul>
			</div>
		</div>
		<span class="divider">&nbsp;</span>

		<!-- Use any element to open the sidenav -->
		
		
					
		<span id="account-lg" onclick="openNav()" class="pull-left"><i
			class="material-icons md-36">account_circle</i></span> 
		<c:choose>
			<c:when test ="${sessionScope.user_id ne null }">
			<span id="account-lg-txt" onclick="openNav()"><a>${sessionScope.user_id}</a></span>
			</c:when>
			<c:otherwise>
		<span id="account-lg-txt" onclick="openNav()"><a>로그인</a></span>
		</c:otherwise>
		</c:choose>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i
				class="material-icons">close</i></a> <img
				src="/findlove/resources/img/logos/logo.png" class="logo">
			<c:choose>
				<c:when test ="${sessionScope.user_id ne null }">
				<div class="nav-text">${sessionScope.user_id } 님</div>
				<hr class="horiz-divide">
				<!-- <form class="form-container" name="form1" method="post">
				<input type="text" id="userId" name="userId" class="form-control"
					placeholder="아이디"> <input type="password" id="userPwd"
					name="userPwd" class="form-control" placeholder="패스워드"> -->
				<form class="form-container">
				<a href = "logout.do"><button class="form-control btn logout-btn" type="button">로그아웃</button></a>
				</form>
				</c:when>
			<c:otherwise>			
				<div class="nav-text">로그인하세요</div>
				<hr class="horiz-divide">
				<form class="form-container" name="form1" method="post">
				<input type="text" id="user_id" name="user_id" class="form-control"
					placeholder="아이디"> <input type="password" id="user_pwd"
					name="user_pwd" class="form-control" placeholder="패스워드">
				<button class="form-control btn login-btn" type="button">로그인</button>
				<label class="form-check-label"><input type="checkbox"
					class="form-check-input">아이디 저장</label>
			</form>
				<div class="btn-toolbar">
					<div class="btn-group mr-2">
						<button class="btn btn-naver">N</button>
					</div>
					<div class="btn-group mr-2">
						<button class="btn btn-face">f</button>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
				<hr class="horiz-divide">
				<c:choose>
					<c:when test="${sessionScope.user_id ne null }">
						<div class="i-a-group">
							<i class="material-icons">search</i><a href="myinfo.do">마이페이지</a>
						</div>
						<div class="i-a-group">
							<i class="material-icons">search</i><a href="openSendMessageList.do">나의매칭</a>
						</div>
					</c:when>
					<c:otherwise>						
						<div class="i-a-group">
							<i class="material-icons">group_add</i><a href="signup.do">회원가입</a>
						</div>
						<div class="i-a-group">
							<i class="material-icons">search</i><a href="findidpwd.do">아이디/비밀번호
								찾기</a>
						</div>
					</c:otherwise>
				</c:choose>
				<hr class="horiz-divide">
		</div>
	</nav>
	<a id="go-to-top" class="js-scroll-trigger" href="#page-top"><i
		class="material-icons">expand_less</i></a>
	<script type="text/javascript"
		src="/findlove/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="/findlove/resources/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="/findlove/resources/js/contact_me.js"></script>
	<script type="text/javascript"
		src="/findlove/resources/js/jqBootstrapValidation.js"></script>
	<script type="text/javascript"
		src="/findlove/resources/js/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="/findlove/resources/js/agency.min.js"></script>
	<script>
		window.onscroll = function() {
			scrollFunction()
		};
		function openNav() {
			document.getElementById("mySidenav").style.width = "300px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				document.getElementById("go-to-top").style.display = "block";
			} else {
				document.getElementById("go-to-top").style.display = "none";
			}
		}
	</script>
	<script>	
		$(".login-btn").on('click', function() {
			var userId = $("#user_id").val();
			var userPwd = $("#user_pwd").val();
			var param = "user_id" + "=" + user_id + "&" + "user_pwd" + "=" + user_pwd;
			if (userId == "") {
				alert("아이디를 입력하세요.");
				$("#user_id").focus(); //입력포커스
				return false;
			}
			/* $.ajax({
				url : "/login.do",
				type : "GET",
				data : param,
				cache : false,
				async : false,
				dataType : "text",
				
				success : function(response){
					if(response != '1'){
						alert("아이디 또는 비밀번호가 틀립니다. 확인하여주세요.")
						return false;						
					}
					alert(check);
					
				},
				error : function(request, status, error){
					if(request.status != '0'){
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);

					}
				}	 */		
			
			/* if(!userPwd.value){
				alert("비밀번호를 입력하세요");
				$("#userPwd").focus();
				return false;
			} */
			document.form1.action = "logincheck.do" //데이터 전송
			document.form1.submit(); // 제출
		});
	</script>
</body>
</html>