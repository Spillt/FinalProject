<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>
	<style type="text/css">
		.portfolio-item-inner {
		    line-height: 1.42857143;
		    background-color: #fff;
		    border-radius: 2px;
		    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
		    transition: box-shadow .25s; 
		}
		.portfolio-item-inner:hover {
			box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		}
		.row.panel-title {
			padding-top:5px;
			border: 1px solid lightgray;
			text-align:left;
		}
		.row.panel-body {
			padding-top:10px;
			border: 1px solid lightgray;
			border-top:0;
		}
		.portfolio-caption span .material-icons.heart {
			color: #faadad
		}
		.portfolio-caption span .material-icons.star {
			color: #F7EC98
		}
		
		.pannel {
			margin-right:10px;
		}
		.masthead {
			margin-bottom: 20px;
		}
	</style>
</head>
<body id="page-top">
	<%-- <h1>home.jsp</h1>
<c:if test="${empty sessionScope.user }">
	<form action="login.do" method="post">
		<input type="text" name="userId">
		<input type="password" name="userPwd">
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${!empty sessionScope.user }">
	<p>${user.userName } 님 환영합니다.</p>
</c:if> --%>

<c:import url="../../include/header.jsp" />

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading">&nbsp;</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="#services">시작하기</a>
			</div>
		</div>
	</header>

	

	<!-- Portfolio Grid -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<img class="img-fluid" src="/findlove/resources/img/ad/ad-banner.jpg">
			</div>
		</div>
	</div>

	<section class="bg-light" id="portfolio">

		<!-- Page Content -->
		<div class="container">

			<!-- Heading Row -->
			<div class="row my-4">
				<div class="col-lg-8">
					<img class="img-fluid rounded" src="http://placehold.it/900x400"
						alt="">
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-4">
					<h1>${list.user_NickNM }</h1>
					<span><img src="/findlove/resources/img/starGrade/starGrade${ list.grade_AVG }.png" width=160, height=40></span>
					<p>This is a template that is great for small businesses </p>
					<a class="btn btn-primary btn-lg" href="#">Call to Action!</a>
				</div>
				<!-- /.col-md-4 -->
			</div>
			<!-- /.row -->

			<!-- Call to Action Well -->
			<div class="card text-white bg-secondary my-4 text-center">
				<div class="card-body">
					<p class="text-white m-0">${list.user_NickNM }님의 간단한 프로필 입니다
				</div>
			</div>

			<!-- Content Row -->
			<div class="row">
				<div class="col-md-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title">Card One</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Rem magni quas ex numquam, maxime minus quam
								molestias corporis quod, ea minima accusamus.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title">Card Two</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Quod tenetur ex natus at dolorem enim!
								Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id
								dolore voluptates quos eligendi labore.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title">Card Three</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Rem magni quas ex numquam, maxime minus quam
								molestias corporis quod, ea minima accusamus.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->

		<!-- Bootstrap core JavaScript -->
		<script src="/findlove/js/jquery.min.js"></script>
		<script src="/findlove/js/bootstrap.bundle.min1.js"></script>
	</section> 


	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="/profileboard/profileList.do"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/envato.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/designmodo.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/themeforest.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/creative-market.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>
	<hr>
	<c:import url="../../include/footer.jsp" /> 
	


	

<script type="text/javascript" src="/findlove/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/findlove/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/findlove/resources/js/contact_me.js"></script>
<script type="text/javascript" src="/findlove/resources/js/jqBootstrapValidation.js"></script>
<script type="text/javascript" src="/findlove/resources/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/findlove/resources/js/agency.min.js"></script>
<script type="text/javascript">

</script>
</body>

</html>
