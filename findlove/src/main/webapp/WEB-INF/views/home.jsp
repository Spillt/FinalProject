<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
	<link rel="stylesheet" type="text/css" href="/findlove/resources/css/bootstrap.min.css">
	<script type="text/javascript" src="/findlove/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/findlove/resources/js/bootstrap.bundle.js"></script>
</head>
<body>
	<h1>home.jsp</h1>
	<c:if test="${empty sessionScope.user }">
		<form action="login.do" method="post">
			<input type="text" name="userId">
			<input type="password" name="userPwd">
			<input type="submit" value="로그인">
		</form>
	</c:if>
	<c:if test="${!empty sessionScope.user }">
		<p>${user.userName } 님 환영합니다.</p>
	</c:if>
</body>
</html>
