<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
<table align="center" cellspacing="0" width="700">
<tr>
	<td>
	<table border="1" bordercolor="gray">
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	</table>
	</td>
</tr>

</table>
  <ul class="pagination pagination">
  <li><a href="${mlist }?page=${currentPage - 1}">◀</a></li>
    <c:forEach var="p" begin="${startPage}" end="${endPage}">
  <c:choose>
  <c:when test="${p eq currentPage}">
	<b><font size="4" color="red">${p}</font></b>
  </c:when>
  <c:otherwise>
  	<c:url var="blist" value="blist.do"/>
	<a href="${mlist}?page=${p}">${p}</a>
  </c:otherwise>
  </c:choose>
  </c:forEach>
  <li><a href="${mlist }?page=${currentPage - 1}">▶</a></li>
  </ul>
</div>
</body>
</html>