<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeboardWrite</title>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
	<table class="freeboard_view">
		<colgroup>
			<col width="15%">
			<col width="*"/>
		</colgroup>
		<caption>게시글 작성</caption>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="WRITER" name="WRITER"></input></td>
			</tr>
			<tr>
				<td colspan="2" class="view_text">
					<textarea rows="20" cols="100" title="내용" id="CONTENT" name="CONTENT"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<a href="insertFreeboard.do" class="btn" id="write">작성하기</a>
	<a href="openFreeboardList.do" class="btn" id="list">목록으로</a>
	</form>
	
	<!-- 작성하기, 목록으로 버튼 기능 -->
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){//목록으로 버튼
				e.preventDefault();
				fn_openFreeboardList();
			});
		});
		
		$("#write").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			fn_insertFreeboard();
		
		});
		
		function fn_openFreeboardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='openFreeboardList.do'/>");
			comSubmit.submit();
		}
		
		function fn_insertFreeboard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='insertFreeboard.do'/>");
			comSubmit.submit();
		}
	</script> -->
	<!-- 작성하기, 목록으로 버튼 기능 끝 -->
	
</body>
</html>