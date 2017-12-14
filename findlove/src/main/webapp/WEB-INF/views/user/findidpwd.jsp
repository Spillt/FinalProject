<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::아이디,비밀번호 찾기</title>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/findlove/resources/css/find.css">
</head>
<body>
	<div class="testbox">
		<form action="findId.do" name="findId" method="post">
			<h3>아이디 찾기</h3>
			<label id="icon" for="name"><i class="icon-user"></i></label> <input
				type="text" name="userName" id="name" placeholder="Name" required /> <label
				id="icon" for="name"><i class="icon-envelope "></i></label> <input
				type="text" name="email" id="email" placeholder="Email" required />

			<a class="button" onclick="submitfindId()">Submit</a>
		</form>

		<br>
		<hr>
		<form action="findPwd.do" name="findPwd" method="post">
			<h3>비밀번호 찾기</h3>
			<label id="icon" for="name"><i class="icon-user"></i></label> <input
				type="text" name="userId" id="id" placeholder="ID" required /> <label
				id="icon" for="name"><i class="icon-envelope "></i></label> <input
				type="text" name="email" id="email" placeholder="Email" required />

			<a class="button" onclick="submitfindPwd()">Submit</a>

		</form>
	</div>
	<script>
	function submitfindId(){
		alert("귀하의 메일로 아이디를 발송하였습니다.")
		findId.submit();		
	}
	</script>
	<script>
	function submitfindPwd(){
		alert("귀하의 메일로 임시비밀번호를 발급하였습니다. \n확인하여 주세요.")
		findPwd.submit();
	}

	</script>
</body>
</html>