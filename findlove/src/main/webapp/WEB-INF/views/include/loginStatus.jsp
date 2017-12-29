<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div style="width:100%; height:200px; overflow:auto" class="loginCheck">
0
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	
	<tr><th>회원아이디</th></tr>
	<tr><td>로딩중</td></tr>
</table>

</div>

<script>

function login_check(){
	$.ajax({
        url : 'loginCheck.do',
        type : 'post',
        dataType : 'json',
        	success : function(data) {
            	
            	var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var values = json[0] 
					 + '<table width="100%" border="0" cellspacing="0" cellpadding="0">'
					 + '<tr><th>회원 아이디</th></tr>';
				for(var i in json){
					values += '<tr><td>'+json[i]+'</td></tr>';
				}	
					 values += '</table>';
					 
				$('.loginCheck').html(values);
            },
            error : function(data) {
               alert("메세지 오류!");
               modal.modal('hide');
            }
     })
}



$(document).ready(function() {
setInterval("login_check()", 6000);
});


</script>
</body>
</html>