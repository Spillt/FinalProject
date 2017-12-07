<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>SignUp</title>
<script type="text/javascript">
/* //<![CDATA[
    function check() {
        var form = document.getElementById("signUpForm");
        //TODO 유효성 검사
        return true;
    }
//]]> */
</script>          
</head>
<body>
 
<div id="wrap">
     
 
    <div id="container">
        <div id="content" style="min-height: 800px;">
            <div id="url-navi">회원</div>
 
<!-- 본문 시작 -->
<h1>회원가입</h1>
<form id="signUpForm" action="signUp" method="post" onsubmit="return check()">
<table>
<tr>
    <td style="width: 200px;">이름</td>
    <td style="width: 390px"><input type="text" name="name" style="width: 99%;" /></td>
</tr>
<tr>
    <td style="width: 200px;">닉네임</td>
    <td style="width: 390px"><input type="text" name="nickname" style="width: 99%;" /></td>
</tr>
<tr>
    <td>비밀번호</td>
    <td><input type="password" name="passwd" style="width: 99%;" /></td>
</tr>
<tr>
    <td>비밀번호 확인</td>
    <td><input type="password" name="passwdconfirm" style="width: 99%;" /></td>
</tr>
<tr>
    <td>Email</td>
    <td><input type="text" name="email" style="width: 99%;" /></td>
</tr>
<tr>
    <td>휴대폰</td>
    <td><input type="text" name="phone" style="width: 99%;" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="확인" />
</div>
</form>
<!--  본문 끝 -->
 
        </div><!-- content 끝 -->
    </div><!--  container 끝 -->
   
  
 
</div>
 
</body>
</html>