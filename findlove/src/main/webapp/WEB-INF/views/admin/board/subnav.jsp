<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<style>
	.list-group-item.selected {
		background-color: #faadad;
		color: #fff;
	}
	nav {
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
<nav class="col-md-3">
	<div class="list-group board-sub-nav" style="margin-bottom: 20px;">
		<a href="boardinsertview.do" class="list-group-item">등록/수정<span class="float-right"><i class="material-icons text-secondary">create</i></span></a>
		<a href="boardnoticelist.do" class="list-group-item">공지사항</a>
		<a href="boardfaqlist.do" class="list-group-item">FAQ</a>
		<a href="boardeventlist.do" class="list-group-item">이벤트</a>
	</div>
	
		<div class="input-group search-bar">
			<input id="search" type="text" class="form-control" placeholder="리스트 내 검색">
            <span class="input-group-btn">
           		<button class="btn btn-search" type="button"><i class="material-icons">search</i></button>
            </span>
		</div>
</nav>
<script>
	$("#search").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("table tr:gt(0)").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
</script>
</body>
</html>