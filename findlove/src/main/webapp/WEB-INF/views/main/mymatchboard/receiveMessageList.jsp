<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.table-cursor {
	cursor: pointer;
}

tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
}

.modal-body .form-group .form-control {
	width: 100%;
}
</style>

<script src=" https://use.fontawesome.com/56a81332b8.js ">
	
</script>
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

	<div class="container"style="min-height: 600px">

		<div class="row">
			<div class="col-lg-3">
				<br>
				<div class="list-group">
					<a href="openSendMessageList.do?user_id=${ sessionScope.user_id }"
						class="list-group-item">내가 호감을 보낸 이성</a> <a href="#"
						class="list-group-item active">나에게 호감을 보낸 이성</a> <a
						href="openSendGradeList.do?user_id=${sessionScope.user_id}"
						class="list-group-item">내가 높은 평점을 준 이성</a> <a
						href="openReceiveGradeList.do?user_id=${sessionScope.user_id}"
						class="list-group-item">나에게 높은 평점을 준 이성</a>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">나에게 호감을 보낸 이성 [받은 메세지함]</div>
					<div class="card-body">




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
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ map.list }" var="m">
											<c:choose>
												<c:when test="${ m.accept_ST eq '0' }">
													<!-- 대기상태 -->
													<tr class="table-cursor" data-toggle="modal"
														data-target="#exampleModal1"
														data-whatever="${ m.user_nicknm }"
														data-date="${ m.send_DT }"
														data-content="${m.message_content }"
														data-accept="${m.accept_ST }"
														onclick="readMessage('${m.sender_id}', '${ m.receiver_id}', '${m.message_no }');">

														<td style="padding: 0"><img
															src="/findlove/uploadfiles/profile/${ m.picture_nm }"
															style="width: 50px; height: 50px;" alt=""></td>
														<td>${ m.user_nicknm }</td>
														<c:choose>
															<c:when test="${ fn:length(m.message_content) > 14 }">
																<td><c:out
																		value="${fn:substring(m.message_content,0,13)}" />....</td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${ m.message_content }" /></td>
															</c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${ m.send_DT }"
																pattern="yyyy년 MM월 dd일" /></td>
														<c:choose>
															<c:when test="${ m.read_FL eq '0' }">
																<td id="readFlag${m.message_no }">안읽음</td>
															</c:when>
															<c:otherwise>
																<td>읽음</td>
															</c:otherwise>
														</c:choose>
														<td id="userState${m.message_no }">대기상태</td>



													</tr>
												</c:when>
												<c:when test="${ m.accept_ST eq '1' }">
													<!-- 수락상태 -->
													<tr class="table-cursor" data-toggle="modal" data-target="#exampleModal2"
														data-whatever="${ m.user_nicknm }"
														data-date="${ m.send_DT }"
														data-content="${m.message_content }"
														data-accept="${m.accept_ST }"
														onclick="readMessage('${m.sender_id}', '${ m.receiver_id}', '${m.message_no }');">

														<td style="padding: 0"><img
															src="/findlove/uploadfiles/profile/${ m.picture_nm }"
															style="width: 50px; height: 50px;" alt=""></td>
														<td>${ m.user_nicknm }</td>
														<c:choose>
															<c:when test="${ fn:length(m.message_content) > 14 }">
																<td><c:out
																		value="${fn:substring(m.message_content,0,13)}" />....</td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${ m.message_content }" /></td>
															</c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${ m.send_DT }"
																pattern="yyyy년 MM월 dd일" /></td>
														<c:choose>
															<c:when test="${ m.read_FL eq '0' }">
																<td id="readFlag${m.message_no }">안읽음</td>
															</c:when>
															<c:otherwise>
																<td>읽음</td>
															</c:otherwise>
														</c:choose>
														<td id="userState${m.message_no }">수락상태</td>


													</tr>
												</c:when>
												<c:otherwise>
													<!-- 거절 상태 -->
													<tr class="table-cursor" data-toggle="modal" data-target="#exampleModal3"
														data-whatever="${ m.user_nicknm }"
														data-date="${ m.send_DT }"
														data-content="${m.message_content }"
														data-accept="${m.accept_ST }"
														onclick="readMessage('${m.sender_id}', '${ m.receiver_id}', '${m.message_no }');">

														<td style="padding: 0"><img
															src="/findlove/uploadfiles/profile/${ m.picture_nm }"
															style="width: 50px; height: 50px;" alt=""></td>
														<td>${ m.user_nicknm }</td>
														<c:choose>
															<c:when test="${ fn:length(m.message_content) > 14 }">
																<td><c:out
																		value="${fn:substring(m.message_content,0,13)}" />....</td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${ m.message_content }" /></td>
															</c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${ m.send_DT }"
																pattern="yyyy년 MM월 dd일" /></td>
														<c:choose>
															<c:when test="${ m.read_FL eq '0' }">
																<td id="readFlag${m.message_no }">안읽음</td>
															</c:when>
															<c:otherwise>
																<td>읽음</td>
															</c:otherwise>
														</c:choose>

														<td id="userState${m.message_no }">거절상태</td>

													</tr>
												</c:otherwise>
											</c:choose>

										</c:forEach>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<h2 align="center" style="color: #faadad;">나에게 호감을 보낸 이성이
									없습니다</h2>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>






	<hr>
	<c:import url="../../include/footer.jsp" />

	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
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

					<div class="form-group">
						<div style="width: 20%;" class="text-left float-left">
							<strong>보낸 사람</strong>
						</div>
						<div class="text-left" id="recipient">보낸 사람</div>
						<hr>
						<div style="width: 20%;" class="text-left float-left">
							<strong>보낸 날짜</strong>
						</div>
						<div class="text-left" id="date">보낸 날짜</div>
					</div>

					<hr>



					<div class="form-group">
						<div style="padding-left: 18px; width: 20%;"
							class="text-left float-left">
							<strong>내용</strong>
						</div>
						<div class="text-left" id="content">메세지내용</div>

					</div>

				</div>
				<div class="modal-footer">


					<button type="button" class="btn btn-danger btn-report-suspend"
						onclick="acceptMessage('${sessionScope.user_id}')">수락</button>
					<button type="button" class="btn btn-secondary btn-report-hold"
						onclick="refuseMessage('${sessionScope.user_id}')">거절</button>
				</div>
			</div>
		</div>
	</div>

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

					<div class="form-group">
						<div style="width: 20%;" class="text-left float-left">
							<strong>보낸 사람</strong>
						</div>
						<div class="text-left" id="recipient">보낸 사람</div>
						<input type="hidden" id="recipient1">
						<hr>
						<div style="width: 20%;" class="text-left float-left">
							<strong>보낸 날짜</strong>
						</div>
						<div class="text-left" id="date">보낸 날짜</div>
					</div>

					<hr>



					<div class="form-group">
						<div style="padding-left: 18px; width: 20%;"
							class="text-left float-left">
							<strong>내용</strong>
						</div>
						<div class="text-left" id="content">메세지내용</div>

					</div>

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-danger btn-report-suspend"
						onclick="chatting()">채팅 참여하기</button>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog"
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

					<div class="form-group">
						<div class="text-left">보낸 사람</div>
						<div class="text-left" id="recipient"></div>
					</div>


					<div class="form-group">
						<div class="text-left">보낸 날짜</div>
						<div class="text-left" id="date"></div>
					</div>

					<div class="form-group">
						<div class="text-left">메세지 내용</div>
						<div class="text-left" id="content"></div>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#exampleModal1').on('show.bs.modal', function(event) {

			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			var date = button.data('date')
			var content = button.data('content')
			var accept = button.data('accept')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			/* var date = */
			var modal = $(this)
			modal.find('.modal-title').text('Message')
			modal.find('#recipient').text(recipient)
			modal.find('#date').text(date)
			modal.find('#content').text(content)

		})
	</script>
	<script type="text/javascript">
		$('#exampleModal2').on('show.bs.modal', function(event) {

			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			var date = button.data('date')
			var content = button.data('content')
			var accept = button.data('accept')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			/* var date = */
			var modal = $(this)
			modal.find('.modal-title').text('Message')
			modal.find('#recipient').text(recipient)
			modal.find('#recipient1').val(recipient)
			modal.find('#date').text(date)
			modal.find('#content').text(content)

		})
	</script>
	<script type="text/javascript">
		$('#exampleModal3').on('show.bs.modal', function(event) {

			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			var date = button.data('date')
			var content = button.data('content')
			var accept = button.data('accept')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			/* var date = */
			var modal = $(this)
			modal.find('.modal-title').text('Message')
			modal.find('#recipient').text(recipient)
			modal.find('#date').text(date)
			modal.find('#content').text(content)

		})
	</script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
	<script type="text/javascript">
		function readMessage(sender_id, receiver_id, message_no) {
			$.ajax({
				url : 'readMessage.do',
				type : 'get',
				data : {
					"sender_id" : sender_id,
					"receiver_id" : receiver_id
				},
				success : function(data) {
					$('#readFlag'+message_no).text("읽음");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function acceptMessage(receiver_id) {
			var sender_nm = $('#recipient').text();
			var receiver_id = receiver_id;
			var modal = $('#exampleModal1');

			$.ajax({
				url : 'acceptMessage.do',
				type : 'get',
				data : {
					"sender_nm" : sender_nm,
					"receiver_id" : receiver_id
				},
				success : function(data) {
					alert('수락되었습니다.');
					modal.modal('hide');
					location.reload();
				}
			})

		}

		function refuseMessage(receiver_id) {
			var sender_nm = $('#recipient').text();
			var receiver_id = receiver_id;
			var modal = $('#exampleModal1');

			$.ajax({
				url : 'refuseMessage.do',
				type : 'get',
				data : {
					"sender_nm" : sender_nm,
					"receiver_id" : receiver_id
				},
				success : function(data) {
					alert('거절되었습니다.');
					modal.modal('hide');
					location.reload();
				}
			})
		}
	</script>
	<script type="text/javascript">
		function chatting() {
			var matchingNickNM = $('#recipient1').val();
			var myId = '${user_id}';
			$
					.ajax({
						url : 'checkChatStatus.do',
						type : 'post',
						data : {
							"sender_id" : myId,
							"receiver_id" : matchingNickNM
						},
						success : function(data) {
							if (data == 0) {
								var matchingNickNM = $('#recipient1').val();
								document.location.href = "chatting1.do?userId=${user_id}&matchingNickNM="
										+ matchingNickNM;
							} else {
								alert("상대방이 대화 준비중이거나 대화중입니다.");
							}
						}
					})
		}
	</script>

</body>

</html>
