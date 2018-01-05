<%@ page language="java" contentType="text/html; charset=UTF-8"
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

.statistics-contents .card,
.statistics-contents .card-header,
.statistics-contents .card-body,
.statistics-contents .card-footer {
	border-radius: 1px;
	border-color: #fff;
	background-color: #FFC1C1;
	opacity: 0.9;
}


</style>
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
			<div class="col-md-8 text-white">
				<div class="card">
					<div class="card-body">
						<div class="row text-center">
							<div class="col-4">
								<div>TOTAL</div>
								<div style="font-size: 40px; font-weight: bold">${totalCnt}</div>
							</div>
							<div class="col-4">
								<div>TODAY</div>
								<div style="font-size: 40px; font-weight: bold">${todayCnt}</div>
							</div>
							<div class="col-4">
								<div>PERCENT</div>
								<div style="font-size: 40px; font-weight: bold">${todayCntPct} %</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-white text-center">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<div>오늘출석</div>
								<div style="font-size: 40px; font-weight: bold">${todayAttendance}</div>
							</div>
							<div class="col-6">
								<div>어제 출석</div>
								<div style="font-size: 40px; font-weight: bold">${yesterdayAttendance}</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<c:forEach items="${genderRatio}" var="result">
									<div class="col-6 text-center">
										<div class="text-white">${result.key}</div>
										<div>
											<span id="genderCnt${result.key }" style="font-weight: 400;font-size:30px; color: #faadad">${result.resultCnt}</span><span class="text-white">명</span>
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
					<div class="card-footer text-white">남녀 성비<!-- <i class="material-icons refresh-btn float-right">refresh</i> --></div>
				</div>
			</div>
			
			<div class="col-md-7">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="ageRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-white">나이 비율</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="membershipRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-white">월별회원수</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="areaRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-white">지역비율</div>
				</div>
			</div>
			
			<%-- <div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<div>
							<canvas id="preferenceRatio"></canvas>
						</div>
					</div>
					<div class="card-footer text-white">선호도<i class="material-icons refresh-btn float-right">refresh</i></div>
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
					backgroundColor : [ 'rgba(52, 152, 219, 0.5)', 'rgba(234, 91, 113, 0.5)' ],
					borderColor:  [ 'rgb(52, 152, 219)', 'rgb(234, 91, 113)' ]
				} ],
				labels: [ '남자',' 여자' ]
			}
			
		});
		
		var ctx2 = document.getElementById("ageRatio");
		var ageLabels = new Array();
		var ageData = new Array();
		var ageManData = new Array();
		var ageWomanData = new Array();
		<c:forEach items='${ageRatio}' var='result'>
			ageLabels.push('${result.key}');
			ageData.push('${result.resultCnt}');
			ageManData.push(0);
			ageWomanData.push(0);
		</c:forEach>
		<c:forEach items='${ageManRatio}' var='result'>
			ageManData[ageLabels.indexOf('${result.key}')] = '${result.resultCnt}';
		</c:forEach>
		
		<c:forEach items='${ageWomanRatio}' var='result' varStatus='status'>
			ageWomanData[ageLabels.indexOf('${result.key}')] = '${result.resultCnt}';
		</c:forEach>
		var ageRatio = new Chart(ctx2, {
		    type: 'bar',
		    data: {
		        labels: ageLabels,
		        datasets: [{
		            label: '전체',
		        	data: ageData,
		            backgroundColor: 'rgba(123, 242, 64, 0.7)',
		            borderColor: 'rgba(123, 242, 64, 1)',
		            borderWidth: 1
		        },
		        
		        {
		        	label: '남자',
		        	data: ageManData,
		        	backgroundColor:  'rgba(255, 99, 132, 0.5)',
		        	borderColor:'rgba(255,99,132,1)'
		        },
		        {
		        	label: '여자',
		        	data: ageWomanData,
		        	backgroundColor:  'rgba(54, 162, 235, 0.5)',
		        	borderColor:'rgba(54, 162, 235, 1)'
		        }
		        ]
		    },
		    options: {
		    	legend: {
		            display: true
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
		
		var ctx3 = document.getElementById("membershipRatio");
		var membershipLabels = new Array();
		var membershipData = new Array();
		<c:forEach items='${membershipRatio}' var='result'>
			membershipLabels.push('${result.key}');
			membershipData.push('${result.resultCnt}');
		</c:forEach>
		var membershipRatio = new Chart(ctx3, {
			type : 'line',
			data : {
				datasets : [ {
					label: '회원수',					
					data: membershipData,
					backgroundColor: 'rgba(255, 99, 132, 0.5)',
					borderColor: 'rgba(255, 99, 132, 1)'
				} ],
				labels: membershipLabels
				
			},
			options: {
		        elements: {
		            line: {
		                tension: 0, // disables bezier curves
		            }
		        },
		        scales: {
		        	xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: '년/월'
                        }
                    }],
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
		
		
		var ctx4 = document.getElementById("areaRatio");
		var areaLabels = new Array();
		var areaData = new Array();
		<c:forEach items='${areaRatio}' var='result'>
			areaLabels.push('${result.key}');
			areaData.push('${result.resultCnt}');
		</c:forEach>
		var areaRatio = new Chart(ctx4, {
			type : 'polarArea',
			data : {
				datasets : [ {
					data: areaData,
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
		                
		                'rgba(235, 121, 91, 0.7)',
		                'rgba(232, 123, 133, 0.7)',
		                'rgba(42, 22, 111, 0.7)',
		                'rgba(40, 53, 123, 0.7)',
		                'rgba(220, 211, 133, 0.7)',
		                'rgba(174, 123, 213, 0.7)',
		                'rgba(164, 33, 123, 0.7)'                
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
		                'rgba(235, 121, 91, 1)',
		                'rgba(232, 123, 133, 1)',
		                'rgba(42, 22, 111, 1)',
		                'rgba(40, 53, 123, 1)',
		                'rgba(220, 211, 133, 1)',
		                'rgba(174, 123, 213, 1)',
		                'rgba(164, 33, 123, 1)'
		                
		            ]
				} ],
				labels: areaLabels
				
			},
			options: {
				 scale: {
				        ticks: {
				            beginAtZero: true,
				            stepSize: 1,
				            min: 0
				        }
				    }
			}
			
		});
		
		/* 
		var ctx5 = document.getElementById("preferenceRatio");

		var preferenceRatio = new Chart(ctx5, {
			type : 'radar',
			data : {
				datasets : [ {
					label: '남자',
					data: [12, 44, 32, 13, 9],
					backgroundColor: 'rgba(52,152,219, 0.6)',
		            borderColor: '#3498DB'
				},
				{	label: '여자',
					data: [15, 12, 22, 16, 27],
					backgroundColor: 'rgba(234,91,113, 0.6)',
		            borderColor: '#EA5B71'
				}],
				labels: [ '섹시', '도도한', '지적인', '낙천적인', '패셔너블', '유며있는']
				
			}
			
		});
		 */
		
		
	</script>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
	</script>
</body>
</html>