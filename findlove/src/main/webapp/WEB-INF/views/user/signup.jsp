<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<head>
<meta charset="UTF-8">
	<title>연애의발견::회원가입</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/findlove/resources/css/sign.css">
	
	<script type="text/javascript">
	function checkfield(){
		
		var form = document.signup;
		var pattern1 = /[0-9]/;                        //숫자
		var pattern2 = /[a-zA-Z]/;                    //영문
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;    //특수문자
		var pattern4 = /([^가-힣\x20])/i; //한글
		
		if(!form.id.value){
			alert("아이디를 입력하세요");
			form.id.focus();
			return false;		
		}
		if(form.id.value.length<6 || form.id.value.length>10){
			alert("아이디는 6~10자리로 입력하여야 합니다.")
			form.id.focus();
			return false;
		}
		if(!form.pwd1.value){
			alert("비밀번호를 입력하세요")
			form.pwd1.focus();
			return false;
		}else if(!form.pwd2.value){
			alert("비밀번호를 한번 더 입력하세요")
			form.pwd2.focus();
			return false;
		}
		if(form.pwd1.value != form.pwd2.value){
			alert("입력한 2개의 비밀번호가 일치하지 않습니다.")
			form.pwd1.focus();
			return false;
		}	
		if(!form.name.value){
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		}
		if(pattern4.test(form.name.value)){
			alert("이름은 한글만 입력 가능합니다.")
			form.name.focus();
			return false;
		}		
		if(!form.nickname.value){
			alert("닉네임을 입력하세요");
			form.nickname.focus();
			return false;
		}
		if(pattern3.test(form.nickname.value)){
			alert("닉네임에는 특수문자가 들어갈 수 없습니다.")
			form.nickname.focus();
			return false;
		}
		
		if(!form.email.value){
			alert("이메일을 입력하세요")
			form.email.focus();
			return false;
		}		
		
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		if(exptext.test(form.email.value)==false){
			alert("이메일 형식이 올바르지 않습니다.")
			form.email.focus();
			return false;
		}
		form.submit();
		alert("회원가입이 완료되었습니다.\n아이디와 비밀번호로 로그인 하시기 바랍니다.");
	}	
	
	</script>
	

</head>

<body>
<div class="testbox"> 
  <h1>Registration</h1>

  <form action="signup.do" name="signup" method="post">
 
  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="id" name="user_id" id="id" placeholder="ID" required/>
  <a class="confirmbutton" onclick="idCheck()" width="60px;" style="
    width: 60px;">confirm</a>
  <!-- <button id="id" name="id" onclick="idCheck()"></button> -->
  <hr>
  
  <label id="icon" for="name"><i class="icon-shield"></i></label>
  <input type="password" name="user_pwd" id="pwd1" placeholder="Password" required/>
  
  <label id="icon" for="name"><i class="icon-shield"></i></label>
  <input type="password" name="pwd2" id="pwd2" placeholder="Password Confirm" required/>
  
  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="text" name="user_nm" id="name" placeholder="Name" required/>
  
  <label id="icon" for="name"><i class="icon-user"></i></label>
  <input type="text" name="user_nicknm" id="nickname" placeholder="NickName" required/>
  
  <label id="icon" for="name"><i class="icon-envelope "></i></label>
  <input type="text" name="email" id="email" placeholder="Email" required/>
  
  <label id="icon" for="name"><i class="icon-envelope "></i></label>
  <input type="text" name="phone" id="phone" placeholder="Phone" required/>
  <hr>  
   
	<a class ="button" onclick="checkfield()">Register</a>
   <a class="button" onclick="history.go(-1)">Cancel</a>
  </form>
</div>
</body>

<script>
/* function idCheck(){
	var userId = $('#id').val();
	
	$.ajax({
		type	: "post",
		url 	: "/findlove/idCheck.do",
		data 	: userId,
		
		sucess : function(data) {
			if(data == 1)
				alert("아이디 중복 없음");
			else
				alert("아이디 중복!");
		} 
		

	});
	 
}  */
</script>
  
</html>