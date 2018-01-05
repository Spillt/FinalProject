<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>연애의발견::자유게시판</title>

<!-- CSS 및 스타일 -->
<style type="text/css">
#tableData{
	align: center;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {
	color: black;
	text-decoration: none;
}
.number {
	width: 10%;
}
.title {
	width: 50%;
}
.writer {
	width: 10%;
}
.date {
	widthd: 15%;
}
.count {
	width: 15%;
}
  .my-hr1 {
    border: 0;
    height: 3px;
    background: #ccc;
  }
.container.top {
	margin-top: 150px;
}
.search-bar {
	height: 40px;
	margin-top:10px;
}

ul li.page-item a.page-link {
	color: #faadad;
}

.btn.btn-default {
	background-color: #faadad;
}

.material-icons {
	color: #faadad
}

</style>
</head>

<body id="page-top">
	<!-- header -->
	<c:import url="../../include/header.jsp" />
	
	
		<!-- title -->
		<div class="container top">
			<div class ="row">
				<div class="col-md-8 text-left">				
					<strong style="font-size: 25pt; color: #faadad;">자유게시판</strong>				
				</div>
				<div class="input-group search-bar col-md-4">
			      <input id="search" type="text" class="form-control" placeholder="리스트 내 검색">
			        <span class="input-group-btn">
			           <button class="btn btn-default" type="button"><i class="material-icons">search</i></button>
			        </span>
			    </div>
			</div>
		</div>
		
		<!-- 검색 기능 -->
		<div class="container">
			<div class="row" style="margint:auto;">
				<div class="col-md-6"></div>
			    
			</div>
		</div>
	    <!-- 검색 기능 끝 -->
	 
		
		<!-- Page Content -->	
		<div class="container">
		<table id="tableData" class="table table-bordered table-striped " style="height:100%;">
			<thead style="font-size: 15px">
				<tr align="center">
					<th class="number">글 번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="count">조회수</th>
					<th class="date">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="row" items="${list}">
							<tr style="font-size: 10pt;" align="center">
								<td>${row.freeNo }</td>
								<td><a href="detailFreeboard.do?freeNo=${row.freeNo }" id="Title" name="freeTitle">${row.freeTitle }</a></td>
								<!-- 작성자 -->
								<c:choose>
									<c:when test="${row.freeYN eq false }">
										<td>${row.freeWriter }</td>
									</c:when>
									<c:when test="${row.freeYN eq true }">
										<td>익명</td>
									</c:when>
								</c:choose>	
								
								<td>${row.freeReadCnt }</td>
								<td><fmt:formatDate value="${row.freeDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
		<!-- <div class="row" style="margin:auto">
			<div class="col-12 float-right">
				<a href="openFreeboardWrite.do" class="btn btn-primary float-right" id="write" style="color:#fff; margin-top:-32px;">작성</a>
			</div>
			
		</div> -->
		<div class="row" style="margin:auto">
			<div class="col-12 float-right">
				<a href="openFreeboardWrite.do" class="btn float-right" style="margin-top:-32px;">글쓰기</a>
				<c:if test="${pg eq 0 }">
				<a href="openMyFreeboardList.do?freeWriter=${sessionScope.user_nicknm }" class="btn float-right" style="margin-top:-32px;">내 글보기</a>
				</c:if>
				<c:if test="${pg eq 1 }">
				<a href="openFreeboardList.do" class="btn float-right" style="margin-top:-32px;">전체보기</a>
				</c:if>
			</div>
		</div>
	</div>
	<section></section>
	
	
	
	
	
	<!-- footer -->
	<hr>
	<c:import url="../../include/footer.jsp" />
	
	<!-- 자바스크립트 -->

	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/findlove/resources/js/paging.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
		$(document).ready(function() {
			$('#tableData').paging({
				limit : 8
			});
		});
		
	/* 검색 기능 */
	   $("#search").on("keyup", function() {
	      var value = $(this).val();
	      $("table tr:gt(0)").filter(function() {
	         $(this).toggle($(this).text().indexOf(value) > -1)
	      });
	   });
	/* 검색 기능 끝 */
	</script>
</body>
</html>