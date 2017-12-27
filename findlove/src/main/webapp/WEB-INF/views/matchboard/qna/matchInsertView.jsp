<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
 <style type="text/css">
    .btn-block{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
  }
  .btn-block:hover{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
    Opacity : 0.8;
  }
  .btn-block:active{
  	background-color : pink;
    color : white;
  	border: 1px solid pink;
    Opacity : 0.8;
  }
  .list-group{
  weight : 60px;
  }
  </style>

</head>
<body>
<c:import url="../../include/header.jsp"/>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>다음 질문중 3가지를 골라 답변해주시기바랍니다.</h1>
<div class="col-lg-3">
          <br>
          <!-- <h1 class="my-4">Shop Name</h1> -->
          <div class="list-group">
            <a href="selectuserlist.do?userId=${user_id }" class="list-group-item active">매칭게시판</a>
            <a href="listMatchqna.do" class="list-group-item">내 QnA작성하기</a>
            <a href="#" class="list-group-item">내 QnA삭제하기</a>
          </div>
        </div>

<br>
<c:forEach var="q" items="${requestScope.list}">
<div class="container">
  <h2>${q.question_no }.</h2>
  <div class="well">${q.question }</div>
  <div class="anser"><input type="radio" name="${q.question_no }" class = "checkSelect" value = "${q.question_no }/1">${q.choice1 }</div>
  <div class="anser"><input type="radio" name="${q.question_no }" class = "checkSelect" value = "${q.question_no }/2">${q.choice2 }</div>
  <div class="anser"><input type="radio" name="${q.question_no }" class = "checkSelect" value = "${q.question_no }/3">${q.choice3 }</div>
  <br>
</div>
<br>
</c:forEach>

<input type="button" value="제출하기" onclick="radioboxCheck();">
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
	});
</script>
<script type="text/javascript">

	function radioboxCheck(){
		 if($("input:radio:checked").length != $("input:radio").length/3){
			alert("전부 선택해주세요.");
		}else{
			alert("성공적으로 저장되었습니다.");
			var send_array = Array();
			var send_cnt = 0;
			var chkbox = $(".checkSelect");

			for(i=0;i<chkbox.length;i++) {
			    if (chkbox[i].checked == true){
			        send_array[send_cnt] = chkbox[i].value;
			        send_cnt++;
			    }
			}
			document.location.href="insertMatchqna.do?check="+send_array+"&userId=${user_id}"; 
		}
		
	}

	
</script>
</body>
</html>