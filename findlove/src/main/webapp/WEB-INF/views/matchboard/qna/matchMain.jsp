<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile, java.util.ArrayList, java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
 .matchQnA:link { color: red; text-decoration: none;}
 .matchQnA:visited { color: black; text-decoration: none;}
 .matchQnA:hover { color: black; text-decoration: none;}
 .matchQnA { color: black; text-decoration: none;}
</style>
</head>
<body>
<c:import url="../../include/header.jsp"/>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="col-lg-3">
          <br>
          <div class="list-group">
            <a href="selectuserlist.do?userId=${user_id }" class="list-group-item active">매칭게시판</a>
            <c:if test="${!empty myQnA}">
            <a href="myMatchqna.do?userId=${user_id }" class="list-group-item">내 QnA수정하기</a>
            </c:if>
            <c:if test="${empty myQnA}">
            <a href="listMatchqna.do" class="list-group-item">내 QnA작성하기</a>
            </c:if>
            <a href="#" class="list-group-item">내 QnA삭제하기</a>
          </div>
        </div>

<div class="container" style = "width : 500pt; height : 100pt;">  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
   

    <!-- Wrapper for slides -->
    
    <div class="carousel-inner">
  		<c:forEach var="m" items="${requestScope.list}" varStatus="status">
    
      	<c:if test="${status.first}">
     		<div class="item active">
     	</c:if>
      	<c:if test="${not status.first}">
      		<div class="item">
      	</c:if>
        <div class="container">
        	<c:if test="${today_matching eq 0 }"> 
        		<a href="selectmatchqna.do?matchingUserId=${m.user_id }" class = "matchQnA" style="color: black;">
        	</c:if>
        	<c:if test="${today_matching eq 1 }">
        		<a href="#" class = "matchQnA" onclick="selectMacthQnA();"style="color: black;">
        	</c:if>         
  				<table class="table"style=" width : 200pt; position:relative; left:170px;">
    				<thead>
      					<tr>
	        				<th colspan="3"style="height : 200pt">${m.picture_nm }
	        					<div>[${m.user_nm}][${m.rank_gb }]</div> 
	        					<div style = "font-size: 5pt; color : gray">${m.age },${m.blood_type },${m.area }<div>
	        				</th>
	        			</tr>
	   		 		</thead>
	    
	    			<tbody>
	      				<tr>
	        				<td>${m.height },${m.weight },${m.style }</td>
	      				</tr>
	      				<tr>
	 	       				<td  >${m.religion }</td>
	      				</tr>
	      				<tr>
	        				<td>평점 : ★★★★★</td>
	      				</tr>
	    			</tbody>
	  			</table>
  			</a>
		</div>
	</div>

</c:forEach>
</div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
	});
</script>
<script type="text/javascript">
 function selectMacthQnA(){
	 alert("매칭은 하루에 한번 가능합니다.\n계속 하고 싶으신 경우 결제하여주십시오. ");//결제창이동 예정
 }

</script>
</body>
</html>