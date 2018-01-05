<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
<style>
	.page-content ul li.page-item a.page-link {
		color: #faadad;
	}
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
							<td><a href="detailnotice.do?noticeNo=${notice.notice_no }">${notice.notice_title }</a></td>
							<td>${notice.notice_dt }</td>
							<td>${notice.notice_read_cnt }</td>
							<td id="board${notice.notice_no }"><div class="btn-group"><button class="btn btn-primary board-update-btn">수정</button><button class="btn btn-primary board-delete-btn">삭제</button></div></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
	        	<div class="page-content row justify-content-center">
					<ul class="pagination">
						<c:if test="${pageNo eq 1}">
							<li class="page-item"><a class="page-link" style="background-color: #e9ecef; color: lightgray">이전</a></li>
						</c:if>
						<c:if test="${pageNo ne 1}">
							<li class="page-item"><a class="page-link" href="boardnoticelist.do?pageNo=${pageNo-1}">이전</a></li>
						</c:if>
						<c:forEach begin="1" end="${pageCnt}" var="idx">
							<c:if test="${pageNo eq idx }">
								<li class="page-item"><a class="page-link" style="background-color:#faadad; color: #f77070; font-weight:bold" href="boardnoticelist.do?pageNo=${idx}">${idx}</a></li>
							</c:if>
							<c:if test="${pageNo ne idx }">
								<li class="page-item"><a class="page-link" href="boardnoticelist.do?pageNo=${idx}">${idx}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageNo eq pageCnt}">
							<li class="page-item"><a class="page-link" style="background-color: #e9ecef; color: lightgray">다음</a></li>
						</c:if>
						<c:if test="${pageNo ne pageCnt}">
							<li class="page-item"><a class="page-link" href="boardnoticelist.do?pageNo=${pageNo+1}">다음</a></li>
						</c:if>
						
					</ul>
				</div>
	        </div>
		
		</div>
	</div>
	<hr>
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