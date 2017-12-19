<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeboardList</title>
<style type="text/css">

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
	margin-top: 80px;
}
</style>
</head>
<body>
	<h2>자유게시판 목록</h2>
	<c:import url="../include/header.jsp" />


	<header class="masthead">
	</header>

	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글 번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.freeNo }</td>
							<td>${row.freeTitle }</td>
							<td>${row.freeReadCnt }</td>
							<td>${row.freeDt }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
	<a href="openFreeboardWrite.do" class="btn" id="write">글쓰기</a>
	
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openFreeboardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목
				e.preventDefault();
				fn_openFreeboardDetail($(this));
			});
		});
		
		function fn_openFreeboardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='openFreeboardWrite.do' />");
			comSubmit.submit();
		}
		
		/* function fn_openFreeboardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='openFreeboardWrite.do'/>");
			comSubmit.submit();
		} */
	</script> -->
	<c:import url="../include/footer.jsp" />
	
	<script>
	$(function() {
        $('#mainNav').css('background-color', '#faadad');
     });
	</script>
</body>
</html>