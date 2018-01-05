<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqWrite</title>

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
				<strong style="font-size: 25pt; color: #faadad;">일대일 문의하기</strong>
				<br>
				<br>	
			</div>
		</div>
	</div>
	
	<!-- page contents -->

	<c:set var="User" value="${ User }"></c:set>

	<div class="container" style="margin-left:100px; margin-right:500px;">
		<div class="row">	
	
	<form id="frm" name="frm" enctype="multipart/form-data" action="insertInq.do">
	<table class="freeboard_view" style="width:1100px;">
		<colgroup>
			<col width="10%">
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" id="Title" name="inqTitle" style="width:1000px; border-radius: 2px;"class="wdp_90"></input></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>
					<input type="text" style="border-radius: 2px;"id="Writer" name="inqWriter"  value="${user_id }" readonly></input>
				</td>
			</tr>
			<tr>
				<c:if test="${user_id != 'admin' }">
					<th>수신자</th>
					<td><input type="text" id="Reciver" name="inqReciver" value="admin" readonly></input></td>
				</c:if>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" class="view_text">
				
					<form>
			            <textarea name="inqContent" id="Content" rows="10" cols="80"></textarea>
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
			<button class="btn submit-btn float-right" type="button" style="margin-top:10px; color:black;" id="write">문의보내기</button>
			<a href="InqList.do?userId=${user_id }" style="margin-top:10px; color:black;" class="btn float-right" id="list">목록으로</a>
		</div>
	</div>
	
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