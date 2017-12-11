<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>PollDetail</title>
<style>
   header.subhead {height:56px}@media ( min-width :992px) {header.subhead {height:103px}}
  
   .event {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
}

.event ul {
	list-style: none;
}

.event ul li {
	color: #808080;
	padding-bottom: 3px;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-color: white;
	display: inline-block;
	padding-right: 10px;
} 
   
</style>
</head>
<body>

   <c:import url="../../../include/header.jsp" />
   <header class="subhead">
   </header>
	
	
	

	<div class="event">
		<ul>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="attendancelist.do">출석체크</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="polllist.do">설문조사</a></li>
		</ul>
	</div>
	<div class="polldetail">
	
	
	
	</div>
	
	<script type="text/javascript">
      $(function(){
         $('#mainNav').css('background-color', '#faadad');
      });
   </script>
</body>
</html>