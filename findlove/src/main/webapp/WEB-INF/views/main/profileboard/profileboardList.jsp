<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견::프로필게시판</title>

<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/4-col-portfolio.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.container.top {
	margin-top: 100px;
}

.sortul {
	list-style: none;
}

.sortul li {
	float: left;
}

.sort {
	position: relative;
	display: block;
	padding: .5rem .75rem;
	margin-left: -1px;
	line-height: 1.25;
}

.material-icons {
	color: #faadad
}

.btn.btn-default {
	background-color: #faadad;
}

.select-control {
	border: 1px solid #ced4da;
	background-color: #faadad;
	color: white;
	width: 80px;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: bold;
}

ul li.page-item a.page-link {
	color: #faadad;
}

p {
	line-height: 0.5;
}

.nav {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}

.nav>li {
	position: relative;
	display: block;
}

.nav>li>a {
	position: relative;
	display: block;
	padding: 10px 20px;
}

.nav>li>a:hover, .nav>li>a:focus {
	text-decoration: none;
	background-color: #eee;
}

.nav>li.disabled>a {
	color: #777;
}

.nav>li.disabled>a:hover, .nav>li.disabled>a:focus {
	color: #777;
	text-decoration: none;
	cursor: not-allowed;
	background-color: transparent;
}

.nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
	background-color: #eee;
	border-color: #337ab7;
}

.nav .nav-divider {
	height: 1px;
	margin: 9px 0;
	overflow: hidden;
	background-color: #e5e5e5;
}

.nav>li>a>img {
	max-width: none;
}

.nav-tabs {
	border-bottom: 1px solid #ddd;
}

.nav-tabs>li {
	float: left;
	margin-bottom: -1px;
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus
	{
	color: #555;
	cursor: default;
	background-color: #fff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
</style>

<script>
function list(page){
    location.href="/findlove/openProfileList.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>

</head>
<body id="page-top">

	<c:import url="../../include/header.jsp" />
	<div class="container top">
		<div class="row">
		<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">프로필 게시판</strong>	
			</div>
		</div>
	</div>

	<div class="container">
		<h3>Total ${map.count} profile</h3>

		<!-- <div class="row">
		<div class="col-lg-12">
		<div role="navigation">
			<ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="#">전체 회원 프로필</a></li>
  			<li role="presentation"><a href="#">남성 회원 프로필</a></li>
  			<li role="presentation"><a href="#">여성 회원 프로필</a></li>
		</ul>
		</div>
		</div>
		</div> -->
	
		<div class="row">
			<div class="col-6">	
				<div class=" float-left">
					<ul class="sortul" style="padding:0px">
						<li><a href="#" class="sort"><i
								class="fa fa-long-arrow-down" aria-hidden="true"></i>닉네임순</a></li>
						<li><a href="#" class="sort"><i class="fa fa-long-arrow-up"
								aria-hidden="true"></i>나이순</a></li>
						<li><a href="#" class="sort"><i
								class="fa fa-long-arrow-down" aria-hidden="true"></i>별점순</a></li>
					</ul>
				</div>
			</div>
			<div class="col-6">	
				<div class="float-right">
					<form name="form1" method="post"
						action="/findlove/openProfileList.do">
	
						<div class="input-group-btn">
							<input type="text" class="form-control" name="keyword"
								value="${map.keyword}" placeholder="닉네임을 입력하세요"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="material-icons">search</i>
								</button>
							</span>
						</div>
	
					</form>
				</div>
			</div>
			
		</div>

		<div class="row">
			<c:choose>
				<c:when test="${ fn:length(map.list) > 0}">
					<c:forEach items="${ map.list }" var="p">
						<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
							<div class="card h-60">
								<a
									href="/findlove/openProfileDetail.do?user_nicknm=${ p.user_NickNM }"><img
									class="card-img-top"
									src="/findlove/uploadfiles/profile/${ p.picture_NM }"
									alt=""></a>

								<div class="card-body">
									<h4 class="card-title">
									    <br>
										<span style="color: #faadad; font-size: 25px;">${ p.user_NickNM }
											<c:choose>
												<c:when test="${ p.gender eq 'M'}">
													(남)
												</c:when>
												<c:otherwise>
													(여)
												</c:otherwise>
											</c:choose>
										</span> <span> <br> <img
											src="/findlove/resources/img/starGrade/starGrade${ p.grade_AVG }.png"
											width=120, height=30></span> <br>
										<br> <span style="color: black; font-size: 18px;">
											${ p.age }세, ${ p.area }</span>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
			<br>
		</div>
		<br>

		<ul class="pagination justify-content-center">

			<li class="page-item">
				<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
					test="${map.profilePager.curBlock > 1}">
					<a class="page-link" href="javascript:list('1')"
						aria-label="Previous">처음 </a>
				</c:if>
			</li>

			<li class="page-item">
				<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> <c:if
					test="${map.profilePager.curBlock > 1}">
					<a class="page-link"
						href="javascript:list('${map.profilePager.prevPage}')"
						aria-label="Previous">이전 </a>
				</c:if>
			</li>

			<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
			<c:forEach var="num" begin="${map.profilePager.blockBegin}"
				end="${map.profilePager.blockEnd}">
				<!-- **현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == map.profilePager.curPage}">
						<li class="page-item"><a class="page-link"
							style="background-color: #faadad; color: #f77070; font-weight: bold"
							href="#">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="javascript:list('${num}')">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item"><c:if
					test="${map.profilePager.curBlock <= map.profilePager.totBlock}">
					<a class="page-link"
						href="javascript:list('${map.profilePager.profilePager}')"
						aria-label="Next">다음 </a>
				</c:if></li>

			<li class="page-item"><c:if
					test="${map.profilePager.curPage <= map.profilePager.totPage}">
					<a class="page-link"
						href="javascript:list('${map.profilePager.totPage}')"
						aria-label="Next">끝 </a>
				</c:if></li>
		</ul>
	</div>
	<!-- container -->

	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="/profileboard/profileList.do"> <img
						class="img-fluid d-block mx-auto"
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

	<script type="text/javascript">
	  $(function() {
         $('#mainNav').css('background-color', '#faadad');
      });
	 </script>
</body>
</html>