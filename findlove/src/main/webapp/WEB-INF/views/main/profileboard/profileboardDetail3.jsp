<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견:프로필 상세보기</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://use.fontawesome.com/56a81332b8.js"></script>

<script type="text/javascript"
		src="/findlove/resources/js/star.js"></script>
		
<style type="text/css">
.container.top {
	margin-top: 100px;
}

.w3-container . h4 {
	color: #faadad;
}

.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('/findlove/resources/img/star/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 200px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
.btn btn-primary btn-lg btn-block {
	font-size: 5px;
}
</style>

</head>
<body id="page-top">

  	<c:import url="../../include/header.jsp" />
	<div class="container top">
		<div class="row"></div>
	</div>

	<c:set var="p" value="${ profile }" />
      
     <div class="container">
	 <br><br>
      
     <!-- The Grid -->
     <div class="w3-row-padding">
  
     <!-- Left Column -->
     <div class="w3-third">
    
     <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner" role="listbox">
    		<div class="carousel-item active">
      		<img src="/findlove/uploadfiles/profile/${ p.picture_NM }" style="width:100%; height:350px;">
    	</div>
    
    	<c:forEach items="${ profileImg }" var="result">
    	<div class="carousel-item">
      		<img src="/findlove/uploadfiles/profile/${ result }" style="width:100%; height:350px;">
    	</div>
    	</c:forEach>
    
  		</div>
  		
  		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="sr-only">Previous</span>
  		</a>
  		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="sr-only">Next</span>
  		</a>
		</div>
		
        <div class="w3-display-bottomleft w3-container w3-text-black">
        </div>
        </div>
        
        <div class="w3-container">
          <br>
          <h2>${ p.user_NickNM }
          <c:choose>
			<c:when test="${ profile.gender eq 'M'}">(남)</c:when>
			<c:otherwise>(여)</c:otherwise>
			</c:choose>
          </h2>
          <img src="/findlove/resources/img/starGrade/starGrade${ p.grade_AVG }.png"
                  width=160, height=40>
          <br><br>
          <p style="font-size:18px"><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>디자이너</p>
          <p style="font-size:18px"><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal" style="font-size:36px"></i>${ p.area }</p>
          <p style="font-size:18px"><i class="fa fa-university fa-fw w3-margin-right w3-large w3-text-teal" style="font-size:36px"></i>${ p.achievement }</p>
          
          <hr>

          <div>
            <button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal"
                  data-target="#exampleModal" data-whatever="${ p.user_NickNM }">
             		호감 메세지 보내기</button>
            <p></p>
            <button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal"
                  data-target="#exampleModal3" data-whatever="${ p.user_NickNM }">
           			별점 매기기</button>
            <p></p>
            <%-- <button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal"
                  data-target="#exampleModal3" data-whatever="${ p.user_NickNM }">
            <i class="fa fa-heart-o" aria-hidden="true"></i> 신고하기</button>
            <p></p> --%>
          </div>
          <p></p>    
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h1 class="w3-text-grey w3-padding-16" align="center">MY PROFILE</h1>
        <div class="w3-container">
        
        <table class="table table-bordered">
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>나이</b></h4></td><td><h4>${ p.age }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>키/몸무게</b></h4></td><td><h4>${ p.height }cm/ ${ p.weight }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>학력</b></h4></td><td><h4>${ p.achievement }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>혈액형</b></h4></td><td><h4>${ p.blood_Type }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>흡연여부</b></h4></td><td><h4>${ p.smoking }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>음주여부</b></h4></td><td><h4>${ p.drinking }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>종교</b></h4></td><td><h4>${ p.religion }</h4></td>
 		  </tr>
 		  <tr>
 		  <td><h4 class="w3-opacity"><b>스타일</b></h4></td><td><h4>${ p.style }</h4></td>
 		  </tr>
		</table>
        
        
        
        
        
        
        
          <%-- <h5 class="w3-opacity"><b>나이</b></h5>
          <h4>${ p.age }</h4>
          <br>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>키/몸무게</b></h5>
          <!-- <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span class="w3-tag w3-teal w3-round">Current</span></h6> -->
          <h4>${ p.height }cm/ ${ p.weight }</h4>
          <br>
        </div> 
        <div class="w3-container">
          <h5 class="w3-opacity"><b>학력</b></h5>
          <!-- <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span class="w3-tag w3-teal w3-round">Current</span></h6> -->
          <h4>${ p.achievement }</h4>
          <br>
        </div> 
        <div class="w3-container">
          <h5 class="w3-opacity"><b>혈액형</b></h5>
          <h4>${ p.blood_Type }</h4>
          <br>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>흡연여부</b></h5>
          <h4><i class="material-icons" style="color:#faadad">smoking_rooms</i>${ p.smoking }</h4>
         <br>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>음주여부</b></h5>
          <h4><i class="material-icons" style="color:#faadad" >local_drink</i>${ p.drinking }</h4>
         <br>
        </div>
         <div class="w3-container">
          <h5 class="w3-opacity"><b>종교</b></h5>
          <h4>${ p.religion }</h4>
         <br>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>스타일</b></h5>
          <h4>${ p.style }</h4>
         <br>
        </div> --%>
        
      </div>

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div> 
        
        
      </div>
      <!-- /.container -->



   <!-- Clients -->
   <section class="py-5">
      <div class="container">
         <div class="row">
            <div class="col-md-3 col-sm-6">
               <a href="/profileboard/profileList.do"> <img
                  class="img-fluid d-block mx-auto"
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

   <!-- model -->
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
                  <%-- onclick="sendMessage('user77','${p.user_id}', '${sessionScope.Use_Point_CNT}')">10 별사탕차감</button> --%>
                  onclick="sendMessage('${sessionScope.user_id}','${p.user_id}')">10 별사탕 차감</button>
            </div>
         </div>
      </div>
   </div>
  
   <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel">별점 매기기</h4>
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
                  <!-- 별점 매기기 -->
                  <div class="form-group">
                  
                 <span class="star-input">
				  <span class="input">
				    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
				    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
				    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
				    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
				    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
				    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
				    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
				    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
				    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
				    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
				  </span>
				  <output for="star-input"><b>0</b>점</output>
				</span>
                  </div>
                  <div class="form-group">
							 
                     <label for="grade" class="control-label">내용:</label>
                     <textarea class="form-control" id="grade"></textarea>
                  
				</div>
                 
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary" onclick="sendGrade('${sessionScope.user_id}','${p.user_id}')">별점 매기기</button>
            </div>
            
         </div>
      </div>
   </div>
  
  
   <script type="text/javascript">
      $('#exampleModal').on('show.bs.modal', function(event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')// Extract info from data-* attributes
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
               url : 'sendMessage.do',
               type : 'post',
               data : {
                  "sender" : sender,
                  "reciever" : reciever,
                  "message" : message
               },
               success : function(data) {
                  if (data == 1) {
                     alert("메시지 보내기 성공!");
                     modal.modal('hide');
                  } else {
                     alert("별사탕 부족합니다.");
                     modal.modal('hide');
                  }
                  $('#message-text').val('');
               },
               error : function(data) {
                  alert("메세지 오류!");
                  modal.modal('hide');
               }
            })
      }
   </script>
   
   <script type="text/javascript">
      $('#exampleModal3').on('show.bs.modal', function(event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')// Extract info from data-* attributes
         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
         var modal = $(this)
         modal.find('.modal-title').text('별점 매기기')
         modal.find('.modal-body input').val(recipient)
      })
      
         function sendGrade(sender, reciever) {
         var modal = $('#exampleModal3');
         var grade = $('#grade').val();
         $.ajax({
            url : 'sendGrade.do',
            type : 'post',
            data : {
               "sender" : sender,
               "reciever" : reciever,
               "grade" : grade
            },
            success : function(data) {
                if (data == 1) {
                   alert("별점 매기기 성공!");
                   modal.modal('hide');
                } else {
                   alert("이미 메세지를 보냈습니다");
                   modal.modal('hide');
                }
                $('#grade').val('');
             },
             error : function(data) {
                alert("메세지 오류!");
                modal.modal('hide');
             }
          
         })
         
      }
      
   </script>
   
   <script type="text/javascript">
   $(function() {
       $('#mainNav').css('background-color', '#faadad');
    });
   </script>
  
   <hr>
   <c:import url="../../include/footer.jsp" />
      
</body>

</html>