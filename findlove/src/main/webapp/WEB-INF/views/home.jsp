<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.portfolio-item-inner {
		    line-height: 1.42857143;
		    background-color: #fff;
		    border-radius: 2px;
		    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
		    transition: box-shadow .25s; 
		}
		.portfolio-item-inner:hover {
			box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		}
		.portfolio-item {
			padding: 1px !important;
		}
		.row.panel-title {
			padding-top:5px;
			border: 1px solid lightgray;
		}
		.row.panel-body {
			border: 1px solid lightgray;
			border-top:0;
		}

		.masthead {
			margin-bottom: 20px;
		}
		
		.panel, .panel-title, .panel-body {
			border: 1px solid transparent !important;
		}
		.sub-panel {
			padding-left: 17px !important;
		}
		.inner-sub-panel {
			border: 1px solid lightgray !important;
		}
		
		span .fa.fa-direct-icon {
			color: #faadad;
			font-size: 25px;
			padding-right: 5px;
			padding-left: 5px;
		}
		span .fa.fa-direct-icon:hover {
			color: #f77070;
			cursor: pointer;
		}
		
		.panel-title h5 {
			font-weight: bold !important;
			color: #faadad;
		}
		.panel-title h6 {
			font-size: 16px;
			font-weight: bold;
		}
		.panel > div {
			margin: auto;
		}
		
		.inner-sub-panel .panel {
			padding: 5px;
			padding-bottom: 10px;
		}
		.inner-sub-panel hr {
			margin-left: 15px;
			margin-right: 15px;
		}
		
		.short-cut-menu > div {
			height: 70px;
		}
		.short-cut-menu i {
			color: #fff;
			font-size: 30px;
		}
		.short-cut-item:hover {
			background-color: black;
		}
		
		
	.table-fixed tbody {
	  height: 200px;
	  overflow-y: auto;
	  width: 100%;
	}
	.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
	  display: block;
	}
	.table-fixed tbody td, .table-fixed thead > tr> th {
	  float: left;
	  border-bottom-width: 0;
	}
	
	.btn.btn-profile-short-cut {
		color: #faadad;
		background-color: #fff;
		border-radius: 0;
	}
	
		
		
	.portfolio-caption span .material-icons.heart {
		color: #faadad
	}
	.portfolio-caption span .material-icons.star {
		color: #F7EC98
	}
	
	.simple-notice div {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow:hidden;
	}
		
		
		
		
		<style class="cp-pen-styles">@import url('https://fonts.googleapis.com/css?family=Roboto:700');

body {
  margin:0px;
  font-family:'Roboto';
  text-align:center;
}

#container {
  color:#999;
  text-transform: uppercase;
  font-size:36px;
  font-weight:bold;
  padding-top:200px;  
  position:fixed;
  width:100%;
  bottom:45%;
  display:block;
}

#flip {
  height:50px;
  overflow:hidden;
}

#flip > div > div {
  color:#fff;
  padding:4px 12px;
  height:45px;
  margin-bottom:45px;
  display:inline-block;
}

#flip div:first-child {
  animation: show 5s linear infinite;
}

#flip div div {
  background:#42c58a;
}
#flip div:first-child div {
  background:#4ec7f3;
}
#flip div:last-child div {
  background:#DC143C;
}

@keyframes show {
  0% {margin-top:-270px;}
  5% {margin-top:-180px;}
  33% {margin-top:-180px;}
  38% {margin-top:-90px;}
  66% {margin-top:-90px;}
  71% {margin-top:0px;}
  99.99% {margin-top:0px;}
  100% {margin-top:-270px;}
}

p {
  position:fixed;
  width:100%;
  bottom:30px;
  font-size:12px;
  color:#999;
  margin-top:200px;
}

td {
	overflow:hidden;
	white-space:nowrap;
}

.more-view-btn, .popular-board-detail {
	cursor: pointer;
}

.more-view-btn:hover, .popular-board-detail:hover, .noticeBtn:hover {
	font-weight: bold;
}

.short-cut-item, .noticeBtn {
	cursor: pointer;
}
.short-cut-item i:hover {
	color: #f77070;
}
</style>


</head>
<body id="page-top">
<c:import url="./include/header.jsp" />

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading"><br></div>
			</div>
		</div>
	</header>


	<section id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-md-9 main-panel" style="min-height: 600px;">
					<div class="panel">
						<div class="row panel-title">
							<div class="col-8">
								<h5>이 주의 TOP 3</h5>
							</div>
							<div class="col-4">
								<span><i class="fa fa-chevron-circle-right fa-direct-icon top-n float-right" aria-hidden="true"></i></span>
								<span class="float-right direct-text" style="color:#faadad; padding-left: 4px; padding-right:4px">평점</span>
								<span><i class="fa fa-chevron-circle-left fa-direct-icon top-n float-right" aria-hidden="true"></i></span>
							</div>
						</div>
						<div class="row panel-body">
						
							<c:forEach items="${list}" var="user">
							
								<div class="col-4 portfolio-item">
									<div class="portfolio-item-inner">
										<a class="portfolio-link">
											<div class="portfolio-hover">
												<div class="portfolio-hover-content">
													<c:if test="${sessionScope.user_id ne null}">
														<button class="btn btn-profile-short-cut" onclick="window.location.href='openProfileDetail.do?user_nicknm=${user.user_nicknm }'">프로필 보러가기</button>
													</c:if>
												</div>
											</div> <img class="img-fluid" src="/findlove/uploadfiles/profile/${user.picture_nm}"
											alt="">
										</a>
										<div class="portfolio-caption">
											<h5 class="userNickNm">${user.user_nicknm }</h5>
											<div class="row" style="margin:auto">
												<div class="col-12 text-right"><span class="grade-or-favorite-icon"><i class="material-icons star">star</i></span><span class="text-muted grade-or-favorite">${user.grade_avg}</span></div>
												<!-- <div class="col-6"><span><i class="material-icons heart">favorite_border</i></span><span class="text-muted">23</span></div> -->
											</div>
										</div>
									</div>
								</div>
							
							</c:forEach>
							
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-7">
							<div class="panel">
								<div class="row panel-title">
									<div class="col-6">
										<h5>지금 인기글</h5>
									</div>
									<div class="col-6">
										<div class="float-right more-view-btn" style="color:gray">더보기</div>
									</div>
								</div>
								<div class="row panel-body">
									<table class="table table-striped text-center">
										<thead>
											<tr class="row" style="margin:auto"><td class="col-8">제목</td><td class="col-4">조회수</td></tr>
										</thead>
							    		<tbody>
							    			<c:forEach items="${popularBoardList}"  var="board">
										    	<tr id="popular${board.freeNo }" class="row popular-board-detail" style="margin:auto"><td class="col-8">${board.freeTitle }</td><td class="col-4">${board.freeReadCnt }</td></tr>
									    	</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div class="col-sm-5">
							<div class="panel">
								<div class="row panel-title">
									<div class="col-12">
										<h5>최근 매칭 커플</h5>
									</div>
								</div>
								<div class="row panel-body">
									<table class="table table-striped text-center">
							    		<tbody>
											<c:forEach items="${coupleList}"  var="couple">
												<tr><td>${couple.sender_nicknm} <i class="material-icons" style="color:#faadad">favorite</i> ${couple.receiver_nicknm}</td></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="col-md-3 sub-panel">
					<div class="inner-sub-panel" style="min-height: 600px;" >
					
						<div class="panel">
							<div class="row panel-title">
								<div class="col-12">
									<h6 class="section-heading">알림</h6>
								</div>
							</div>
							<div class="panel-body simple-notice" style="padding-left: 20px">
								<c:forEach items="${newNoticeList}"  var="notice">
									<div id="notice-${notice.notice_no }" class="noticeBtn">${notice.notice_title}</div>
								</c:forEach>
							</div>
						</div>
						<hr>
						<div class="panel">
							<div class="row panel-title">
								<div class="col-12">
									<h6 class="section-heading">바로가기</h6>
								</div>
							</div>
							<div class="row panel-body short-cut-menu">
								<div id="scAttBtn" data-toggle="tooltip" title="출석체크" class="col-6 text-center short-cut-item" style="background-color:#faadad; padding-top: 21px;"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
								<div id="scMyPageBtn" data-toggle="tooltip" title="마이페이지" class="col-6 text-center short-cut-item" style="background-color:#F98E78; padding-top: 21px;"><i class="fa fa-address-card-o" aria-hidden="true"></i></div>
								<div id="scChargeBtn" data-toggle="tooltip" title="충전하기" class="col-6 text-center short-cut-item" style="background-color:B6ABAB; padding-top: 21px;"><i class="fa fa-credit-card" aria-hidden="true"></i></div>
								<div id="scInquiryBtn" data-toggle="tooltip" title="일대일문의" class="col-6 text-center short-cut-item" style="background-color:#9F6262; padding-top: 21px;"><i class="fa fa-commenting-o" aria-hidden="true"></i></div>
							</div>
						</div>
						<hr>
						<div class="panel">
							<div class="row panel-title">
								<div class="col-12">
									<div class="row">
										<div class="col-9">
											<h6 class="section-heading">실시간 접속자</h6>
										</div>
										<div class="col-3">
											<div id="rtCnt" style="font-size: 16px; color: gray">0명</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row panel-body">
								<div class="col-12">
									 <table class="table table-fixed">
									    <tbody id="realTimeUser">
									   </tbody>
									</table>
								</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
				<section>
               <div class="container">
                  <div class="row">                     
                     <div class="col-md-12 col-sm-6" style="padding-left:0px;">
                     <img class="img-fluid d-block mx-auto"
                           src="/findlove/resources/img/logos/findlove_logo.png" alt="">
                     
                     </div>                     
                  </div>
               </div>               
            <div class="panel">
               <img src="./././resources/img/main_content.PNG" style="margin-left:50px;">
            </div>
            </section>   
               

            <div class="panel">
               <div class="row panel-title">
                  <div class="col-12" style="padding-left: 470px;">                  
                     
                  </div>
               </div>
               <img src="./././resources/img/statistic.png">
            </div>
				
			</div>
		</div>
	</section>
	<hr>
	<c:import url="./include/footer.jsp" />
	<script>
		$('.fa-direct-icon.top-n').on('click', function() {
			$.ajax({
				url: "topnuser.do",
				type: "get",
				headers: {
					"Content-Type" : "application/json"
				},
				data: {"category" : $('.direct-text').text(), "n" : 3},
				success: function(responseData) {
					var list = responseData.list;
					for(var i=0; i<3; i++) {
						$('.portfolio-item:eq('+i+') .userNickNm').text(list[i].user_nicknm);
						$('.portfolio-item:eq('+i+') img').attr('src', '/findlove/uploadfiles/profile/'+list[i].picture_nm);
						if($('.direct-text').text() == "평점") {
							$('.portfolio-item:eq('+i+') .grade-or-favorite').text(list[i].favorite_cnt);
							$('.btn-profile-short-cut:eq('+i+')').attr('onclick', "window.location.href='openProfileDetail.do?user_nicknm="+list[i].user_nicknm+"'")
						} else {
							$('.portfolio-item:eq('+i+') .grade-or-favorite').text(list[i].grade_avg);
						}
					}
					if($('.direct-text').text() == "평점") {
						$('.direct-text').text("호감도")
						$('.grade-or-favorite-icon i').removeClass('star');
						$('.grade-or-favorite-icon i').addClass('heart');
						$('.grade-or-favorite-icon i').text('favorite_border');
					} else {
						$('.direct-text').text("평점");
						$('.grade-or-favorite-icon i').removeClass('heart');
						$('.grade-or-favorite-icon i').addClass('star');
						$('.grade-or-favorite-icon i').text('star');
					}
				}
			});
				
		});
	</script>
	<script>
	function login_check(){
		$.ajax({
	        url : 'loginChecking.do',
	        type : 'post',
	        dataType : 'json',
	        	success : function(data) {
	            	if(data != null){
	            		
	            		var jsonStr = JSON.stringify(data);
						var json = JSON.parse(jsonStr);
						var cnt = ''+ json.list[json.list.length-1].list + '명';
						var values = '';
						for(var i in json.list){
							if(i <json.list.length-1 )
								values += "<tr><td class='col-12'>"+json.list[i].list +"</td></tr>";
						}	
						$('#rtCnt').text(cnt);
						$('#realTimeUser').html(values);
	        		}else{
	        			var jsonStr = JSON.stringify(data);
	    				var json = JSON.parse(jsonStr);
	        			var values = "<tr><td class='col-12'>접속자 0명</td></tr>";
	        			$('#realTimeUser').html(values);
	        		}
	            },
	            error : function(data) {
	               alert("메세지 오류!");
	            }
	     })
	}
	
	$('.popular-board-detail').on('click', function() {
		
		if('${sessionScope.user_id}' == "") {
			alert('로그인해주세요.');
		} else {
			location.href = "detailFreeboard.do?freeNo="+$(this).attr('id').substr(7);
		}
		
		
	});
	
	$('.more-view-btn').on('click', function() {
		if('${sessionScope.user_id}' == "") {
			alert('로그인해주세요.');
		} else {
			location.href = "openFreeboardList.do";
		}
	});
	//   
	$('.short-cut-item').on('click', function() {
		
		if('${sessionScope.user_id}' == "") {
			alert('로그인해주세요.');
		} else {
			if($(this).attr('id') == "scAttBtn") {
				location.href="attendancelist.do?userId=${sessionScope.user_id}"
			} else if($(this).attr('id') == "scMyPageBtn") {
				location.href="myinfo.do?user_id=${sessionScope.user_id}"
			} else if($(this).attr('id') == "scChargeBtn") {
				location.href="store.do";
			} else {
				location.href="InqList.do?userId=${sessionScope.user_id}"
			}
		}
	});
	
	$('.noticeBtn').on('click', function() {
		if('${sessionScope.user_id}' == "") {
			alert('로그인해주세요.');
		} else {
			location.href="detailnotice.do?noticeNo=" + $(this).attr('id').substr(7);
		}
		
	});



	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip(); 
		setInterval("login_check()", 6000);
	});
	</script>
</body>

</html>
