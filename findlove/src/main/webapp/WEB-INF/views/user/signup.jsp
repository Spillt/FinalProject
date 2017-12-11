<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<title>연애의발견::회원가입</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/findlove/resources/css/sign.css">
	
	<script type="text/javascript">
	function checkfield(){
		
		var form = document.signup;
		
		if(!form.id.value){
			alert("아이디를 입력하세요");
			form.id.focus();
			exit;		
		}else if(!form.pwd1.value){
			alert("비밀번호를 입력하세요")
			form.pwd1.focus();
			exit;
		}else if(!form.pwd2.value){
			alert("비밀번호를 한번 더 입력하세요")
			form.pwd2.focus();
			exit;
		}else if(!form.name.value){
			alert("이름을 입력하세요");
			form.name.focus();
			exit;
		}else if(!form.nickname.value){
			alert("닉네임을 입력하세요");
			form.nickname.focus();
			exit;
		}else if(!form.email.value){
			alert("이메일을 입력하세요")
			form.email.focus();
			exit;
		}
		
		if(form.pwd1.value != form.pwd2.value){
			alert("입력한 2개의 비밀번호가 일치하지 않습니다.")
			form.pwd1.focus();
			exit;
		}
		
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		if(exptext.test(form.email.value)==false){
			alert("이메일 형식이 올바르지 않습니다.")
			form.email.focus();
			exit;
		}
		alert("회원가입이 완료되었습니다.");
		location.href="home.do";
	}	
	
	</script>
</head>

<body>

<div class="testbox"> 
  <h1>Registration</h1>

  <form action="signup" name="signup" method="post">

  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="id" name="id" id="id" placeholder="Id" required/>
  <a class="confirmbutton" onclick="checkId()" width="60px;" style="
    width: 60px;">confirm</a>
  <hr>
  
  <label id="icon" for="name"><i class="icon-shield"></i></label>
  <input type="password" name="pwd1" id="pwd1" placeholder="Password" required/>
  
  <label id="icon" for="name"><i class="icon-shield"></i></label>
  <input type="password" name="pwd2" id="pwd2" placeholder="Password Confirm" required/>
  
  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="text" name="name" id="name" placeholder="Name" required/>
  
  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="text" name="nickname" id="nickname" placeholder="NickName" required/>
  
  <label id="icon" for="name"><i class="icon-envelope "></i></label>
  <input type="text" name="email" id="email" placeholder="Email" required/>
  <hr>
    
   
   
   <a class="button" onclick="checkfield()">Register</a>
   <a class="button" onclick="">Cancel</a>
  </form>
</div>

</body>
     
  </body>
</html>