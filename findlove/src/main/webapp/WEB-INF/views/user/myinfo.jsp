<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::마이페이지</title>
 
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
            <a href="myinfo.do" class="list-group-item active">나의 정보</a>
            <a href="myprofile.do" class="list-group-item">나의 프로필 설정</a>
            <a href="idealprofile.do" class="list-group-item">이상형 프로필 설정</a>
            <a href="store.do" class="list-group-item">스토어</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">
         <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	정보 수정은 아이디와 이름은 변경 불가능 합니다.
            </div>
            <div class="card-body"> 
            	  <table id="tableData" class="table table-bordered">
            	  <form class="form-contaioner" name = "form" method = "post">
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
            	  	<td>${sessionScope.user_nicknm }</td>
            	  </tr>
            	  	<td>별사탕</td>
            	  	<td>${sessionScope.konpeito_cnt}</td>
            	  </tr>
            	  </tr>
            	  	<td>포인트</td>
            	  	<td>${sessionScope.point_cnt}</td>
            	  </tr>  
            	  <tr>
            	  	<td>이메일</td>
            	  	<td>${sessionScope.email }</td>
            	  </tr>
            	  <tr>
            	  	<td>휴대폰 번호</td>
            	  	<td>${sessionScope.phone }</td>
            	  </tr>
            	  </form> 
             	</table>
			    <a class="btn btn-primary" style="color:#fff; margin-bottom:20px;" onclick="location.href='myinfoset.do'">수정하기</a>
			    <a class="btn btn-primary" style="color:#fff; margin-bottom:20px;" onclick="history.go(-1)">취소</a>
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->
	
	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
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
	
	<c:import url="../include/footer.jsp" /> 
	
	
	<script type="text/javascript">$(function() {
         $('#mainNav').css('background-color', '#faadad');
      });
	</script>

</body>
</html>