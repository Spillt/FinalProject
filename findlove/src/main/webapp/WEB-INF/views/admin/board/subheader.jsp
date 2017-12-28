<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<style>
header.subhead {
	height: 76px
}

@media ( min-width :992px) {
	header.subhead {
		height: 123px
	}
}

button.tab-btn {
	padding: 20px !important;
	margin: 5px !important;
	background-color: #faadad;
	border: 0
}

i.material-icons.card-icons {
	color: #faadad;
	font-size:69px;
}

.card.selected {
	border-color: #faadad !important;
}

.card.selected .card-header {
	background-color: #faadad;
	color: #fff;
}

.card.selected .card-header i.material-icons.card-icons {
	color: #fff;
}

h2 {
	font-weight: bold;
}

.material-icons.card-link-icons {
	color: #faadad
}

.btn.btn-search {
	background-color: #faadad;
}

</style>

</head>
<body id="page-top">
<div class="container">
	<header class="subhead"> </header>
	
	<div class="tab">
		<div class="text-center" style="background-color:#faadad; opacity:0.5; color: #fff; margin-bottom: 10px">관리자용 게시판관리 페이지입니다.</div>
		<div class="row">
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                           <div class="row">
                               <div class="col-3">
                                   <i class="material-icons card-icons">assignment</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2></h2>
                                   <div>개의 게시글이 있습니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="boardinsertview.do">
                           <div class="card-footer">
                               <span class="pull-left">게시글 관리</span>
                               <span class="float-right"><i class="material-icons card-link-icons">last_page</i></span>
                           </div>
                       </a>
                   </div>
               </div>
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                           <div class="row">
                               <div class="col-3">
                                   <i class="material-icons card-icons">question_answer</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2>8</h2>
                                   <div>개의 문의글이 있습니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="inqlist.do">
                           <div class="card-footer">
                               <span class="pull-left">1대1 문의 답변하기</span>
                               <span class="float-right"><i class="material-icons card-link-icons">last_page</i></span>
                           </div>
                       </a>
                   </div>
               </div>
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                           <div class="row">
                               <div class="col-3">
                                   <i class="material-icons card-icons">report</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2>6</h2>
                                   <div>개의 신고 게시글이 있습니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="reportboardlist.do">
                           <div class="card-footer">
                               <span class="pull-left">신고 게시글 관리</span>
                               <span class="float-right"><i class="material-icons card-link-icons">last_page</i></span>
                           </div>
                       </a>
                   </div>
               </div>
           </div>
		<hr>
		<br>
	</div>
</div>

<script>
	$(function() {
		
		$.ajax({
			url: "boardcnt.do",
			type: "get",
			headers: {
				"Content-Type" : "application/json"
			},
			success: function(responseData) {
				$('.card:first h2').text(responseData.noticeCnt+responseData.faqCnt+responseData.pollCnt);
				$('.list-group.board-sub-nav a:eq(1)').append("<div class='float-right'><span class='badge badge-secondary'>"+responseData.noticeCnt+"</span></div>");
				$('.list-group.board-sub-nav a:eq(2)').append("<div class='float-right'><span class='badge badge-secondary'>"+responseData.faqCnt+"</div>");
				$('.list-group.board-sub-nav a:eq(3)').append("<div class='float-right'><span class='badge badge-secondary'>"+responseData.pollCnt+"</div>");
			}
		});
		
	});
</script>
</body>
</html>