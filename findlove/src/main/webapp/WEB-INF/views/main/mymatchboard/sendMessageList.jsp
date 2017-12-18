<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>연애의발견</title>
    
	<style type="text/css">
		.portfolio-item-inner {
		    line-height: 1.42857143;
		    background-color: #fff;
		    border-radius: 2px;
		    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
		    transition: box-shadow .25s; 
		}
		.portfolio-item-inner:hover {
			box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		}
		.row.panel-title {
			padding-top:5px;
			border: 1px solid lightgray;
			text-align:left;
		}
		.row.panel-body {
			padding-top:10px;
			border: 1px solid lightgray;
			border-top:0;
		}
		.portfolio-caption span .material-icons.heart {
			color: #faadad
		}
		.portfolio-caption span .material-icons.star {
			color: #F7EC98
		}
		
		.pannel {
			margin-right:10px;
		}
		.masthead {
			margin-bottom: 20px;
		}
	</style>
	
</head>
<body id="page-top">
	<%-- <h1>home.jsp</h1>
<c:if test="${empty sessionScope.user }">
	<form action="login.do" method="post">
		<input type="text" name="userId">
		<input type="password" name="userPwd">
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${!empty sessionScope.user }">
	<p>${user.userName } 님 환영합니다.</p>
</c:if> --%>

<c:import url="../../include/header.jsp" />

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading">&nbsp;</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="#services">시작하기</a>
			</div>
		</div>
	</header>

	<!-- Portfolio Grid -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<img class="img-fluid" src="/findlove/resources/img/ad/ad-banner.jpg">
			</div>
		</div>
	</div>

	<br>
	<h1 align="center">나의 매칭 정보</h1>
	<br>
	
	<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <br>
          <!-- <h1 class="my-4">Shop Name</h1> -->
          <div class="list-group">
            <a href="#" class="list-group-item active">내가 호감을 보낸 이성</a>
            <a href="#" class="list-group-item">나에게 호감을 보낸 이성</a>
            <a href="#" class="list-group-item">내가 높은 평점을 준 이성</a>
            <a href="#" class="list-group-item">나에게 높은 평점을 준 이성</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <!-- <div class="card mt-4">
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
            <div class="card-body">
              <h3 class="card-title">내가 호감을 보낸 이성</h3>
              <h4>$24.99</h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
            </div>
          </div>
          /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	내가 호감을 보낸 이성
            </div>
            <div class="card-body"> 
               <table id="tableData" class="table table-bordered">
			   </table>
              <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <a href="#" class="btn btn-success">수락</a>
              <hr> -->
              <a href="#" class="btn btn-primary">삭제</a>
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->
	
	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="/profileboard/profileList.do"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/envato.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/designmodo.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/themeforest.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="/findlove/resources/img/logos/creative-market.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>
	<hr>
	
	<c:import url="../../include/footer.jsp" /> 



<script type="text/javascript">
        var sender="${sessionScope.user_id}";
        
        $.ajax({
            url:"openSendMessageList.do",
            type: "post",
            dataType: "json",
            data : {"sender_id":sender},
            success : function(data){
               
               var jsonStr = JSON.stringify(data);
                                             
               var json = JSON.parse(jsonStr);
               
               // 리스트 처리
               var values='<tr>'
					+'<th>받은사람</th>'
					+'<th>내용</th>'
					+'<th>보낸 날짜</th>'
					+'<th>읽은 여부</th>'
					+'<th>수락 여부</th>'
					+'</tr>';
               for (var i in json.sendList){
            	   values+='<tr>'
            	   +'<td><a href="">'+json.sendList[i].userNickNM+'</a></td>'
            	   +'<td><a href="javascript:OpenMessagePopup();">'+json.sendList[i].messageContent+'</a></td>'
            	   +'<td>'+json.sendList[i].sendDT+'</td>'
            	   +'<td>'+json.sendList[i].readFL+'</td>'
            	   +'<td>'+json.sendList[i].acceptST+'</td>'
				   +'</tr>';
					}
         
               $('#tableData').html(values);
        
            },
            error : function(request, status, errorData){
                  alert("error code : " + request.status + "\n"
                        + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
                  }
            });   
</script>
<script type="text/javascript">

function OpenMessagePopup(){

	window.open('http://www.naver.com', 'window팝업', 'width=300, height=300, menubar=no, status=no, toolbar=no');

}

</script>

</body>

</html>
