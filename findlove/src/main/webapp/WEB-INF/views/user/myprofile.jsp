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
		.table{
			width : 50%;
		}
		
	</style>
	
</head>
<body id="page-top">
<c:import url="../include/header.jsp" />

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading">&nbsp;</div>
				<!-- <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="#services">시작하기</a> -->
			</div>
		</div>
	</header>

	<!-- Portfolio Grid -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<!-- <img class="img-fluid" src="/findlove/resources/img/ad/ad-banner.jpg"> -->
			</div>
		</div>
	</div>

	<br>
	<h1 align="center">나의 프로필</h1>
	<br>
	
	<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <br>
          <!-- <h1 class="my-4">Shop Name</h1> -->
          <div class="list-group">
            <a href="myinfo.do" class="list-group-item">나의 정보</a>
            <a href="myprofile.do" class="list-group-item active">나의 프로필 설정</a>
            <a href="idealprofile.do" class="list-group-item">이상형 프로필 설정</a>
            <a href="store.do" class="list-group-item">스토어</a>
          </div>
        </div>
        
	 <div class="col-lg-9">
         <div class="card card-outline-secondary my-4">
         <div class="card-header"></div>
         <div class="card-body">
		<form action="myinfo" name="myinfo" method="post">

			<!-- 사용자 이미지 -->
			<table class="table table-bordered">
			<div class="image1">
				<a target="_blank" href="img_fjords.jpg"> <img
					src="/findlove/resources/img/team/1.jpg" alt="" width="180"
					height="180">
				</a>
				<div class="desc"></div>
			</div>
			</table>
			
		</form>
		<!-- 이미지 업로드 -->
		<form action="imageupload" method="post" enctype="multipart/form-data">
			<input type="file" name="imageFile"><br> <input
				type="submit" value="전송">
		</form>
		
		</div>
		<hr>
		
		<div class="card-body">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="cols">기본프로필</th>
					<th scope="cols"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">실명</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">닉네임</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">성별</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">직업/직장</th>
					<td>내용.</td>
				</tr>
				<tr>
					<th scope="row">휴대폰번호</th>
					<td>내용.</td>
				</tr>
			</tbody>

		</table>
		</div>
	


		<a class="button" onclick="checkfield()">Register</a> <a
			class="button" onclick="">Cancel</a>
		</form>
	</div>

</body>
</html>