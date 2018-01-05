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
		<div class="row">
		
			   <!-- 계정 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=계정">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>계정</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 계정 끝 -->
               
               <!-- 결제 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=결제">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>결제</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 결제 끝 -->
               
               <!-- 게시판 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=게시판">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>게시판</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 게시판 끝 -->
            
               <!-- 매칭 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=매칭">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>매칭</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 매칭 끝 -->
               
               <!-- 이벤트 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=이벤트">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>이벤트</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 이벤트 끝 -->
               
               <!-- 프로필 -->
               <div class="col-2">
                   <div class="card">
	                   <a href="openFaqList.do?faqGB=프로필">
	                       <div class="card-header">
	                           <div class="row">
	                               <div class="col-9 text-right">
	                                   <div>프로필</div>
	                               </div>
	                           </div>
	                       </div>    
                       </a>
                   </div>
               </div>
               <!-- 프로필 끝 -->
               
           </div>
		<hr>
		<br>
	</div>
</div>
</body>
</html>