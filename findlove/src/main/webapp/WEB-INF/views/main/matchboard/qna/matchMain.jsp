<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile, java.util.ArrayList, java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>연애의발견::매칭게시판</title>

<!-- Page link -->
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CSS 및 스타일 -->
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

.matchQnA:link {
	color: red;
	text-decoration: none;
}

.matchQnA:visited {
	color: black;
	text-decoration: none;
}

.matchQnA:hover {
	color: black;
	text-decoration: none;
}

.matchQnA {
	color: black; 
	text-decoration: none;
}

.container.top {
	margin-top: 150px;
}
</style>

</head>

<body id="page-top" style="font-size: 1.5rem">

	<!-- header -->
	<c:import url="../../../include/header.jsp" />

	<!-- title -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">매칭게시판</strong>
			</div>
		</div>
	</div>

	<!-- Page Contents -->
	<div class="container">
		<div class="row">
			
			<!-- Main Content -->
			<div class="col-12">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<strong>QnA 매칭</strong><br> 원하는 이성을 선택한 후 답변이 일치할 경우 호감메세지
						전송이 가능합니다.
					</div>
						<div class="card-body">
						<section>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="m" items="${requestScope.list}"	varStatus="status">
								<c:if test="${status.first}">
									<div class="item active">
								</c:if>
								<c:if test="${not status.first}">
									<div class="item">
								</c:if>
								<div class="container">
									<c:if test="${today_matching eq 0 }">
										<a href="selectmatchqna.do?matchingUserId=${m.user_id }"
											class="matchQnA" style="font-size:15px; color: black;">
									</c:if>
									<c:if test="${today_matching eq 1 }">
										<a href="#" class="matchQnA" onclick = "match('${m.user_id }');" style="color: black;">
									</c:if>
									<table class="table"
										style="width: 220pt; position: relative; left: 220px;">
										<thead>
											<tr>
												<th colspan="3" style="height: 200pt">
												<img src="/findlove/uploadfiles/profile/${ m.picture_nm }"
													style="width: 285px; height: 285px;">
													<div><strong>[${m.user_nm}](${m.rank_gb })</strong></div>
													<div style="font-size: 12pt; color: gray">${m.age }세,${m.blood_type }형,${m.area }</div>
												</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>${m.height }cm,${m.bodyform }</td>
											</tr>
											<tr>
												<td>${m.style }</td>
											</tr>
											<tr>
												<td>${m.job},${m.religion }</td>
											</tr>
											<tr>
												<td>평점 :
												
												
												<c:if test="${ m.grade_avg <0.5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade0.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=0.5 && m.grade_avg<1.0 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade0.5.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=1.0 && m.grade_avg<1.5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade1.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=1.5 && m.grade_avg<2.0 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade1.5.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=2.0 && m.grade_avg<2.5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade2.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=2.5 && m.grade_avg<3.0}">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade2.5.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=3.0 && m.grade_avg<3.5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade3.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=3.5 && m.grade_avg<4.0 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade3.5.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=4.0 && m.grade_avg<4.5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade4.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=4.5 && m.grade_avg<5.0 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade4.5.png"
													width=100, height=35></span>
												</c:if>
												<c:if test="${ m.grade_avg >=5 }">
												<span><img
													src="/findlove/resources/img/starGrade/starGrade5.png"
													width=100, height=35></span>
												</c:if>
					
					
					
					</td>
											</tr>
										</tbody>
									</table></a>									
								</div>
								
						</div>
						</c:forEach>		

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>


	<!-- footer -->
	<hr>
	<c:import url="../../../include/footer.jsp" />

	<script>
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
	   <script type="text/javascript">
	   function match(userId) {
		        		$('#exampleModal').modal('show')
		        	    var modal = $('#exampleModal')
		        	    modal.find('.modal-body input').val(userId)
		 }

      function rematching(userId) {
    	  	var matchUser = $('#recipient-name').val();
            var modal = $('#exampleModal');
            $.ajax({
               url : 'rematching.do',
               type : 'post',
               data : {
                  "userId" : userId
               },
               success : function(data) {
                  if (data == 1) {
                     alert("별사탕 차감됨!");
                     
                     document.location.href="selectmatchqna.do?matchingUserId=" + matchUser; 
                     modal.modal('hide');
                  } else {
                     alert("별사탕 부족합니다.");
                     modal.modal('hide');
                     document.location.href="selectuserlist.do?userId=${user_id}"
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
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel">매칭 안내</h4>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form>
               <div class="form-group">
                     <input type="hidden" class="form-control" id="recipient-name" readonly>
                  </div>
                  <div class="form-group">
                     <label for="message-text" class="control-label">매칭은 하루에 한번 가능합니다.<br> 한번 더 하실 경우 별사탕이 소모됩니다.</label>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="rematching('${sessionScope.user_id}',)">10 별사탕 차감</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>