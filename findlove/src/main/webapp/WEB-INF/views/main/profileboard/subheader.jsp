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
	font-size:30px;
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

h5 {
	align: center;
	color: #faadad;
	font-weight: bold;
}

.material-icons.card-link-icons {
	color: #faadad
}

.btn.btn-search {
	background-color: #faadad;
}

</style>
<script src="https://use.fontawesome.com/56a81332b8.js"></script>

</head>
<body id="page-top">
<div class="container">
	<header class="subhead"> </header>
	
	<div class="tab">
		<div class="text-center" style="background-color:#faadad; opacity:0.5; color: #fff; margin-bottom: 10px">프로필 페이지입니다.</div>
		<div class="row">
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                       
                       		<h5 align="center">전체 회원</h5>
                      
                           
                       </div>                
                   </div>
               </div>
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                       <h5 align="center">남성 회원</h5>
                         
                       </div>                     
                   </div>
               </div>
               <div class="col-4">
                   <div class="card">
                       <div class="card-header">
                        <h5 align="center">여성 회원</h5>
                        
                       </div>                      
                   </div>
               </div>
           </div>
		<hr>
		<div class="row">
		<div class="col-12">
		<div class="btn-group" role="group" aria-label="...">
  <button type="button" class="btn btn-default">Left</button>
  <button type="button" class="btn btn-default">Middle</button>
  <button type="button" class="btn btn-default">Right</button>
</div></div>
		</div>
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