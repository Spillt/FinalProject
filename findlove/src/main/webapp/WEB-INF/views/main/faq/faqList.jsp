<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="faqGBheader.jsp"/>
	<div class="container" style="min-height:500px;">
		<div class="row">
		
	        
	        <div class="col-md-12">
	        	<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>카테고리</th>
						<th>자주묻는질문</th>
						<th>작성자</th>
						<th>작성일</th>
						<!-- <th>수정/삭제</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="faq" varStatus="status">
						<tr style="font-size: 10pt;" align="center">
							<td>${status.count }</td>
							<td>${faq.faqGB }</td>
							<td><a href="faqDetail.do?faqNo=${faq.faqNo }">${faq.faqTitle }</a></td>
							<td>${faq.faqWriter }</td>
							<%-- <td>${faq.faqDate }</td> --%>
							<td><fmt:formatDate value="${faq.faqDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<%-- <td id="board${faq.faqContent }">
								<div class="btn-group">
									<button class="btn btn-primary board-update-btn">수정</button>
									<button class="btn btn-primary board-delete-btn">삭제</button>
								</div>
							</td> --%>
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
	 });
	
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		if("${gbNum}" == 0) {
			$('.card:first').addClass('selected');
		} else if("${gbNum}" == 1) {
			$('.card:eq(1)').addClass('selected');
		} else if("${gbNum}" == 2) {
			$('.card:eq(2)').addClass('selected');
		} else if("${gbNum}" == 3) {
			$('.card:eq(3)').addClass('selected');
		} else if("${gbNum}" == 4) {
			$('.card:eq(4)').addClass('selected');
		} else if("${gbNum}" == 5) {
			$('.card:eq(5)').addClass('selected');
		}
	});

</script>
</body>
</html>