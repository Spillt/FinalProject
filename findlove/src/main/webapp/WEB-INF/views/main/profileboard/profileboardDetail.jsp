<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 상세보기</title>

<style type="text/css">
.container.top {
	margin-top: 100px;
}

.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}

.hide-bullets li {
	display: inline;
}
</style>
</head>
<body id="page-top">

	<c:import url="../../include/header.jsp" />

	<div class="container top">
		<div class="row"></div>
	</div>

	<c:set var="p" value="${ profile }"></c:set>
	<div class="container">
		<br><br>
		<div class="row my-4">
			<div class="col-lg-3">

				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>

						<c:choose>
							<c:when test="${ fn:length(profileImg) > 0}">
								<c:forEach items="${ profileImg }" varStatus="status">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${status.index+1}"></li>
								</c:forEach>
							</c:when>
						</c:choose>

					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img src="/findlove/uploadfiles/profile/${ p.picture_NM }"
								style="width: 285px; height: 285px;">
						</div>

						<c:forEach items="${ profileImg }" var="result">
							<div class="carousel-item">
								<img src="/findlove/uploadfiles/profile/${ result }"
									style="width: 285px; height: 285px;">
							</div>
						</c:forEach>

					</div>

					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				
			</div>
			
			<div class="col-lg-5">
				<h1>${ p.user_NickNM }
				<c:choose>
				<c:when test="${ profile.gender eq 'M'}">
				(남)
				</c:when>
				<c:otherwise>
				(여)
				</c:otherwise>
				</c:choose>
				</h1>
				<span><img
					src="/findlove/resources/img/starGrade/starGrade${ p.grade_AVG }.png"
					width=225, height=62></span>

				<br><br><br>
				<div class="row hidden-xs" id="slider-thumbs">
					<!-- Bottom switcher of slider -->
					<ul class="hide-bullets">
						<li class="col-sm-2"><a class="thumbnail"><img
								src="/findlove/uploadfiles/profile/${ p.picture_NM }"
								style="width: 100px; height: 100px;"></a></li>
						<c:forEach items="${ profileImg }" var="result">
							<li class="col-sm-2"><img
								src="/findlove/uploadfiles/profile/${ result }"
								style="width: 100px; height: 100px;"></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-3">
			<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal"
					data-target="#exampleModal" data-msg="${ p.user_NickNM }">
					호감 메세지 보내기</button>

			<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal"
                    data-target="#exampleModal3" data-grade="${ p.user_NickNM }">
                  	별점 매기기</button>

			<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal"
                    data-target="#exampleModal2" data-report="${ p.user_NickNM }">
                  	신고하기</button>
			</div>
		</div>

		<div class="card text-white bg-secondary my-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">${ p.user_NickNM }님의 간단한 프로필 입니다
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 mb-6">
				<div class="card h-80">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<table class="table">
							<tr>
								<th>나이</th>
							</tr>
							<tr>
								<td>${ p.age }</td>
							</tr>
							<tr>
								<th>키/체형</th>
							</tr>
							<tr>
								<td>${ p.height }cm/${ p.bodyform }</td>
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
								<th>직업</th>
							</tr>
							<tr>
								<td>${ p.job }</td>
							</tr>
						</table>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">More Info</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 mb-6">
				<div class="card h-80">
					<div class="card-body">
						<h2 class="card-title">Card Two</h2>

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
		<div class="row"></div>
	</div>

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
                  onclick="sendMessage('${sessionScope.user_id}','${p.user_id}')">10 별사탕 차감</button>
            </div>
         </div>
      </div>
   </div>
   
   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel2">신고하기</h4>
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
                     <div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					    광고(스팸)
					  </label>
					</div>
					<div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					 욕설/비난
					  </label>
					</div>
					<div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					 욕설/비난부적절한 게시글
					  </label>
					</div>
					<div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					 도배
					  </label>
					</div>
                     
                  </div>
                   <div class="form-group">
                     <label for="message-text" class="control-label">기타이유:</label>
                     <textarea class="form-control" id="message-text" rows="7"></textarea>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="sendReport('${sessionScope.user_id}','${p.user_id}')">신고하기</button>
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
         var recipient = button.data('grade')// Extract info from data-* attributes
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