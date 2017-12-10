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
		<div class="container">
			<div class="row">
			<div class="col-md-30 pannel">
				<div class="row panel-title">
					<div class="col-lg-20 text-center">
						<h5 class="section-heading">프로필게시판</h5>
					</div>
				</div>
				<div class="row panel-body">
					<c:choose>
						<c:when test="${ fn:length(list) > 0}">
							<c:forEach items="${ list }" var="profile">
								<div class="col-md-3 portfolio-item">
									<div class="portfolio-item-inner">
										<a class="portfolio-link" data-toggle="modal"
											href="#portfolioModal1">
											<div class="portfolio-hover">
												<div class="portfolio-hover-content">
													<i class="fa fa-plus fa-3x"></i>
												</div>
											</div> <a href="/findlove/profileboard/openProfileDetail.do?user_nicknm=${ profile.user_NickNM }"><img class="img-fluid" src="/findlove/resources/img/team/1.jpg"
											alt=""></a>
										</a>
										<div class="portfolio-caption">
											<h4>${ profile.user_NickNM }(${ profile.gender })</h4>
											<h6>${ profile.age }세, ${ profile.area }</h6>
											<span><i class="material-icons star">star_half</i></span>
											<span><i class="material-icons heart">favorite_border</i></span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
			</div>
		</div>
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
