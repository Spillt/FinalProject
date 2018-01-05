<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연애의발견::자유게시판</title>
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

.container.top {
	margin-top:150px;
}
</style>
</head>


<body id="page-top">	
	<c:import url="../../include/header.jsp" />
	
	<header class="masthead">
	</header>
	
	<div class="container top">
			<div class ="row">
				<div class="col-md-8 text-left">				
					<strong style="font-size: 25pt; color: #faadad;">자유게시판</strong>				
				</div>
			</div>
	</div>
	
	<div class = "container">
	
		<table class="table table-bordered">
		<colgroup>
			<col width="10%" />
			<col width="40%" />
			<%-- <col width="15%" />
			<col width="35%" /> --%>
		</colgroup>
		
		<tbody>
			<tr> 
				<th scope="row">글 번호</th>
				<td>${Freeboard.freeNo }</td>
				<th scope="row">작성일</th>
				<td><fmt:formatDate value="${Freeboard.freeDt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>		
				<th scope="row">작성자</th>
				<td>
					<c:choose>
						<c:when test="${Freeboard.freeYN eq 'false' }">
							${Freeboard.freeWriter }
						</c:when>
						<c:when test="${Freeboard.freeYN eq 'true' }">
							익명
						</c:when>
					</c:choose>	
				</td>			
				<th scope="row">조회수</th>
				<td>${Freeboard.freeReadCnt }</td>	
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${Freeboard.freeTitle }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="4">${Freeboard.freeContent }</td>
			</tr>
		</tbody>
	</table>
	
	<a class = "btn float-right" href="openFreeboardList.do" id="list" style="color: #000000;">목록으로</a>
	
	<c:if test="${ sessionScope.user_nicknm eq  Freeboard.freeWriter}">
		<a href="updateViewFreeboard.do?freeNo=${Freeboard.freeNo }&freeYN=${Freeboard.freeYN}" class="btn float-right" id="update" style="color: #000000;">수정하기</a>
		<a href="deleteFreeboard.do?freeNo=${Freeboard.freeNo }" class="btn float-right" id="delete" style="color: #000000;">삭제하기</a>
	</c:if>
	
	</div>
	
	<section></section>	
	
	<hr>
	<c:import url="../../include/footer.jsp" />
	
	<script>
	$(function() {
        $('#mainNav').css('background-color', '#faadad');
     });
	</script>
</body>
</html>