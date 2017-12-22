<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

th {
	color: #faadad
}

.table-cursor {
	cursor: pointer;
}

.material-icons.report-detail-icon {
	color: #faadad;
}

.hidden-tr {
	display: none;
}

tbody tr:nth-child(4n-3) {
	background-color: rgba(0, 0, 0, .075) !important;
}

tbody tr:hover {
	background-color: rgba(249, 205, 204, .5) !important;
}
.userdetail-btn:hover {
	color: #f77070;
}

</style>

</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		
		<div class="tab-content row">
			<table class="table text-center" id="reporttable">
				<thead>
					<tr>
						
						<th>신고 대상자</th>
						<th>신고 유형</th>
						<th>상태</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody id="report-table">
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="report">
							<tr class="basic-table-row">
								
								<td id="${report.receiver_id}  " class="table-cursor userdetail-btn" data-toggle="modal">${report.receiver_id}</td>
								<td>${report.report_type}</td>
								
								<c:choose>
									<c:when test="${report.report_st == '0'}">
										<td class="text-warning" style="font-weight:bold">처리대기중</td>
									</c:when>
									<c:when test="${report.report_st == '1'}">
										<td class="text-success" style="font-weight:bold">완료</td>
									</c:when>
									<c:when test="${report.report_st == '2'}">
										<td class="text-muted" style="font-weight:bold">보류</td>
									</c:when>
								</c:choose>
								
								<td><a class="report-detail-btn"><i class="material-icons report-detail-icon">details</i></a></td>
							</tr>
							<tr id="report${report.report_no}" style="border: 2px solid #faadad;" class="hidden-tr">
								<td>
									<div style="color:#faadad; font-weight:bold">신고자</div>
									<hr><br>
									<div id="${report.sender_id}" class="table-cursor userdetail-btn" data-toggle="modal">${report.sender_id}</div>
								</td>
								<c:if test="${report.report_st == '0'}">
								</c:if>
								<c:if test="${report.report_st == '2'}">
								</c:if>
								<td colspan="3" class="text-center">
									<div style="color:#faadad; font-weight:bold" class="row">
										<div class="col"></div>
										<div class="col-4">신고 상세 내용</div>
										<div class="col">
										<c:choose>
											<c:when test="${report.report_st == '0'}">
												<div class="btn-group float-right" style="margin-top: -3px">
													<button type="button" class="btn btn-sm btn-danger btn-report-suspend" >정지</button>
													<button type="button" class="btn btn-sm btn-secondary btn-report-hold">보류</button>
												</div>
											</c:when>
											<c:when test="${report.report_st == '1'}">
											</c:when>
											<c:when test="${report.report_st == '2'}">
												<div class="btn-group float-right" style="margin-top: -3px">
													<button type="button" class="btn btn-sm btn-danger btn-report-suspend" >정지</button>
												</div>
											</c:when>
										</c:choose>
											
										</div>
									</div>
									
									<c:if test="${report.report_st == '1'}">
										<hr><br>
									</c:if>
									<c:if test="${report.report_st != '1'}">
										<hr style="margin-top: 10px"><br>
									</c:if>	
									<div>${report.report_content}</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		
		
	</div>
	
	<c:import url="./usermodal.jsp" />


	<c:import url="../../include/footer.jsp" />
	
	
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			$('.card:last').addClass('selected');
			
		});
		$('.report-detail-btn').on('click', function() {

			
			var detailTag = $(this).closest('tr').next();
			
			if(detailTag.hasClass('select-report-detail')) {
				detailTag.children('td').hide();
				detailTag.animate({height: '-=200'}, 'fast', function(){
					detailTag.removeClass('select-report-detail');
				})
				
			} else {
				$('.select-report-detail').css('height','0px');
				$('.select-report-detail').hide();
				$('.select-report-detail').removeClass('select-report-detail');
				
				detailTag.show();

				detailTag.children('td').show();
				detailTag.animate({height: '+=30'}, 'fast', function(){
					detailTag.addClass('select-report-detail');
				})
				
			}
			
		});
		
		$('.btn-report-suspend').on('click', function() {
			if(confirm('해당 회원의 계정을 정지하시겠습니까?')) {
				document.location.href="completereport.do?reportNo="+ $(this).closest('tr').attr('id').replace('report','');
			};
			
		});
		
		$('.btn-report-hold').on('click', function() {
			if(confirm('해당 신고를 보류하시겠습니까?')) {
				document.location.href="holdreport.do?reportNo="+ $(this).closest('tr').attr('id').replace('report','');
			};
		});
		
		function searchFunction() {
			$("#search").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				$("table tr.basic-table-row").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		}
	</script>
</body>
</html>