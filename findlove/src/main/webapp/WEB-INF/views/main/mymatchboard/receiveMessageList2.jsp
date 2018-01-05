<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>


<style type="text/css">
.container.top {
	margin-top: 150px;
}
th {
	color: #faadad;
}
.hidden-tr {
	display: none;
}
.table-cursor {
	cursor: pointer;
}
.material-icons.report-detail-icon {
	color: #faadad;
}
tbody tr:nth-child(4n-1) {
	background-color: white !important;
}

tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
}
</style>
<script src=" https://use.fontawesome.com/56a81332b8.js " > </script>
</head>
<body id="page-top">

<c:import url="../../include/header.jsp" />

	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">나의 매칭</strong>	
			</div>
		</div>
	</div>

    <div class="container" style="min-height: 600px">

      <div class="row">
        <div class="col-lg-3">
          <br>
          <div class="list-group">
            <a href="openSendMessageList.do?user_id=${ sessionScope.user_id }" class="list-group-item">내가 호감을 보낸 이성</a>
            <a href="#" class="list-group-item active">나에게 호감을 보낸 이성</a>
            <a href="openSendGradeList.do?user_id=${sessionScope.user_id}" class="list-group-item">내가 높은 평점을 준 이성</a>
            <a href="openReceiveGradeList.do?user_id=${sessionScope.user_id}" class="list-group-item">나에게 높은 평점을 준 이성</a>
          </div>
        </div>

        <div class="col-lg-9">
          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	나에게 호감을 보낸 이성 [받은 메세지함]
            </div>
            
            <div class="card-body"> 
			   
			   <div class="container">
					<div class="row">
					<c:choose>
						<c:when test="${ fn:length(map.list) > 0}">
						
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th>사진</th>
									<th>보낸 사람</th>
									<th>메세지 내용</th>
									<th>보낸 날짜</th>
									<th>읽은 여부</th>
									<th>수락 상태</th>
									<th>상세 보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ map.list }" var="m">
							   		<tr class="table-cursor">
							   		 		
							   		<td style="padding: 0"><img src="/findlove/uploadfiles/profile/${ m.picture_nm }" style="width: 50px; height: 50px;" alt=""></td>
							   		<td>${ m.user_nicknm }</td>
							   		<td>${ m.message_content }</td>
							   		<td><fmt:formatDate value="${ m.send_DT }" pattern="yyyy년 MM월 dd일"/></td>
							   		<c:choose>
							   			<c:when test="${ m.read_FL eq '0' }">
							   				<td>안읽음</td>
							   			</c:when>
							   			<c:otherwise>
							   				<td>읽음</td>
							   			</c:otherwise>
							   		</c:choose>
							   		<c:choose>
							   		   <c:when test="${ m.accept_ST eq '0' }">
							   		   	  <td class="text-warning">대기상태</td>
							   		   </c:when>
							   		   <c:when test="${ m.accept_ST eq '1' }">
							   		   	  <td class="text-success">완료상태</td>
							   		   </c:when>
							   		</c:choose>
							   		<td><a class="message-detail-btn"><i class="material-icons report-detail-icon">details</i></a></td>
							   		</tr>
							   		
							   		
							   		<tr id="message${m.message_no}" style="border: 2px solid #faadad;" class="hidden-tr">
								<td colspan="3">
									<div style="color:#faadad; font-weight:bold">보낸 사람</div>
									<hr><br>
									<div class="table-cursor userdetail-btn">${ m.user_nicknm }</div>
								</td>
								
								<td colspan="4" class="text-center">
									<div style="color:#faadad; font-weight:bold" class="row">
										<div class="col"></div>
										<div class="col-4">메세지 상세 내용</div>
										<div class="col">
										<c:choose>
											<c:when test="${ m.accept_ST eq '0' }">
												<div class="btn-group float-right" style="margin-top: -3px">
													<button type="button" class="btn btn-sm btn-danger btn-report-suspend" >수락</button>
													<button type="button" class="btn btn-sm btn-secondary btn-report-hold">거절</button>
												</div>
											</c:when>
											<c:when test="${ m.accept_ST eq '1' }">
											</c:when>
										</c:choose>
											
										</div>
									</div>
									
									<hr style="margin-top: 10px"><br>
										
									<div>${ m.message_content }</div>
								</td>
							</tr>
							   		
							   </c:forEach>
							</tbody>
						</table>
						  </c:when>
					</c:choose>
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </div>
   
    
	

	
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
	$('.message-detail-btn').on('click', function() {

		
		var detailTag = $(this).closest('tr').next();
		
		if(detailTag.hasClass('select-message-detail')) {
			detailTag.children('td').hide();
			detailTag.animate({height: '-=200'}, 'fast', function(){
				detailTag.removeClass('select-message-detail');
			})
			
		} else {
			$('.select-message-detail').css('height','0px');
			$('.select-message-detail').hide();
			$('.select-message-detail').removeClass('select-message-detail');
			
			detailTag.show();

			detailTag.children('td').show();
			detailTag.animate({height: '+=30'}, 'fast', function(){
				detailTag.addClass('select-message-detail');
			})
			
		}
		
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
 
$('.btn-report-suspend').on('click', function() {
	if(confirm('수락 하시겠습니까?') == true) {
		document.location.href="agreeMessage.do?userId=" + ${  };
	}
	
});
$('.btn-report-hold').on('click', function() {
	if(confirm('거절 하시겠습니까?') == true) {
		
	}
	
});
 </script>

</body>

</html>
