<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::아이디,비밀번호 찾기</title>

<!-- Page link -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/find.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- CSS/Style -->
	
	<!-- Page Content -->
</head>
<body>
	<div class="testbox">
		<form action="findId.do" name="findId" method="post">
			<h3>아이디 찾기</h3>
			<label id="icon" for="name"><i class="icon-user"></i></label> 
			<input type="text" name="user_nm" id="name" placeholder="Name" required /> 
			<label id="icon" for="email"><i class="icon-envelope "></i></label> 
			<input type="text" name="email" id="email" placeholder="Email" required />

			<a class="button" onclick="submitfindId()">Submit</a>
		</form>

		<br>
		<hr>
		<form action="findPwd.do" name="findPwd" method="post">
			<h3>비밀번호 찾기</h3>
			<label id="icon" for="id"><i class="icon-user"></i></label> 
			<input type="text" name="user_id" id="id" placeholder="ID" required /> 
			<label id="icon" for="email"><i class="icon-envelope "></i></label> 
			<input type="text" name="email" id="email" placeholder="Email" required />

			<a class="button" onclick="submitfindPwd()">Submit</a>

		</form>
	</div>
	
	<!-- footer -->
	<hr>
	<c:import url="../include/footer.jsp" />
	
	<!-- 자바스크립트 -->
	<script>
	function submitfindId(){
		var form document.findId;
		
		if(!form.name.value){
			swal({
				title:"warning!",
				text:"이름을 입력하세요.",
				icon:"error",
				
			});			
			form.name.focus();
			return;
		}
		if(!form.email.value){
			swal({
				title:"warning!",
				text:"이메일을 입력하세요.",
				icon:"error",
				
			});			
			form.email.focus();
			return;
		}
		findId.submit();		
		swal("${resultMsg}")				
	}
	</script>
	<script>
	function submitfindPwd(){
		var form = document.findPwd;
	
		if(!form.id.value){
			swal({
				title:"warning!",
				text:"아이디를 입력하세요.",
				icon:"error",				
			});	
			form.id.focus();
			return;
		}
		if(!form.email.value){
			swal({
				title:"warning!",
				text:"이메일을 입력하세요.",
				icon:"error",
				
			});	
			form.email.focus();
			return;
		}
		findPwd.submit();
		swal("${resultMsg}")
	
	}

	</script>
</body>
</html>