<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>


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

.container.top {
	margin-top: 100px;
}
/*    --------------------------------------------------
	:: General
	-------------------------------------------------- */
body {
	font-family: 'Open Sans', sans-serif;
	color: #353535;
}
.content h1 {
	text-align: center;
}
.content .content-footer p {
	color: #6d6d6d;
    font-size: 12px;
    text-align: center;
}
.content .content-footer p a {
	color: inherit;
	font-weight: bold;
}

/*	--------------------------------------------------
	:: Table Filter
	-------------------------------------------------- */
.panel {
	border: 1px solid #ddd;
	background-color: #fcfcfc;
}
.panel .btn-group {
	margin: 15px 0 30px;
}
.panel .btn-group .btn {
	transition: background-color .3s ease;
}
.table-filter {
	background-color: #fff;
	border-bottom: 1px solid #eee;
}
.table-filter tbody tr:hover {
	cursor: pointer;
	background-color: #eee;
}
.table-filter tbody tr td {
	padding: 10px;
	vertical-align: middle;
	border-top-color: #eee;
}
.table-filter tbody tr.selected td {
	background-color: #eee;
}
.table-filter tr td:first-child {
	width: 38px;
}
.table-filter tr td:nth-child(2) {
	width: 35px;
}
.ckbox {
	position: relative;
}
.ckbox input[type="checkbox"] {
	opacity: 0;
}
.ckbox label {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.ckbox label:before {
	content: '';
	top: 1px;
	left: 0;
	width: 18px;
	height: 18px;
	display: block;
	position: absolute;
	border-radius: 2px;
	border: 1px solid #bbb;
	background-color: #fff;
}
.ckbox input[type="checkbox"]:checked + label:before {
	border-color: #2BBCDE;
	background-color: #2BBCDE;
}
.ckbox input[type="checkbox"]:checked + label:after {
	top: 3px;
	left: 3.5px;
	content: '\e013';
	color: #fff;
	font-size: 11px;
	font-family: 'Glyphicons Halflings';
	position: absolute;
}
.table-filter .star {
	color: #ccc;
	text-align: center;
	display: block;
}
.table-filter .star.star-checked {
	color: #F0AD4E;
}
.table-filter .star:hover {
	color: #ccc;
}
.table-filter .star.star-checked:hover {
	color: #F0AD4E;
}
.table-filter .media-photo {
	width: 55px;
}
.table-filter .media-body {
    display: block;
    /* Had to use this style to force the div to expand (wasn't necessary with my bootstrap version 3.3.6) */
}
.table-filter .media-meta {
	font-size: 11px;
	color: #999;
}
.table-filter .media .title {
	color: #2BBCDE;
	font-size: 14px;
	font-weight: bold;
	line-height: normal;
	margin: 0;
}
.table-filter .media .title span {
	font-size: .8em;
	margin-right: 20px;
}
.table-filter .media .title span.pagado {
	color: #5cb85c;
}
.table-filter .media .title span.pendiente {
	color: #f0ad4e;
}
.table-filter .media .title span.cancelado {
	color: #d9534f;
}
.table-filter .media .summary {
	font-size: 14px;
}
.modal-content {
	height: 70%;  
}
.container.top {
			margin-top: 150px;
		}
/* .modal-header {
	background-color: #faadad;
} */
</style>
<script src = " https://use.fontawesome.com/56a81332b8.js " > </script>
</head>
<body id="page-top">

<c:import url="../../include/header.jsp" />
<!-- <script type="text/javascript">


location.reload(); 
</script> -->
	<form name="myForm" action="/findlove/openSendMessageList.do" method="POST">
		<input type="hidden" name="sender_id" value="${ sessionScope.user_id }" />
	</form>

	<!-- Portfolio Grid -->
	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">나의매칭</strong>	
			</div>
		</div>
	</div>

	
	
	<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <br>
          <!-- <h1 class="my-4">Shop Name</h1> -->
          <div class="list-group">
            <a href="#" class="list-group-item">내가 호감을 보낸 이성</a>
            <a href="#" class="list-group-item active">나에게 호감을 보낸 이성</a>
            <a href="openSendGradeList.do?sender_id=${sessionScope.user_id}" class="list-group-item">내가 높은 평점을 준 이성</a>
            <a href="#" class="list-group-item">나에게 높은 평점을 준 이성</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <!-- <div class="card mt-4">
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
            <div class="card-body">
              <h3 class="card-title">내가 호감을 보낸 이성</h3>
              <h4>$24.99</h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
            </div>
          </div>
          /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	나에게 호감을 보낸 이성 [받은 메세지함]
            </div>
            <div class="card-body"> 
              <!--  <table id="tableData" class="table table-striped">
			   </table> -->
			   
			   <div class="container">
	<div class="row">
			<div class="col-md-12"> 
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" data-target="pagado">대기</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">승인</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">거절</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									 <c:choose>
										<c:when test="${ fn:length(map.list) > 0}">
											<c:forEach items="${ map.list }" var="mymessage">
												<c:choose>
													<c:when test="${ mymessage.accept_ST eq '1' }">
														<tr data-status="pendiente" data-toggle="modal" data-target="#exampleModal" data-whatever="${ mymessage.user_nicknm }"
														data-content="${ mymessage.message_content }">
															<td>
																<div class="ckbox">
																<input type="checkbox" id="checkbox3">
																<label for="checkbox3"></label>
																</div>
															</td>
															<td>
																<a href="javascript:;" class="star">
																<i class="glyphicon glyphicon-star"></i>
															<c:choose>
																<c:when test="${ mymessage.read_FL eq '0' }">
																	<i class="fa fa-envelope-o" aria-hidden="true"></i>
																</c:when>
																<c:otherwise>
																	<i class="fa fa-envelope-open-o" aria-hidden="true"></i>
																</c:otherwise>
															</c:choose>
																</a>
															</td>
															<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">
													<fmt:formatDate value="${ mymessage.send_DT }" pattern="yyyy년 MM월 dd일"/></span>
													<h4 class="title">
														${ mymessage.user_nicknm }님
														<span class="pull-right pendiente">승인상태</span>
													</h4>
													<p class="summary">${ mymessage.message_content }</a></p>
												</div>
											</div>
										</td>
									</tr>		
													</c:when>
													<c:when test="${ mymessage.accept_ST eq '2' }">
													<tr data-status="cancelado" data-toggle="modal" data-target="#exampleModal" data-whatever="${ mymessage.user_nicknm }"
													data-content="${ mymessage.message_content }">
															<td>
																<div class="ckbox">
																<input type="checkbox" id="checkbox3">
																<label for="checkbox3"></label>
																</div>
															</td>
															<td>
																<a href="javascript:;" class="star">
																<i class="glyphicon glyphicon-star"></i>
															<c:choose>
																<c:when test="${ mymessage.read_FL eq '0' }">
																	<i class="fa fa-envelope-o" aria-hidden="true"></i>
																</c:when>
																<c:otherwise>
																	<i class="fa fa-envelope-open-o" aria-hidden="true"></i>
																</c:otherwise>
															</c:choose>
																</a>
															</td>
															<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">
													<fmt:formatDate value="${ mymessage.send_DT }" pattern="yyyy년 MM월 dd일"/></span>
													<h4 class="title">
														${ mymessage.user_nicknm }님
														<span class="pull-right cancelado">거절상태</span>
													</h4>
													<p class="summary">${ mymessage.message_content }</a></p>
												</div>
											</div>
										</td>
									</tr>		
													</c:when>
													<c:otherwise>
													<tr data-status="pagado" data-toggle="modal" data-target="#exampleModal" data-whatever="${ mymessage.user_nicknm }"
													data-content="${ mymessage.message_content }">
													<!-- <tr data-status="pagado" class="selected" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> -->
															<td>
																<div class="ckbox">
																<input type="checkbox" id="checkbox3">
																<label for="checkbox3"></label>
																</div>
															</td>
															<td>
																<a href="javascript:;" class="star">
																<i class="glyphicon glyphicon-star"></i>
															<c:choose>
																<c:when test="${ mymessage.read_FL eq '0' }">
																	<i class="fa fa-envelope-o" aria-hidden="true"></i>
																</c:when>
																<c:otherwise>
																	<i class="fa fa-envelope-open-o" aria-hidden="true"></i>
																</c:otherwise>
															</c:choose>
																</a>
															</td>
															<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">
													<fmt:formatDate value="${ mymessage.send_DT }" pattern="yyyy년 MM월 dd일"/></span>
													<h4 class="title">
														${ mymessage.user_nicknm }님
														<span class="pull-right pagado">대기상태</span>
													</h4>
													<p class="summary">${ mymessage.message_content }</a></p>
												</div>
											</div>
										</td>
													</tr>	
													</c:otherwise>
												</c:choose> 										
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div> 
	</div>
</div>
              <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <a href="#" class="btn btn-success">수락</a>
              <hr> -->
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->
    
	

	
	<hr>	
	<c:import url="../../include/footer.jsp" /> 



<!-- <script type="text/javascript">
        var sender="${sessionScope.user_id}";
        
        $.ajax({
            url:"openSendMessageList.do",
            type: "post",
            dataType: "json",
            data : {"sender_id":sender},
            success : function(data){
               
               var jsonStr = JSON.stringify(data);
                                             
               var json = JSON.parse(jsonStr);
               
               // 리스트 처리
               var values='<tr>'
					+'<th>받은사람</th>'
					+'<th>내용</th>'
					+'<th>보낸 날짜</th>'
					+'<th>수락 여부</th>'
					+'</tr>';
					
               for (var i in json.sendList){
            	   values+='<tr>'
            	   +'<td><i class="fa fa-envelope-o" aria-hidden="true"></i>    '+decodeURIComponent(json.sendList[i].userNickNM)+'</a></td>'
            	   +'<td><a href="#" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">'+decodeURIComponent(json.sendList[i].messageContent)+'</a></td>'
            	   +'<td>'+json.sendList[i].sendDT+'</td>'
            	   /* +'<td>'+json.sendList[i].readFL+'</td>' */
            	   +'<td>'+json.sendList[i].acceptST+'</td>'
				   +'</tr>';
					}
         
               $('#tableData').html(values);
        
            },
            error : function(request, status, errorData){
                  alert("error code : " + request.status + "\n"
                        + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
                  }
            });   
</script> -->
<!-- <script type="text/javascript">
        var sender="${sessionScope.user_id}";
        
        $.ajax({
            url:"openSendMessageList.do",
            type: "post",
            data : {"sender_id":sender}
        });
</script> -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Message</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">보낸사람</label>
            <input type="text" class="form-control" id="recipient-name" readonly>
          </div>
          <div class="form-group">
            <label for="content-name" class="control-label">보낸날짜</label>
            <input type="text" class="form-control" id="content-name" readonly>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">내용</label>
            <textarea class="form-control" id="message-text" rows="7" readonly></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning btn-filter" onclick="acceptCheck()">수락</button>
		<button type="button" class="btn btn-danger btn-filter" onclick="acceptCheck()">거절</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  /* var date = */
	  var content = button.data('content')
	  var modal = $(this)
	  modal.find('.modal-title').text('Message')
	  modal.find('.modal-body input').val(recipient)
	 /*  modal.find('.modal-body input[2]').val(content) */
	})
</script>
<script type="text/javascript">
	$(function() {
    $('#mainNav').css('background-color', '#faadad');
 });
</script>
<script type="text/javascript">
	function acceptCheck() {
		var modal = $('#exampleModal');
		
		modal.modal('hide');
	}
</script>
<script>
$(document).ready(function () {

	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
 </script>

</body>

</html>
