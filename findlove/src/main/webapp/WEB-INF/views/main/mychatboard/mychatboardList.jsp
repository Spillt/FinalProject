<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	transition: box-shadow .25s;
}

.portfolio-item-inner:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.row.panel-title {
	padding-top: 5px;
	border: 1px solid lightgray;
	text-align: left;
}

.row.panel-body {
	padding-top: 10px;
	border: 1px solid lightgray;
	border-top: 0;
}

.portfolio-caption span .material-icons.heart {
	color: #faadad
}

.portfolio-caption span .material-icons.star {
	color: #F7EC98
}

.pannel {
	margin-right: 10px;
}

.masthead {
	margin-bottom: 20px;
}

.container.top {
	margin-top: 100px;
}
/* 추가한 부분*/
.card-body1 {
  padding: 0.8rem;
}
.avatar-icon img {
    border-radius: 90%;
    height: 50px;
    width: 50px;
}
.sideBar {
  padding: 0 !important;
  margin: 0 !important;
  background-color: #fff;
  overflow-y: auto;
  border: 1px solid #f7f7f7;
  height: calc(100% - 120px);
}

.sideBar-body {
  position: relative;
  padding: 10px !important;
  border-bottom: 1px solid #f7f7f7;
  height: 72px;
  margin: 0 !important;
  cursor: pointer;
  width: 100%;
}

.sideBar-body:hover {
  background-color: #f2f2f2;
}

.sideBar-avatar {
  text-align: center;
  padding: 0 !important;
}

.avatar-icon img {
  border-radius: 50%;
  height: 49px;
  width: 49px;
}

.sideBar-main {
  padding: 0 !important;
}

.sideBar-main .row {
  padding: 0 !important;
  margin: 0 !important;
}

.sideBar-name {
  padding: 10px !important;
}

.name-meta {
  font-size: 100%;
  padding: 1% !important;
  text-align: left;
  text-overflow: ellipsis;
  white-space: nowrap;
  color: #000;
}

.sideBar-time {
  padding: 10px !important;
}

.time-meta {
  text-align: right;
  font-size: 15px;
  padding: 1% !important;
  color: rgba(0, 0, 0, .4);
  vertical-align: baseline;
}

.newMessage {
  padding: 0 !important;
  margin: 0 !important;
  height: 100%;
  position: relative;
  left: -100%;
}
.newMessage-heading {
  padding: 10px 16px 10px 15px !important;
  margin: 0 !important;
  height: 100px;
  width: 100%;
  background-color: #00bfa5;
  z-index: 1001;
}

.newMessage-main {
  padding: 10px 16px 0 15px !important;
  margin: 0 !important;
  height: 60px;
  margin-top: 30px !important;
  width: 100%;
  z-index: 1001;
  color: #fff;
}

.newMessage-title {
  font-size: 18px;
  font-weight: 700;
  padding: 10px 5px !important;
}
.newMessage-back {
  text-align: center;
  vertical-align: baseline;
  padding: 12px 5px !important;
  display: block;
  cursor: pointer;
}
.newMessage-back i {
  margin: auto !important;
}

.composeBox {
  padding: 0 !important;
  margin: 0 !important;
  height: 60px;
  width: 100%;
}

.composeBox-inner {
  height: 100%;
  width: 100%;
  padding: 10px !important;
  background-color: #fbfbfb;
}

.composeBox-inner input:focus {
  outline: none;
  border: none;
  box-shadow: none;
}

.compose-sideBar {
  padding: 0 !important;
  margin: 0 !important;
  background-color: #fff;
  overflow-y: auto;
  border: 1px solid #f7f7f7;
  height: calc(100% - 160px);
}

/*Conversation*/

.conversation {
  padding: 0 !important;
  margin: 0 !important;
  height: 100%;
  /*width: 100%;*/
  border-left: 1px solid rgba(0, 0, 0, .08);
  /*overflow-y: auto;*/
}

.message {
  padding: 0 !important;
  margin: 0 !important;
  background-size: cover;
  overflow-y: auto;
  border: 1px solid #f7f7f7;
  height: calc(100% - 120px);
}
.message-previous {
  margin : 0 !important;
  padding: 0 !important;
  height: auto;
  width: 100%;
}
.previous {
  font-size: 15px;
  text-align: center;
  padding: 10px !important;
  cursor: pointer;
}

.previous a {
  text-decoration: none;
  font-weight: 700;
}

.message-body {
  margin: 0 !important;
  padding: 0 !important;
  width: auto;
  height: auto;
}

.message-main-receiver {
  /*padding: 10px 20px;*/
  max-width: 60%;
}

.message-main-sender {
  padding: 3px 20px !important;
  margin-left: 40% !important;
  max-width: 60%;
}

.message-text {
  margin: 0 !important;
  padding: 5px !important;
  word-wrap:break-word;
  font-size: 14px;
  padding-bottom: 0 !important;
}

.message-time {
  margin: 0 !important;
  margin-left: 50px !important;
  font-size: 15px;
  text-align: right;

}

.receiver {
  width: auto !important;
  padding: 4px 10px 7px !important;
  border-radius: 10px 10px 10px 0;
  background: #ffc107;
  font-size: 12px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  word-wrap: break-word;
  display: inline-block;
}

.sender {
  float: right;
  width: auto !important;
  background: #dcf8c6;
  border-radius: 10px 10px 0 10px;
  padding: 4px 10px 7px !important;
  font-size: 12px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  display: inline-block;
  word-wrap: break-word;
}


/*Reply*/

.reply {
  height: 50px;
  width: 100%;
  background-color: #f5f1ee;
  padding: 10px 5px 10px 5px !important;
  margin: 0 !important;
  z-index: 1000;
}

.reply-emojis {
  padding: 5px !important;
}

.reply-emojis i {
  text-align: center;
  padding: 5px 5px 5px 5px !important;
  color: #93918f;
  cursor: pointer;
}

.reply-recording {
  padding: 5px !important;
}

.reply-recording i {
  text-align: center;
  padding: 5px !important;
  color: #93918f;
  cursor: pointer;
}

.reply-send {
  padding: 5px !important;
}

.reply-send i {
  text-align: center;
  padding: 5px !important;
  color: #93918f;
  cursor: pointer;
}

.reply-main {
  padding: 2px 5px !important;
}

.reply-main textarea {
  width: 100%;
  resize: none;
  overflow: hidden;
  padding: 5px !important;
  outline: none;
  border: none;
  text-indent: 5px;
  box-shadow: none;
  height: 100%;
  font-size: 16px;
}

.reply-main textarea:focus {
  outline: none;
  border: none;
  text-indent: 5px;
  box-shadow: none;
}

@media screen and (max-width: 700px) {
  .app {
    top: 0;
    height: 100%;
  }
  .heading {
    height: 70px;
    background-color: #009688;
  }
  .fa-2x {
    font-size: 2.3em !important;
  }
  .heading-avatar {
    padding: 0 !important;
  }
  .heading-avatar-icon img {
    height: 50px;
    width: 50px;
  }
  .heading-compose {
    padding: 5px !important;
  }
  .heading-compose i {
    color: #fff;
    cursor: pointer;
  }
  .heading-dot {
    padding: 5px !important;
    margin-left: 10px !important;
  }
  .heading-dot i {
    color: #fff;
    cursor: pointer;
  }
  .sideBar {
    height: calc(100% - 130px);
  }
  .sideBar-body {
    height: 80px;
  }
  .sideBar-avatar {
    text-align: left;
    padding: 0 8px !important;
  }
  .avatar-icon img {
    height: 55px;
    width: 55px;
  }
  .sideBar-main {
    padding: 0 !important;
  }
  .sideBar-main .row {
    padding: 0 !important;
    margin: 0 !important;
  }
  .sideBar-name {
    padding: 10px 5px !important;
  }
  .name-meta {
    font-size: 16px;
    padding: 5% !important;
  }
  .sideBar-time {
    padding: 10px !important;
  }
  .time-meta {
    text-align: right;
    font-size: 14px;
    padding: 4% !important;
    color: rgba(0, 0, 0, .4);
    vertical-align: baseline;
  }
  /*Conversation*/
  .conversation {
    padding: 0 !important;
    margin: 0 !important;
    height: 100%;
    /*width: 100%;*/
    border-left: 1px solid rgba(0, 0, 0, .08);
    /*overflow-y: auto;*/
  }
  .message {
    height: calc(100% - 140px);
  }
  .reply {
    height: 70px;
  }
  .reply-emojis {
    padding: 5px 0 !important;
  }
  .reply-emojis i {
    padding: 5px 2px !important;
    font-size: 1.8em !important;
  }
  .reply-main {
    padding: 2px 8px !important;
  }
  .reply-main textarea {
    padding: 8px !important;
    font-size: 18px;
  }
  .reply-recording {
    padding: 5px 0 !important;
  }
  .reply-recording i {
    padding: 5px 0 !important;
    font-size: 1.8em !important;
  }
  .reply-send {
    padding: 5px 0 !important;
  }
  .reply-send i {
    padding: 5px 2px 5px 0 !important;
    font-size: 1.8em !important;
  }
</style>
<script src = " https://use.fontawesome.com/56a81332b8.js " > </script>
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

	<form name="myForm" action="/findlove/openSendMessageList.do" method="POST">
		<input type="hidden" name="sender_id" value="${ sessionScope.user_id }" />
	</form>

	<!-- Portfolio Grid -->
	<div class="container top">
		<div class="row">
			<!-- <div class="col-lg-12 text-center">
				<img class="img-fluid" src="/findlove/resources/img/ad/ad-banner.jpg">
			</div> -->
		</div>
	</div>

	<br>
	<h1 align="center">나의 매칭 정보</h1>
	<br>
	
	<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-4">
          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	수락한 이성 리스트
            </div>
            <div class="card-body1">
				<div class="row sideBar">
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar1.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar2.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">John Doe
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				    <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">HyeJeong
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">HyeJeong
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">HyeJeong
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">HyeJeong
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				   <div class="row sideBar-body">
				      <div class="col-sm-3 col-xs-3 sideBar-avatar">
				        <div class="avatar-icon">
                			<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
              			</div>
				      </div>
				      
				      <div class="col-sm-9 col-xs-9 sideBar-main">
                        <div class="row">
                           <div class="col-sm-8 col-xs-8 sideBar-name">
                              <span class="name-meta">HyeJeong
                              </span>
                           </div>
                           <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                             <span class="time-meta pull-right">18:18
                             </span>
                           </div>
                       </div>
                      </div>
				   </div>
				</div><!-- row sideBar -->
			</div>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-8">
          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              	이미지 채팅내용
            </div>
            <div class="card-body1">
			  <div class="row message" id="conversation">
				<div class="row message-body">
					<div class="col-sm-12 message-main-receiver">
						<div class="receiver">
							<div class="message-text">Hi, what are you doing?!</div>
							<span class="message-time pull-right"> Sun </span>
							</div>
						</div>
				</div>
					 
				<div class="row message-body">
          		  <div class="col-sm-12 message-main-sender">
                    <div class="sender">
                      <div class="message-text">
                      I am doing nothing man!
                    </div>
                   <span class="message-time pull-right">Sun</span>
                  </div>
                 </div>
        	   </div>
        	   
        	    <div class="row reply">
        		 
      			</div>
      		</div>			
				  </div>
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
				
			</div>
		</div>
	</section>
	<hr>
	
	
	<c:import url="../../include/footer.jsp" /> 
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Message</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">보낸사람</label>
            <input type="text" class="form-control" id="recipient-name" readonly>
          </div>
          <div class="form-group">
            <label for="content-name" class="control-label">보낸날짜</label>
            <input type="text" class="form-control" id="content-name" readonly>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">내용</label>
            <textarea class="form-control" id="message-text" rows="7" readonly></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning btn-filter" onclick="acceptCheck()">수락</button>
		<button type="button" class="btn btn-danger btn-filter" onclick="acceptCheck()">거절</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  /* var date = */
	  var content = button.data('content')
	  var modal = $(this)
	  modal.find('.modal-title').text('Message')
	  modal.find('.modal-body input').val(recipient)
	 /*  modal.find('.modal-body input[2]').val(content) */
	})
</script>
<script type="text/javascript">
	$(function() {
    $('#mainNav').css('background-color', '#faadad');
 });
</script>
<script type="text/javascript">
	function acceptCheck() {
		var modal = $('#exampleModal');
		
		modal.modal('hide');
	}
</script>
<script>
$(document).ready(function () {

	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
 </script>

</body>

</html>
