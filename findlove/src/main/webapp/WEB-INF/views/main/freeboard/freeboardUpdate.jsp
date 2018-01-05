<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeboardWrite</title>

	<!-- 위지윅  에디터 -->
		<!-- Make sure the path to CKEditor is correct. -->
        <script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
	<!-- 위지윅  에디터 끝 -->
	
<style type="text/css">
.container.top {
	margin-top: 150px;
}

.frm {
	width: 1500px;
	height: 1500px;
}
	
.btn {
	background-color: transparent;
}
</style>
</head>
<body>
	<!-- header -->
	<c:import url="../../include/header.jsp" />
	<div class="container top">
		<div class="row">
		<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">게시글 작성</strong>
				<br>
				<br>	
			</div>
		</div>
	</div>
	
	<!-- page contents -->

	<c:set var="User" value="${ User }"></c:set>

	<div class="container" style="margin-left:100px; margin-right:500px;">
		<div class="row">	
	
	<form id="frm" name="frm" enctype="multipart/form-data" action="updateFreeboard.do">
	<input type="hidden" name="freeNo" value="${Freeboard.freeNo}">
	<table class="freeboard_view" style="width:1100px;">
		<colgroup>
			<col width="10%">
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" id="Title" name="freeTitle" style="width:1000px; border-radius: 2px;"class="wdp_90" value="${Freeboard.freeTitle }"></input></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
					<td>
						<c:choose>
							<c:when test="${Freeboard.freeYN eq 'true' }">
								<input type="text" style="border-radius: 2px;"id="Writer" name="freeWriter" value="${Freeboard.freeWriter}" readonly></input>
								<input type="checkbox" id="YN" name="freeYN" value="true" checked><strong>익명</strong>
							</c:when>
							<c:when test="${Freeboard.freeYN eq 'false' }">
								<input type="text" style="border-radius: 2px;"id="Writer" name="freeWriter" value="${Freeboard.freeWriter}" readonly></input>
								<input type="checkbox" id="YN" name="freeYN" value="true"><strong>익명</strong>
							</c:when>
						</c:choose>
					</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" class="view_text">
				
					<form>
			            <textarea name="freeContent" id="Content" rows="10" cols="80">${Freeboard.freeContent}</textarea>
			            <script>
			                // Replace the <textarea id="Content"> with a CKEditor
			                // instance, using default configuration.
			                CKEDITOR.replace( 'Content' );
			            </script>
			        </form>
			        
					<!-- <textarea rows="20" cols="100" id="Content" name="freeContent"></textarea> -->
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="row" style="margin:auto">
		<div class="col-12 float-right">
			<button class="btn submit-btn float-right" type="button" style="margin-top:10px; color:black;" id="write">수정완료</button>
			<a href="openFreeboardList.do" style="margin-top:10px; color:black;" class="btn float-right" id="list">목록으로</a>
		</div>
	</div>
	</form>
	
	<br>
	<c:import url="../../include/footer.jsp" />
	</form>
	</div>
	</div>
	
	
	
	<script>
		$(function() {
	        $('#mainNav').css('background-color', '#faadad');
	     });
		
		/* 위지윅 에디터 */
	        // Replace the <textarea id="Content"> with a CKEditor
	        // instance, using default configuration.
	        CKEDITOR.replace( 'Content' );	 
		/* 위지윅 에디터 */
		
		//익명 체크 여부 변수에 저장
		var YN = document.getElementById('YN');
		
		//익명 체크여부 불러오기
		var freeYN = YN.getAttribute("checked");
				
	</script>
	<script>
		$(".submit-btn").on('click',function() {
			var form = document.frm;
			
			if(!form.Title.value){
				swal({
					title:"warning!",
					text:"제목을 입력하세요!",
					icon:"error",				
				});	
				return false;
			}
			
			if(CKEDITOR.instances["Content"].getData()==""){
				swal({
					title:"warning!",
					text:"내용을 입력하세요!",
					icon:"error",				
				});	
				return true;
			}
			
			form.submit();	
					
		 });  

	</script>
</body>
</html>