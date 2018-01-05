<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table{
	class: table table-bordered;
}
td{
	border: 1px solid;
}
</style>
</head>
<body>


<div class="loginCheck" style="overflow:auto;">
	<table class = "table table-bordered">	
	<tr><th>회원아이디</th></tr>
	<tr><td>로딩중...</td></tr>
	</table>
</div>

<script>

function login_check(){
	$.ajax({
        url : 'loginCheck.do',
        type : 'post',
        dataType : 'json',
        	success : function(data) {
            	if(data != null){
            		
            		var jsonStr = JSON.stringify(data);
					var json = JSON.parse(jsonStr);
					var values = '현재 접속자 수 : ' + json.list[json.list.length-1].list + '명';
					values += '<table class="table table-bordered">'						
					 	+ '<tr><th>회원아이디</th></tr>';
					for(var i in json.list){
						if(i <json.list.length-1 )
							values += '<tr><td>'+json.list[i].list +'</td></tr>';							
					}	
						 values += '</table class="table table-bordered">';
						 
					$('.loginCheck').html(values);
        		}else{
        			var jsonStr = JSON.stringify(data);
    				var json = JSON.parse(jsonStr);
        			var values = '0'
					 	+ '<table>'
					 	+ '<tr><th>회원아이디</th></tr>';
        			values += '</table>';
        			$('.loginCheck').html(values);
        		}
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