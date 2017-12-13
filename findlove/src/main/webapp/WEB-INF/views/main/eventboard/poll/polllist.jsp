<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>PollList</title>
<style>
header.subhead {
	height: 56px
}

@media ( min-width :992px) {
	header.subhead {
		height: 103px
	}
}
body{
background:url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
}
.event {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
	border: 1px solid  #ffb7b9;
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

.poll {
	float: left;
	width: 100%;
	padding-right: 20px;
	padding-left: 25px;
	padding-top: 10px;
	margin: 0 auto;
	text-align: center;
}
  th {
    background-color: #faadad;
  }
  td {
    background-color: white;
  }
</style>
</head>
<body>
	설문조사
	<c:import url="../../../include/header.jsp" />
	<header class="subhead"> </header>



	<div class="event">
		<ul>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="attendancelist.do">출석체크</a></li>
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="polllist.do">설문조사</a></li>
		</ul>
	</div>
	<hr>
	<div class="poll" id="polltitle">
		<table id="tableData" class="table table-bordered table-striped" align="center" border="1">
			<tr >
				<td width="60%">설문내용</td>
				<td width="20%">설문기간</td>
				<td width="10%">시작하기</td>
				<td width="10%">결과보기</td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			<tr>
				<td >남자/여자가 싫어하는 말은?</td>
				<td>2017.12.12 ~ 2017.12.30</td>
				<td><a href="polldetail.do" class="btn btn-primary">시작하기</a></td>
				<td><a href="pollresult.do" class="btn btn-primary">결과보기</a></td>
			</tr>
			
		</table>  

	</div>
	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/findlove/resources/js/paging.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});
		  $(document).ready(function() {
              $('#tableData').paging({limit:5});
          });
	</script>
	    
</body>
</html>
