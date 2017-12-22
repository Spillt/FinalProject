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
		<div class="text-center" style="background-color:#faadad; opacity:0.5; color: #fff; margin-bottom: 10px">관리자용 회원관리 페이지입니다.</div>
		<div class="row">
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                           <div class="row">
                               <div class="col-3">
                                   <i class="material-icons card-icons">people</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2>${userAllCnt}</h2>
                                   <div>명의 회원이 있습니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="userlist.do?pageNo=1">
                           <div class="card-footer">
                               <span class="pull-left">전체 회원 관리</span>
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
                                   <i class="material-icons card-icons">insert_comment</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2>${userWaitCnt}</h2>
                                   <div>명이 승인 대기중입니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="registerlist.do">
                           <div class="card-footer">
                               <span class="pull-left">가입 승인 관리</span>
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
                                   <i class="material-icons card-icons">report_problem</i>
                               </div>
                               <div class="col-9 text-right">
                                   <h2>${reportCnt}</h2>
                                   <div>명이 신고 대기중입니다.</div>
                               </div>
                           </div>
                       </div>
                       <a href="reporterlist.do">
                           <div class="card-footer">
                               <span class="pull-left">신고 회원 관리</span>
                               <span class="float-right"><i class="material-icons card-link-icons">last_page</i></span>
                           </div>
                       </a>
                   </div>
               </div>
           </div>
		<hr>
		<div class="row">
			<div class="col left-search-option">
			</div>
			<div class="input-group search-bar col-md-6">
				<input id="search" type="text" class="form-control" placeholder="리스트 내 검색">
	            <span class="input-group-btn">
	           	<button class="btn btn-search" type="button"><i class="material-icons">search</i></button>
	            </span>
            </div>
		</div>
           
		<br>
	</div>
</div>
<script>

$(document).ready(function(){
	searchFunction();
});
</script>
</body>
</html>