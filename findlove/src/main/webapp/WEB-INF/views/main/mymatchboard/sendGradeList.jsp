<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>


<style type="text/css">
.container.top {
	margin-top: 100px;
}
</style>
<script src = " https://use.fontawesome.com/56a81332b8.js " > </script>
</head>
<body id="page-top">

<c:import url="../../include/header.jsp" />

	<div class="container top">
		<div class="row"></div>
	</div>

	<br>
	<h1 align="center">나의 매칭 정보</h1>
	<br>
	
	<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <br>
          <div class="list-group">
            <a href="#" class="list-group-item">내가 호감을 보낸 이성</a>
            <a href="#" class="list-group-item">나에게 호감을 보낸 이성</a>
            <a href="#" class="list-group-item active">내가 높은 평점을 준 이성</a>
            <a href="#" class="list-group-item">나에게 높은 평점을 준 이성</a>
          </div>
        </div>

        <div class="col-lg-9">

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	내가 높은 평점을 준 이성
            </div>
           
			<c:choose>
				<c:when test="${ fn:length(map.list) > 0}">
					<c:forEach items="${ map.list }" var="profile">
					
			<div class="list-group list-group-flush small">
			<a class="list-group-item list-group-item-action" href="#">
                <div class="media">
                  <img class="d-flex mr-3 rounded-circle" src="/findlove/uploadfiles/profile/${ profile.picture_NM }" style="width:45px; height:45px;"alt="">
                  <div class="media-body">
                    <strong>${ profile.user_NickNM }
                    <c:choose>
						<c:when test="${ profile.gender eq 'M'}">
						(남)
						</c:when>
						<c:otherwise>
						(여)
						</c:otherwise>
						</c:choose>
                    </strong>
                    <strong>${ profile.age }세</strong>.
                    <div class="text-muted smaller">${ profile.area }</div>
                  </div>
                </div>
              </a>
			</div>
			
					</c:forEach>
				</c:when>
			</c:choose>
		   </div>
		   
		</div> <!-- co -->

              
            </div>
           
            </div>
          
    
	
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
</body>

</html>
