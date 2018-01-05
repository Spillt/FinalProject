<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의글 관리</title>

<style>
	tbody tr:hover {
		background-color: rgba(249, 205, 204, .5) !important;
	}
	
	tbody tr {
		cursor: pointer;
	}
	
	.form-control.input-w-100 {
		width:100%;
	}
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="row">
			<div class="col-sm-6">
				<table class="table table-fixed table-striped text-center">
					<thead>
						<tr><th colspan="3" style="color: #faadad">답변 대기중인 문의글</th></tr>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>문의자ID</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list eq null}">
							<tr><td colspan="3">답변 대기글이 없습니다.</td></tr>
						</c:if>
						<c:if test="${list ne null}">
							<c:forEach var="inq" items="${list }">
								<tr id="waitinq-${inq.inqNo }" class="inq-wait-list">
									<td>${inq.inqNo }</td>
									<td>${inq.inqTitle }</td>
									<td>${inq.inqWriter }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<form action="resendInq.do">
					<input type="hidden" name="inqWriter" value="${sessionScope.user_id}"/>
					<input type="hidden" id="inqTitle" name="inqTitle">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label>질문글번호</label>
								<input type="text" id="inqReplyFL" name="inqReplyFL" class="form-control form-inq" readonly/>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>질문자 아이디</label>
								<input id="inqReciver" name="inqReciver" class="form-control form-inq" readonly/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>문의내용</label>
								<textarea id="inqQuestion" class="form-control input-w-100" rows=6 readonly></textarea>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<textarea name="inqContent" class="form-control input-w-100" rows=6 placeholder="답변하기"></textarea>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input type="submit" value="전송하기" class="form-control float-right">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<c:import url="../../include/footer.jsp" />
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		$('.card:eq(1)').addClass('selected');
		
		$('.inq-wait-list').on('click', function() {
			$.ajax({
				url: "inqmgmtdetail.do",
				type: "get",
				headers: {
					"Content-Type" : "application/json"
				},
				data: {"inqNo" : $(this).attr('id').substr(8)},
				success: function(responseData) {
					var inq = responseData.inq;
					$('#inqReplyFL').val(inq.inqNo);
					$('#inqTitle').val("RE: "+ inq.inqTitle);
					$('#inqReciver').val(inq.inqWriter);
					$('#inqQuestion').val(inq.inqContent);
					
				}
			});
		});
	});
</script>
</body>
</html>