<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견::QnA매칭</title>
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
  .container.top{
   padding-top:150px;
  }
  
  div[class*=box] {
    height: 33.33%;
    width: 100%; 
  display: flex;
  justify-content: center;
  align-items: center;
}

.box-1 { background-color: #FAADAD; }
.box-2 { background-color: #FE7979; }
.box-3 { background-color: #FF6B6B; }

.btn {
    line-height: 40px;
    height: 40px;
    text-align: center;
    width: 250px;
    cursor: pointer;
}

/* 
========================
      BUTTON ONE
========================
*/
.btn-one {
    color: #FFF;
    transition: all 0.3s;
    position: relative;
}
.btn-one span {
    transition: all 0.3s;
}
.btn-one::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    opacity: 0;
    transition: all 0.3s;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-top-style: solid;
    border-bottom-style: solid;
    border-top-color: rgba(255,255,255,0.5);
    border-bottom-color: rgba(255,255,255,0.5);
    transform: scale(0.1, 1);
}
.btn-one:hover span {
    letter-spacing: 2px;
}
.btn-one:hover::before {
    opacity: 1; 
    transform: scale(1, 1); 
}
.btn-one::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    transition: all 0.3s;
    background-color: rgba(255,255,255,0.1);
}
.btn-one:hover::after {
    opacity: 0; 
    transform: scale(0.1, 1);
}
  
  */
.btn-two {
    color: #FFF;
    transition: all 0.5s;
    position: relative; 
}
.btn-two span {
    z-index: 2; 
    display: block;
    position: absolute;
    width: 100%;
    height: 100%;   
}
.btn-two::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    transition: all 0.5s;
    border: 1px solid rgba(255,255,255,0.2);
    background-color: rgba(255,255,255,0.1);
}
.btn-two::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    transition: all 0.5s;
    border: 1px solid rgba(255,255,255,0.2);
    background-color: rgba(255,255,255,0.1);
}
.btn-two:hover::before {
  transform: rotate(-45deg);
  background-color: rgba(255,255,255,0);
}
.btn-two:hover::after {
  transform: rotate(45deg);
  background-color: rgba(255,255,255,0);
}


/* 
========================
      BUTTON THREE
========================
*/
.btn-three {
    color: #FFF;
    transition: all 0.5s;
    position: relative;
}
.btn-three::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    background-color: rgba(255,255,255,0.1);
    transition: all 0.3s;
}
.btn-three:hover::before {
    opacity: 0 ;
    transform: scale(0.5,0.5);
}
.btn-three::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    opacity: 0;
    transition: all 0.3s;
    border: 1px solid rgba(255,255,255,0.5);
    transform: scale(1.2,1.2);
}
.btn-three:hover::after {
    opacity: 1;
    transform: scale(1,1);
}
.btn.btn-three {
	padding-top: 10px !important;
}

.problem-text {
	padding-top: 30px;
}

.btn-three span {
	font-size: 13px;
}




  .progressbar {
      counter-reset: step;
  }
  .progressbar li {
      list-style-type: none;
      width: 33%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
  }
  .progressbar li:before {
      width: 30px;
      height: 30px;
      content: counter(step);
      counter-increment: step;
      line-height: 30px;
      border: 2px solid #7d7d7d;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background-color: white;
  }
  .progressbar li:after {
      width: 100%;
      height: 2px;
      content: '';
      position: absolute;
      background-color: #7d7d7d;
      top: 15px;
      left: -50%;
      z-index: -1;
  }
  .progressbar li:first-child:after {
      content: none;
  }
  .progressbar li.active {
      color: #f77070;
      font-weight: bold;
  }
  .progressbar li.active:before {
      border-color: #f77070;
  }
  .progressbar li.active + li:after {
      background-color: #f77070;
  }
  
</style>
  
</head>
<body id= "page-top" style="font-size:1.5rem">
<!-- header -->
<c:import url="../../../include/header.jsp"/>

<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">QnA매칭</strong>
			</div>
		</div>
	</div>
	<br>

	<div class="container" style="margin-bottom:20px">
		<div class="row">
			<div class="col"></div>
			<div class="col-sm-8">
	
			    <ul class="progressbar">
			        <li class="active">문제 1</li>
			        <li>문제 2</li>
			        <li>문제 3</li>
				</ul>
			</div>
			<div class="col"></div>
		</div>
	</div>
	
<div class="container question-container">
	<div class="row">
		<div class="col"></div>
		<div class="col-sm-8">
			<div class="row">
				<div class="col-6" style="background-color: #FFE0E0;">
					<h2 class="question-number" style="margin-top:20px">Question 1</h2>
					<div class="problem-text" style="margin-top:20px">${requestScope.matchQnA1.question }</div>
				</div>
				<div class="col-6 answer-text" style="min-height: 250px">
				
					<div class="box-1"><div class="btn btn-three" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','1');"><span>${requestScope.matchQnA1.choice1 }</span></div></div>
					<div class="box-2"><div class="btn btn-three" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','2');"><span>${requestScope.matchQnA1.choice2 }</span></div></div>
					<div class="box-3"><div class="btn btn-three" onclick="selectChoise('${requestScope.matchingUserId }','${requestScope.matchQnA1.question_no }','3');"><span>${requestScope.matchQnA1.choice3 }</span></div></div>

				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>

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
        	
        	
        	var question = ''+ '${requestScope.matchQnA2.question }';
        	var answer = ''
        	  +'<div class="box-1"><div class="btn btn-three" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'1\');"><span>${requestScope.matchQnA2.choice1 }</span></div></div>'
          	  +'<div class="box-2"><div class="btn btn-three" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'2\');"><span>${requestScope.matchQnA2.choice2 }</span></div></div>'
          	  +'<div class="box-3"><div class="btn btn-three" onclick="selectChoise1(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA2.question_no }\',\'3\');"><span>${requestScope.matchQnA2.choice3 }</span></div></div>'

        	  if (data != 0) {
                  alert("맞춤!");
                  $('.question-number').text('Question 2');
                  $('.problem-text').text(question);
        		  $('.answer-text').html(answer);
        		  
        		  $('.progressbar li:eq(1)').addClass('active');
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
        	
        	$('.question-number').text('Question 3');
     		var question = ''+ '${requestScope.matchQnA3.question }';
          	var answer = ''
           	  +'<div class="box-1"><div class="btn btn-three" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'1\');"><span>${requestScope.matchQnA3.choice1 }</span></div></div>'
           	  +'<div class="box-2"><div class="btn btn-three" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'2\');"><span>${requestScope.matchQnA3.choice2 }</span></div></div>'
           	  +'<div class="box-3"><div class="btn btn-three" onclick="selectChoise2(\'${requestScope.matchingUserId }\',\'${requestScope.matchQnA3.question_no }\',\'3\');"><span>${requestScope.matchQnA3.choice3 }</span></div></div>'

           	  if (data != 0) {
           		  $('.progressbar li:eq(2)').addClass('active');
                     alert("맞춤!");
                  $('.problem-text').text(question);
           		  $('.answer-text').html(answer);
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
        		match("${requestScope.matchingUserId }");
                /* document.location.href="todayMatchCheck.do?userId=${user_id}&result=1"; */ 
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
<script type="text/javascript">
function match(userId) {
	
	$.ajax({
        url : 'userNickNMCheck.do',
        type : 'post',
        data : {
           "user_id" : userId
        },
        success : function(data) {
           if (data != null) {
        		$('#exampleModal').modal('show')
        	    var button = $(data.relatedTarget) // Button that triggered the modal
        	    var recipient = button.data(data)// Extract info from data-* attributes
        	    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        	    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        	    var modal = $('#exampleModal')
        	    modal.find('.modal-title').text('호감 메세지 보내기')
        	    modal.find('.modal-body input').val(data)
           } else {
              
           }

        },
        error : function(data) {
           alert("메세지 오류!");
           modal.modal('hide');
        }
     })
	
	
	
 }



      $('#exampleModal').on('show.bs.modal', function(event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('msg')// Extract info from data-* attributes
         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
         var modal = $(this)
         modal.find('.modal-title').text('호감 메세지 보내기')
         modal.find('.modal-body input').val(recipient)
      })

      function sendMessage(sender, reciever) {
            var modal = $('#exampleModal');
            var message = $('#message-text').val();
            $.ajax({
               url : 'QnAsendMessage.do',
               type : 'post',
               data : {
                  "sender" : sender,
                  "reciever" : reciever,
                  "message" : message
               },
               success : function(data) {
                     alert("메시지 보내기 성공!");
                     modal.modal('hide');
                     document.location.href="todayMatchCheck.do?userId=${user_id}&result=0";
                  
                  $('#message-text').val('');
               },
               error : function(data) {
                  alert("메세지 오류!");
                  modal.modal('hide');
               }
            })
      }
   </script>
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel">호감 메세지 보내기</h4>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <label for="recipient-name" class="control-label">받는사람:</label> <input
                        type="text" class="form-control" id="recipient-name" readonly>
                  </div>
                  <div class="form-group">
                     <label for="message-text" class="control-label">내용:</label>
                     <textarea class="form-control" id="message-text" rows="7"></textarea>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="sendMessage('${sessionScope.user_id}','${requestScope.matchingUserId}')">메세지 보내기</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>