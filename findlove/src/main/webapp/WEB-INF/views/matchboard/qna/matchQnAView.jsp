<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
    .btn-block{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
  }
  .btn-block:hover{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
    Opacity : 0.8;
  }
  .btn-block:active{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
    Opacity : 0.8;
  }
  </style>
  
</head>
<body>
<c:import url="../../include/header.jsp"/>

<br><br><br><br><br><br><br><br>
<%-- <c:forEach var="a" items="${requestScope.matchQnA}"> --%>
<div class="container question-container">

  <h2>첫번째 질문</h2>
  <div class="well">${requestScope.matchQnA1.question }</div>
  <h2>답변</h2>
  <button type="button" class="btn btn-default btn-block" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','1');">${requestScope.matchQnA1.choice1 }</button>
  <button type="button" class="btn btn-default btn-block" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','2');">${requestScope.matchQnA1.choice2 }</button>
  <button type="button" class="btn btn-default btn-block" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','3');">${requestScope.matchQnA1.choice3 }</button>
</div>
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
	});
	
	
</script>


<script>
function selectChoise(matchingUserId, questionNo,answerNo) {
    /*  var modal = $('#exampleModal');
     var message = $('#message-text').val(); */
     

     $.ajax({
        url : 'selectMatchUserQnA.do',
        type : 'post',
        data : {
           "matchingUserId" : matchingUserId,
           "questionNo" : questionNo,
           "answerNo" : answerNo
        },
        success : function(data) {
        	var values = "<h2>두번째 질문</h2>"
        	  +"<div class='well'>${requestScope.matchQnA2.question }</div>"
        	  +"<h2>답변</h2>"
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'1\');">${requestScope.matchQnA2.choice1 }</button>'
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'2\');">${requestScope.matchQnA2.choice2 }</button>'
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'3\');">${requestScope.matchQnA2.choice3 }</button>';
        	  if (data != 0) {
                  alert("맞춤!");
        		  $('.container.question-container').html(values);
        	  }else{
        		  alert("틀림!");
        		  document.location.href="todayMatchCheck.do?userId=${user_id}&result=0";
        	  }
           
        },
        error : function(data) {
           alert("메세지 오류!");
           modal.modal('hide');
        }
     })}

     
function selectChoise1(matchingUserId, questionNo,answerNo) {   
     $.ajax({
        url : 'selectMatchUserQnA.do',
        type : 'post',
        data : {
           "matchingUserId" : matchingUserId,
           "questionNo" : questionNo,
           "answerNo" : answerNo
        },
        success : function(data) {
        	var values = "<h2>세번째 질문</h2>"
        	  +"<div class='well'>${requestScope.matchQnA3.question }</div>"
        	  +"<h2>답변</h2>"
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'1\');">${requestScope.matchQnA3.choice1 }</button>'
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'2\');">${requestScope.matchQnA3.choice2 }</button>'
        	  +'<button type="button" class="btn btn-default btn-block" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'3\');">${requestScope.matchQnA3.choice3 }</button>';
        	  
        	  if (data != 0) {
                  alert("맞춤!");
        		$('.container.question-container').html(values);
        	  }else{
        		  alert("틀림!");
        		  document.location.href="todayMatchCheck.do?userId=${user_id}&result=0";
        	  }
           
        },
        error : function(data) {
           alert("메세지 오류!");
           modal.modal('hide');
        }
     })}
function selectChoise2(matchingUserId, questionNo,answerNo) {
    /*  var modal = $('#exampleModal');
     var message = $('#message-text').val(); */
     

     $.ajax({
        url : 'selectMatchUserQnA.do',
        type : 'post',
        data : {
           "matchingUserId" : matchingUserId,
           "questionNo" : questionNo,
           "answerNo" : answerNo
        },
        success : function(data) {
        	if (data != 0) {
                alert("맞춤!");
                document.location.href="todayMatchCheck.do?userId=${user_id}&result=1"; 
      	  }else{
      		  alert("틀림!");
      			document.location.href="todayMatchCheck.do?userId=${user_id}&result=0"; 
      	  } 
        },
        error : function(data) {
           alert("메세지 오류!");
           modal.modal('hide');
        }
     })}
</script>
</body>
</html>