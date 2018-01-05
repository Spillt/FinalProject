<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqDetail</title>
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
					<strong style="font-size: 25pt; color: #faadad;">FAQ</strong>				
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
				<td>${faq.faqNo }</td>
				<th scope="row">작성일</th>
				<td><fmt:formatDate value="${faq.faqDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>	
				<th scope="row">카테고리</th>
				<td>${faq.faqGB }</td>	
				<th scope="row">작성자</th>
				<td>${faq.faqWriter }</td>			
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${faq.faqTitle }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="4">${faq.faqContent }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="openFaqList.do?faqGB=${faq.faqGB }" class="btn" id="list">목록으로</a>
	
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>	
	<c:import url="../../include/footer.jsp" />
	
	<script>
	$(function() {
        $('#mainNav').css('background-color', '#faadad');
     });
	</script>
</body>
</html>