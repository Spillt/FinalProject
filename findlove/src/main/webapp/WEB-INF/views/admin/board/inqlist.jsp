<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의글 관리</title>

<style>
	tbody tr:hover {
		background-color: rgba(249, 205, 204, .5) !important;
	}
	
	.form-control.input-w-100 {
		width:100%;
	}
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="row">
			<div class="col-sm-6">
				<table class="table table-striped text-center">
					<thead>
						<tr><th colspan="3" style="color: #faadad">답변 대기중인 문의글</th></tr>
						<tr>
							<th>번호</th>
							<th>문의자ID</th>
							<th>보낸시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>chanwo1993</td>
							<td>2017-01-02 09:23</td>
							
						</tr>
							<td>2</td>
							<td>Awd332</td>
							<td>2017-02-02 19:23</td>
						<tr>	
							<td>3</td>
							<td>skak123</td>
							<td>2017-03-22 10:23</td>
						</tr>	
						<tr>	
							<td>4</td>
							<td>chanwo1993</td>
							<td>2017-01-02 08:23</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<form>
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label>문의내용</label>
								<textarea class="form-control input-w-100" rows=6 readonly>문ㅈㄷㄻㅈㄷㄹㅈㅁㄷㄹㅈㄷ의내용ㅈㄷㄹㅈㅁㄹㅈㅁㄷㄹ 어쩌구ㅁㄷㄻㅈㄷㄹㅈㄷㄹ 저쩌국ㄷ지ㅏㄹ마ㅣㄷㄹ달ㄻㅈㄻㅈㄷㄹㄷㅈㄹㅈㄷㄻㅈㄷㄹㅈㄷ라닺러;마렂다렂ㄹㅈㅁㄷ라ㅣㅈㄷㄹ;ㅓㅣㅏㅈㄷ</textarea>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<textarea class="form-control input-w-100" rows=6 placeholder="답변하기"></textarea>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input type="submit" value="전송하기" class="form-control float-right">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="../../include/footer.jsp" />
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		$('.card:eq(1)').addClass('selected');
	});
</script>
</body>
</html>