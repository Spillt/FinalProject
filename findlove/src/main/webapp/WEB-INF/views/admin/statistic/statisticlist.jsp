<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
header.subhead {
	height: 76px
}

@media ( min-width :992px) {
	header.subhead {
		height: 123px
	}
}

canvas {
	width: auto;
}

.statistics-contents {
	font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif; 
}

.statistics-contents .card {
	margin-bottom: 20px;
}

.material-icons.refresh-btn {
	color: #faadad;
}

</style>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<div class="container" style="min-height: 800px;">
		<header class="subhead"> </header>

		<div class="tab">
			<div class="text-center"
				style="background-color: #faadad; opacity: 0.5; color: #fff; margin-bottom: 10px">관리자용
				통계관리 페이지입니다.</div>
			<hr>
		</div>

		<div class="statistics-contents row">
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<c:forEach items="${genderRatio}" var="result">
									<div class="col-6 text-center">
										<div class="text-muted">${result.key}</div>
										<div>
											<span id="genderCnt${result.key }" style="font-weight: 400;font-size:30px; color: #faadad">${result.resultCnt}</span><span class="text-muted">명</span>
											<c:if test="${result.key eq '남자'}">
												<span style="font-weight: bold;font-size:30px; padding-left:10px; color:#3498DB">${result.resultPct} %</span>
											</c:if>
											<c:if test="${result.key eq '여자'}">
												<span style="font-weight: bold;font-size:30px; padding-left:10px; color:#EA5B71">${result.resultPct} %</span>
											</c:if>
											
										</div>
									</div>

							</c:forEach>

						</div>
					</div>
					<div class="card-body">
						
						<div>
							<canvas id="genderRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-muted">남녀 성비<i class="material-icons refresh-btn float-right">refresh</i></div>
				</div>
			</div>
			
			<div class="col-md-7">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="ageRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-muted">나이 비율<i class="material-icons refresh-btn float-right">refresh</i></div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="attendanceRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-muted">월별가입자수<i class="material-icons refresh-btn float-right">refresh</i></div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="areaRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-muted">지역비율<i class="material-icons refresh-btn float-right">refresh</i></div>
				</div>
			</div>
			
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="preferenceRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-muted">선호도<i class="material-icons refresh-btn float-right">refresh</i></div>
				</div>
			</div>
			

			<!--  -->

			<%-- <div class="statistics-body row" style="margin:auto">
					<div style="width:100px;">
						<div class="text-center" style="background-color:#3498DB; height:50%;">
							<div><i class="fa fa-male" style="color:#fff; font-size: 70px;"></i></div>
							<div>man</div>
						</div>
						<div class="text-center" style="background-color:#EA5B71; height:50%;">
							<div><i class="fa fa-male" style="color:#fff; font-size: 70px;"></i></div>
							<div>woman</div>
						</div>
					</div>
					<div style="width:100px;">
						<div style="height:50%">159</div>
						<div style="height:50%">99</div>
					</div>
					<div>
						<canvas id="genderRatio"></canvas>
					</div>
				</div> --%>
		</div>
		<div></div>

	</div>
	<c:import url="../../include/footer.jsp" />


	<script src="/findlove/resources/js/Chart.min.js"></script>

	<script>
		var ctx = document.getElementById("genderRatio");
		var genderData = [Number($('#genderCnt남자').text()), Number($('#genderCnt여자').text())];
		var genderRatio = new Chart(ctx, {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : genderData,
					backgroundColor : [ '#3498DB', '#EA5B71' ]
				} ],
				labels: [ '남자',' 여자' ]
			}
			
		});
		
		var ctx2 = document.getElementById("ageRatio");
		var ageLabels = new Array();
		var ageData = new Array();
		<c:forEach items='${ageRatio}' var='result'>
			ageLabels.push('${result.key}');
			ageData.push('${result.resultCnt}');
		</c:forEach>
		var ageRatio = new Chart(ctx2, {
		    type: 'bar',
		    data: {
		        labels: ageLabels,
		        datasets: [{
		            label: '회원수',
		            data: ageData,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.7)',
		                'rgba(54, 162, 235, 0.7)',
		                'rgba(255, 206, 86, 0.7)',
		                'rgba(75, 192, 192, 0.7)',
		                'rgba(153, 102, 255, 0.7)'
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		    	legend: {
		            display: false
		        },
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
		
		var ctx3 = document.getElementById("attendanceRatio");

		var genderRatio = new Chart(ctx3, {
			type : 'line',
			data : {
				datasets : [ {
					data: [20, 10, 5, 9, 8, 4, 14, 0, 33, 24, 10, 12],
					borderColor: '#faadad'
				} ],
				labels: [ '1',' 2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ]
				
			},
			options: {
		        elements: {
		            line: {
		                tension: 0, // disables bezier curves
		            }
		        }
		    }
		});
		
		
		var ctx4 = document.getElementById("areaRatio");

		var areaRatio = new Chart(ctx4, {
			type : 'polarArea',
			data : {
				datasets : [ {
					data: [20, 17, 5, 4, 9, 4, 14, 2, 4, 16, 7, 8, 0],
					backgroundColor: [
					 	'rgba(255,99,132,0.7)',
		                'rgba(54, 162, 235, 0.7)',
		                'rgba(255, 206, 86, 0.7)',
		                'rgba(75, 192, 192, 0.7)',
		                'rgba(153, 102, 255, 0.7)',
		                'rgba(255, 159, 64, 0.7)',
		                'rgba(123, 159, 64, 0.7)',
		                'rgba(123, 242, 64, 0.7)',
		                'rgba(52, 24, 64, 0.7)',
		                'rgba(222, 123, 64, 0.7)',
		                'rgba(255, 251, 64, 0.7)',
		                'rgba(55, 211, 33, 0.7)',
		                'rgba(44, 123, 123, 0.7)',
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(123, 159, 64, 1)',
		                'rgba(123, 242, 64, 1)',
		                'rgba(52, 24, 64, 1)',
		                'rgba(222, 123, 64, 1)',
		                'rgba(255, 251, 64, 1)',
		                'rgba(55, 211, 33, 1)',
		                'rgba(44, 123, 123, 1)',
		                
		            ]
				} ],
				labels: [ '서울', '경기', '대전', '대구', '부산', '울산', '인천', '광주', '강원도', '경상도', '전라도', '충청도', '제주도']
				
			}
			
		});
		
		
		var ctx5 = document.getElementById("preferenceRatio");

		var preferenceRatio = new Chart(ctx5, {
			type : 'radar',
			data : {
				datasets : [ {
					data: [12, 44, 32, 13, 9],
					backgroundColor: 'rgba(52,152,219, 0.6)',
		            borderColor: '#3498DB'
				},
				{
					data: [15, 12, 22, 16, 27],
					backgroundColor: 'rgba(234,91,113, 0.6)',
		            borderColor: '#EA5B71'
				}],
				labels: [ '섹시', '도도한', '지적인', '낙천적인', '패셔너블', '유며있는']
				
			}
			
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>