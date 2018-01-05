<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
   <title>연애의발견::회원가입</title>
   
   <!-- page link -->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
   <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/findlove/resources/css/sign.css">
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   <!-- CSS/STYLE -->
   

</head>

<body>
<c:import url="../include/header.jsp" />
<br><br><br><br><br><br><br>
<div class="testbox" style="width:600px; height:450px;"> 



  <br><h1>Registration</h1><br>

  <form action="signup.do" name="signup" method="post">
 
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-user"></i></label>
  <input type="text" style="width:460px; height:39px; margin-left:-5px;"name="user_id" id="checkaa" placeholder="아이디는 영문+숫자 포함 4자~10자까지 가능" required class="id" oninput="checkId()"/> 
  <hr>
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-shield"></i></label>
  <input type="password" name="user_pwd" style="width:200px; height:39px; margin-left:-5px;"id="pwd1" placeholder="비밀번호 입력" required class="pass" oninput="checkPwd()"/>
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-shield"></i></label>
  <input type="password" name="pwd2"  style="width:200px; height:39px; margin-left:-5px;" placeholder="비밀번호 확인" required class="pass" id="repwd" oninput="checkPwd()"/>
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-user"></i></label>
  <input type="text" name="user_nm" id="name"  style="width:200px; height:39px; margin-left:-5px;" placeholder="이름은 한글만 가능" required oninput="checkName()" />
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-user"></i></label>  
  <input type="text" name="user_nicknm" id="checkbb" style="width:200px; height:39px; margin-left:-5px;" placeholder="닉네임 입력 " required class="nick" oninput="checkNick()"/>
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-envelope "></i></label>
  <input type="text" name="email" id="email" style="width:200px; height:39px; margin-left:-5px;" placeholder="이메일 입력" required oninput="checkEmail()"/>
  
  <label id="icon" for="name" style= "width : 45px;"><i class="icon-phone "></i></label>
  <input type="text" name="phone" id="cellPhone" style="width:200px; height:39px; margin-left:-5px;" placeholder="휴대폰 번호 입력" required oninput="checkPhone()" maxlength="13"/>
  <hr>
   <button type="submit" class="btn btn-danger float-right" style="margin-right:20px;background-color:#aaaaaa;"disabled="disabled">Sign Up</button>
   <button type="button" class="btn btn float-right" style="margin-right:10px;background-color : pink" onclick="history.go(-1)">Cancel</button>
  <!--  <a class="button" onclick="history.go(-1)" style= "width : 80px;">Cancel</a> -->
  </form>
</div>
<br><br><br><br>
      <c:import url="../include/footer.jsp" />  
</body>

<!-- 자바스크립트 -->
<script>
      $(function() {
         $('#mainNav').css('background-color', '#faadad');
      });
   </script>
<!-- 공란 체크 -->

<script type="text/javascript">

   /* function checkfield(){
      
      var form = document.signup;
      var pattern1 = /[0-9]/;                        //숫자
      var pattern2 = /[a-zA-Z]/;                    //영문
      var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;    //특수문자
      var pattern4 = /([^가-힣\x20])/i; //한글
      
      if(!form.id.value){
         swal({
            title:"warning!",
            text:"아이디를 입력하세요.",
            icon:"error",
            
         });
         form.id.focus();
         return false;      
      }
      if(form.id.value.length<4 || form.id.value.length>10){
         swal({
            title:"warning!",
            text:"아이디는 4~10자리로 입력하여야 합니다.",
            icon:"error",            
         });         
         form.id.focus();
         return false;
      }
      if(!form.pwd1.value){
         swal({
            title:"warning!",
            text:"비밀번호를 입력하세요.",
            icon:"error",            
         });            
         form.pwd1.focus();
         return false;
      }else if(!form.pwd2.value){
         swal({
            title:"warning!",
            text:"비밀번호를 한번 더 입력하세요.",
            icon:"error",            
         });            
         form.pwd2.focus();
         return false;
      }
      if(form.pwd1.value != form.pwd2.value){
         swal({
            title:"warning!",
            text:"입력한 2개의 비밀번호가 일치하지 않습니다.",
            icon:"error",            
         });            
         form.pwd1.focus();
         return false;
      }   
      if(!form.name.value){
         swal({
            title:"warning!",
            text:"이름을 입력하세요.",
            icon:"error",            
         });            
         form.name.focus();
         return false;
      }
      if(pattern4.test(form.name.value)){
         swal({
            title:"warning!",
            text:"이름은 한글만 입력 가능합니다.",
            icon:"error",            
         });            
         form.name.focus();
         return false;
      }      
      if(!form.nickname.value){
         swal({
            title:"warning!",
            text:"닉네임을 입력하세요.",
            icon:"error",            
         });   
         form.nickname.focus();
         return false;
      }
      if(pattern3.test(form.nickname.value)){
         swal({
            title:"warning!",
            text:"닉네임에는 특수문자가 들어갈 수 없습니다.",
            icon:"error",         
         });            
         form.nickname.focus();
         return false;
      }
      
      if(!form.email.value){
         swal({
            title:"warning!",
            text:"이메일을 입력하세요.",
            icon:"error",            
         });            
         form.email.focus();
         return false;
      }
      if(!form.phone.value){
         swal({
            title:"warning!",
            text:"휴대폰 번호를 입력하세요.",
            icon:"error",            
         });            
         form.phone.focus();
         return false;
      }
      
      var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
      
      if(exptext.test(form.email.value)==false){
         swal({
            title:"warning!",
            text:"이메일 형식이 올바르지 않습니다.",
            icon:"error",            
         });         
         form.email.focus();
         return false;
      }
      form.submit();
      swal({
         title:"Good Job!",
         text:"회원가입이 완료되었습니다.\n아이디와 비밀번호로 로그인 하시기 바랍니다.",
         icon:"success",            
      });         
   } */
   
   var idCheck = 0;
   var nickCheck = 0;
    var pwdCheck = 0;
    var nameCheck = 0;
   var emailCheck = 0;
    var phoneCheck = 0;
   function checkId() {
        var inputed = $('.id').val();
        $.ajax({
            data : {
                user_id : inputed
            },
            url : "checkId.do",
            success : function(data) {
                if(inputed=="" && data=='1') {
                    $(".btn-danger").prop("disabled", true);
                    $(".btn-danger").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFFFFF");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#checkaa").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1  && nickCheck == 1 && nameCheck==1 && emailCheck == 1 && phoneCheck ==1) {
                        $(".btn-danger").prop("disabled", false);
                        $(".btn-danger").css("background-color", "pink");
                    } 
                } else if (data == '1') {
                    $(".btn-danger").prop("disabled", true);
                    $(".btn-danger").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            }
        });        
    }
   function checkNick() {
        var inputed = $('.nick').val();
        $.ajax({
            data : {
                user_nicknm : inputed
            },
            url : "checkNick.do",
            success : function(data) {
                if(inputed=="" && data=='1') {
                    $(".btn-danger").prop("disabled", true);
                    $(".btn-danger").css("background-color", "#aaaaaa");
                    $("#checkbb").css("background-color", "#FFFFFF");
                    nickCheck = 0;
                } else if (data == '0') {
                    $("#checkbb").css("background-color", "#B0F6AC");
                    nickCheck = 1;
                    if(idCheck==1 && pwdCheck == 1  && nickCheck == 1 && nameCheck==1 && emailCheck == 1 && phoneCheck ==1) {
                        $(".btn-danger").prop("disabled", false);
                        $(".btn-danger").css("background-color", "pink");
                    } 
                } else if (data == '1') {
                    $(".btn-danger").prop("disabled", true);
                    $(".btn-danger").css("background-color", "#aaaaaa");
                    $("#checkbb").css("background-color", "#FFCECE");
                    nickCheck = 0;
                } 
            }
        });        
    }
   function checkPwd() {
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            if(reinputed==""){
               $(".btn-danger").prop("disabled", true);
                $(".btn-danger").css("background-color", "#aaaaaa");
                $("#repwd").css("background-color", "#FFFFFF");
            }else{
           $(".btn-danger").prop("disabled", true);
            $(".btn-danger").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
            }
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1  && nickCheck == 1) {
                $(".btn-danger").prop("disabled", false);
                $(".btn-danger").css("background-color", "pink");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".btn-danger").prop("disabled", true);
            $(".btn-danger").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
            
        }
    }
   function checkName() {
      var pattern4 = /([^가-힣\x20])/i; //한글 이름 형식
        var inputed = $("#name").val();
        if(inputed=="" || pattern4.test(inputed)!=false || inputed.length<2 || inputed.length>4){
            if(inputed==""){
               $(".btn-danger").prop("disabled", true);
                $(".btn-danger").css("background-color", "#aaaaaa");
                $("#name").css("background-color", "#FFFFFF");
            }else{
           $(".btn-danger").prop("disabled", true);
            $(".btn-danger").css("background-color", "#aaaaaa");
            $("#name").css("background-color", "#FFCECE");
            }
        }
        else{
            $("#name").css("background-color", "#B0F6AC");
            nameCheck = 1;
            if(idCheck==1 && pwdCheck == 1  && nickCheck == 1 && nameCheck==1 && emailCheck == 1 && phoneCheck ==1) {
                $(".btn-danger").prop("disabled", false);
                $(".btn-danger").css("background-color", "pink");
            }
        }
    }
   function checkEmail() {
      var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //이메일 형식
        var inputed = $("#email").val();
        if(inputed=="" || exptext.test(inputed)==false){
            if(inputed==""){
               $(".btn-danger").prop("disabled", true);
                $(".btn-danger").css("background-color", "#aaaaaa");
                $("#email").css("background-color", "#FFFFFF");
            }else{
           $(".btn-danger").prop("disabled", true);
            $(".btn-danger").css("background-color", "#aaaaaa");
            $("#email").css("background-color", "#FFCECE");
            }
        }
        else{
            $("#email").css("background-color", "#B0F6AC");
            emailCheck = 1;
            if(idCheck==1 && pwdCheck == 1  && nickCheck == 1 && nameCheck==1 && emailCheck == 1 && phoneCheck ==1) {
                $(".btn-danger").prop("disabled", false);
                $(".btn-danger").css("background-color", "pink");
            }
        }
    }
   function checkPhone() {
      var exptext1 = /([^0-9\x20])/i; //핸드폰 형식
        var inputed = $("#cellPhone").val();
        if(inputed=="" || inputed.length != 13){
            if(inputed==""){
               $(".btn-danger").prop("disabled", true);
                $(".btn-danger").css("background-color", "#aaaaaa");
                $("#cellPhone").css("background-color", "#FFFFFF");
            }else{
           $(".btn-danger").prop("disabled", true);
            $(".btn-danger").css("background-color", "#aaaaaa");
            $("#cellPhone").css("background-color", "#FFCECE");
            }
        }
        else{
            $("#cellPhone").css("background-color", "#B0F6AC");
            phoneCheck = 1;
            if(idCheck==1 && pwdCheck == 1  && nickCheck == 1 && nameCheck==1 && emailCheck == 1 && phoneCheck ==1) {
                $(".btn-danger").prop("disabled", false);
                $(".btn-danger").css("background-color", "pink");
            }
        }
    }
   function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
   </script>

  
</html>