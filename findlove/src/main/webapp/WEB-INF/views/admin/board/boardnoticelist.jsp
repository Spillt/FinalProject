<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>

<style>
	
</style>
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
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.notice_no }</td>
							<td>${notice.notice_title }</td>
							<td>${notice.notice_dt }</td>
							<td>${notice.notice_read_cnt }</td>
							<td id="board${notice.notice_no }"><div class="btn-group"><button class="btn btn-primary board-update-btn">수정</button><button class="btn btn-primary board-delete-btn">삭제</button></div></td>
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
		$('.list-group-item:eq(1)').addClass('selected');
	});
	
	$('.board-delete-btn').on('click', function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="boarddelete.do?boardType=notice&boardNo="+$(this).closest('td').attr('id').substr(5);
		}
	});
	
	$('.board-update-btn').on('click', function() {
		location.href="boardupdateview.do?boardType=notice&boardNo="+$(this).closest('td').attr('id').substr(5);
	});
</script>
</body>
</html>