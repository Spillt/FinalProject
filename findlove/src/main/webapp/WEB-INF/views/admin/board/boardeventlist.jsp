<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="row">
		
			<c:import url="./subnav.jsp" />
	        
	        <div class="col-md-9">
	        	
	        	
	        	<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>설문내용</th>
						<th>기간</th>
						<th>상태</th>
						<th>수정하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="poll">
						<tr>
							<td>${poll.poll_no }</td>
							<td>${poll.poll_title }</td>
							<c:if test="${poll.poll_st eq '0'}">
								<td class="text-warning">준비중</td>
							</c:if>
							<c:if test="${poll.poll_st eq '1'}">
								<td class="text-success">진행중</td>
							</c:if>
							<c:if test="${poll.poll_st eq '2'}">
								<td class="text-muted">마감</td>
							</c:if>
							<td>${poll.start_dt} ~ ${poll.end_dt }</td>
							<td id="board${poll.poll_no }"><div class="btn-group"><button class="btn btn-primary board-update-btn">수정</button><button class="btn btn-primary board-delete-btn">삭제</button></div></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
	        	
	        </div>
		
		</div>
	</div>
	<c:import url="../../include/footer.jsp" />
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		$('.card:first').addClass('selected');
		$('.list-group-item:last').addClass('selected');
	});
	
	$('.board-delete-btn').on('click', function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="boarddelete.do?boardType=poll&boardNo="+$(this).closest('td').attr('id').substr(5);
		}
	});
	$('.board-update-btn').on('click', function() {
		location.href="boardupdateview.do?boardType=poll&boardNo="+$(this).closest('td').attr('id').substr(5);
	});
</script>
</body>
</html>