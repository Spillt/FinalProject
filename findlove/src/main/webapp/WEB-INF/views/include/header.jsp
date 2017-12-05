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
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 60px;
	transition: 0.5s
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus {
	color: #f1f1f1
}

.material-icons {
	color: white;
	cursor: pointer;
}

.material-icons:hover {
	color: #f77070
}

.material-icons.md-36 {
	font-size: 36px
}
@media (max-width:768px) {
	#account-lg {
		display:none;
	}

}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Find
				love</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="material-icons">menu</i><i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">공지사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">매칭 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">프로필 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#team">자유 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">이벤트 게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">Q&A</a></li>
				</ul>
			</div>
		</div>
			<!-- Use any element to open the sidenav -->
			<span id="account-lg" onclick="openNav()"><i class="material-icons md-36">account_circle</i></span>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="#about">About</a>
				<a href="#event">Event</a>
				<a href="#menu-list">Menu</a>
				<a href="#contact">Book a table</a>
			</div>
		
	</nav>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
</body>
</html>