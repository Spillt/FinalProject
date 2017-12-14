<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견::프로필 상세보기</title>
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<style type="text/css">
.portfolio-item-inner {
   line-height: 1.42857143;
   background-color: #fff;
   border-radius: 2px;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
      rgba(0, 0, 0, 0.12);
   transition: box-shadow .25s;
}

.portfolio-item-inner:hover {
   box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19);
}

.row.panel-title {
   padding-top: 5px;
   border: 1px solid lightgray;
   text-align: left;
}

.row.panel-body {
   padding-top: 10px;
   border: 1px solid lightgray;
   border-top: 0;
}

.portfolio-caption span .material-icons.heart {
   color: #faadad
}

.portfolio-caption span .material-icons.star {
   color: #F7EC98
}

.pannel {
   margin-right: 10px;
}

.masthead {
   margin-bottom: 20px;
}
</style>
</head>
<body id="page-top">
   <%-- <h1>home.jsp</h1>
<c:if test="${empty sessionScope.user }">
   <form action="login.do" method="post">
      <input type="text" name="userId">
      <input type="password" name="userPwd">
      <input type="submit" value="로그인">
   </form>
</c:if>
<c:if test="${!empty sessionScope.user }">
   <p>${user.userName } 님 환영합니다.</p>
</c:if> --%>

   <c:import url="../../include/header.jsp" />

   <!-- Header -->
   <header class="masthead">
      <div class="container">
         <div class="intro-text">
            <div class="intro-heading">&nbsp;</div>
            <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
               href="#services">시작하기</a>
         </div>
      </div>
   </header>



   <!-- Portfolio Grid -->
   <c:set var="p" value="${ profile }"></c:set>
   <div class="container">
      <div class="row">
         <div class="col-lg-12 text-center">
            <img class="img-fluid"
               src="/findlove/resources/img/ad/ad-banner.jpg">
         </div>
      </div>
   </div>

   <section class="bg-light" id="portfolio">

      <!-- Page Content -->
      <div class="container">

         <!-- Heading Row -->
         <div class="row my-4">
            <div class="col-lg-8">
               <img class="img-fluid rounded" src="http://placehold.it/900x400"
                  alt="">
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
               <h1>${ p.user_NickNM }</h1>
               <span><img
                  src="/findlove/resources/img/starGrade/starGrade${ p.grade_AVG }.png"
                  width=160, height=40></span>
               <p>This is a template that is great for small businesses</p>
               <!-- <a class="btn btn-primary btn-lg" href="#">Send Message</a> -->
               <button type="button" class="btn btn-primary" data-toggle="modal"
                  data-target="#exampleModal"">Send
                  Message</button>
               <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#exampleModal2" aria-label="Left Align">
                  <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span> 신고하기
               </button>
            </div>
            <!-- /.col-md-4 -->
         </div>
         <!-- /.row -->

         <!-- Call to Action Well -->
         <div class="card text-white bg-secondary my-4 text-center">
            <div class="card-body">
               <p class="text-white m-0">${ p.user_NickNM }님의간단한 프로필 입니다
            </div>
         </div>

         <!-- Content Row -->
         <div class="row">
            <div class="col-md-6 mb-6">
               <div class="card h-80">
                  <div class="card-body">
                     <h2 class="card-title">Card One</h2>
                     <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. Rem magni quas ex numquam, maxime minus quam
                        molestias corporis quod, ea minima accusamus.</p> -->
                     <table class="table">
                        <tr>
                           <th>나이</th>
                        </tr>
                        <tr>
                           <td>${ p.age }</td>
                        </tr>
                        <tr>
                           <th>키/몸무게</th>
                        </tr>
                        <tr>
                           <td>${ p.height }cm/ ${ p.weight }</td>
                        </tr>
                        <tr>
                           <th>지역</th>
                        </tr>
                        <tr>
                           <td>${ p.area }</td>
                        </tr>
                        <tr>
                           <th>학력</th>
                        </tr>
                        <tr>
                           <td>${ p.achievement }</td>
                        </tr>
                        <tr>
                           <th>취미</th>
                        </tr>
                        <tr>
                           <td>${ p.hobby }</td>
                        </tr>
                     </table>
                  </div>
                  <div class="card-footer">
                     <a href="#" class="btn btn-primary">More Info</a>
                  </div>
               </div>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-6 mb-6">
               <div class="card h-80">
                  <div class="card-body">
                     <h2 class="card-title">Card Two</h2>
                     <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. Quod tenetur ex natus at dolorem enim!
                        Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id
                        dolore voluptates quos eligendi labore.</p> -->
                     <table class="table">
                        <tr>
                           <th>혈액형</th>
                        </tr>
                        <tr>
                           <td>${ p.blood_Type }</td>
                        </tr>
                        <tr>
                           <th>흡연여부</th>
                        </tr>
                        <tr>
                           <td>${ p.smoking }</td>
                        </tr>
                        <tr>
                           <th>음주여부</th>
                        </tr>
                        <tr>
                           <td>${ p.drinking }</td>
                        </tr>
                        <tr>
                           <th>종교</th>
                        </tr>
                        <tr>
                           <td>${ p.religion }</td>
                        </tr>
                        <tr>
                           <th>스타일</th>
                        </tr>
                        <tr>
                           <td>${ p.style }</td>
                        </tr>
                     </table>
                  </div>
                  <div class="card-footer">
                     <a href="#" class="btn btn-primary">More Info</a>
                  </div>
               </div>
            </div>

         </div>
         <!-- /.row -->

      </div>
      <!-- /.container -->

      <!-- Bootstrap core JavaScript -->
      <script src="/findlove/js/jquery.min.js"></script>
      <script src="/findlove/js/bootstrap.bundle.min1.js"></script>
   </section>


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
                        type="text" class="form-control" id="recipient-name"
                        value=${ p.user_NickNM } readonly>
                  </div>
                  <div class="form-group">
                     <label for="message-text" class="control-label">내용:</label>
                     <textarea class="form-control" id="message-text"></textarea>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  <%-- onclick="sendMessage('user77','${p.user_id}', '${sessionScope.Use_Point_CNT}')">10 포인트 차감</button> --%>
                  onclick="sendMessage('user11','${p.user_id}', '30')">10 별사탕 차감</button>
            </div>
         </div>
      </div>
   </div>
   
   <!-- model -->
   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel">New message</h4>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <label for="recipient-name" class="control-label">신고대상자:</label> <input
                        type="text" class="form-control" id="recipient-name"
                        value=${ p.user_NickNM } readonly>
                  </div>
                  <div class="form-group">
                     <label for="message-text2" class="control-label">신고사유:</label>
                     <textarea class="form-control" id="message-text2"></textarea>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="sendReport('user11','${ p.user_id }')">Send
                  message</button>
            </div>
         </div>
      </div>
   </div>

   <script type="text/javascript">
      $('#exampleModal').on('show.bs.modal', function(event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = ${ p.user_NickNM }// Extract info from data-* attributes
         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
         var modal = $(this)
         modal.find('.modal-title').text('New message to ' + recipient)
         modal.find('.modal-body input').val(recipient)
      })

      function sendMessage(sender, reciever, point) {
         if(point > 9) {
            var modal = $('#exampleModal');
            var message = $('#message-text').val();
            $.ajax({
               url : '/findlove/message/sendMessage.do',
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
                     alert("메시지 보내기 실패");
                     modal.modal('hide');
                  }
                  $('#message-text').val('');
               },
               error : function(data) {
                  alert("메시지보내기 오류");
                  modal.modal('hide');
               }
            })
         }else{
            alert('포인트가 부족합니다.');
         }
      }
   </script>
   <script type="text/javascript">
      $('#exampleModal2').on('show.bs.modal', function(event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = ${ p.user_NickNM } // Extract info from data-* attributes
         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
         var modal = $(this)
         modal.find('.modal-title').text('New message to ' + recipient)
         modal.find('.modal-body input').val(recipient)
      })

      function sendReport(sender, reciever) {
         var modal = $('#exampleModal2');
         var message = $('#message-text2').val();
         $.ajax({
            url : '/findlove/report/sendReport.do',
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
                  alert("메시지 보내기 실패");
                  modal.modal('hide');
               }
               $('#message-text2').val('');
            },
            error : function(data) {
               alert("메시지보내기 오류");
               modal.modal('hide');
            }
         })
      }
   </script> 
   <hr>
   <c:import url="../../include/footer.jsp" />

   <script type="text/javascript"
      src="/findlove/resources/js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript"
      src="/findlove/resources/js/bootstrap.bundle.min.js"></script>
   <script type="text/javascript"
      src="/findlove/resources/js/contact_me.js"></script>
   <script type="text/javascript"
      src="/findlove/resources/js/jqBootstrapValidation.js"></script>
   <script type="text/javascript"
      src="/findlove/resources/js/jquery.easing.min.js"></script>
   <script type="text/javascript"
      src="/findlove/resources/js/agency.min.js"></script>
      
</body>

</html>