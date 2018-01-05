<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<script src="/findlove/resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript"
	src="/findlove/resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
var sock = new SockJS("<c:url value="/echo-ws"/>");//echoHandler 호출해서 sock 변수에 저장 ,사용자끼리 채팅 가능하게 구현.
sock.onmessage = onMessage;
sock.onclose = onClose;

$(function(){
	$("#sendBtn").click(function(){
		console.log('send message...');
		sendMessage();
});

function sendMessage(){
	
	sock.send($("#message").val());//text 인풋의 값을 send 함수로 보낸다.
}

function onMessage(evt){ //전송 버튼 누를시에 호출. evt는  채팅방에 저장되있는 상대방의 아이디와 텍스트를 저장해놓는다. handleTextMessage sess.sendMessage 호출됨.
						 //메세지 처리 방식.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	var matchingId = $('#matchingId').val();
	
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	var currentuser_session =$('#sessionuserid').val();
	
	console.log('current session id : ' + currentuser_session);
	
	sessionid = strArray[0];
	message = strArray[1];
	time = strArray[2];
	if(matchingId !=""){
		if(sessionid == currentuser_session){ //본인아이디
		
			var printHTML = "<div class='well'>";
			printHTML += "<div class = 'alert alert-info'>";
			printHTML += "<strong>"+ sessionid +"</strong><br>"+ message + "<small> (" + time + ")</small>";
			printHTML += "</div>";
			printHTML += "</div>";
		
			$('#chatdata').append(printHTML);
			
		}else if(sessionid == matchingId ){
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>"+ matchingId +"</strong><br> "  + message + "<small> (" + time + ")</small>";
			printHTML += "</div>";
			printHTML += "</div>";
			$("#chatdata").append(printHTML);
		}
	}
	console.log('chatting data : ' + data);
}
 
 
$(function(){
	$("#out").click(function(){
		console.log('exit room...');
		exitRoom();
	});
});

function exitRoom(){
	sock.onclose();//text 인풋의 값을 send 함수로 보낸다.
}

function onClose(evt){//아직 구현 안함.
	$('#data').append("연결 끊김");
	
}
</script>
<script type="text/javascript">
$(window).on("beforeunload", function() {

	 $.ajax({
		url : 'deleteChat.do',
		type : 'post',
		data : {
			"sessionid" : sessionid,
			"matchingId" : matchingId
		},
		success : function(data) {
			if(data == 1) {
				$('#data').append("연결 끊김");
			}else{
				alert("오류");
			}
		}
	})
	  
});
</script>
<style type="text/css">
.chat {
	list-style: none;
	margin: 0;
	padding: 0;
}

.chat li {
	margin-bottom: 10px;
	padding-bottom: 5px;
	border-bottom: 1px dotted #B3A9A9;
}

.chat li.left .chat-body {
	margin-left: 60px;
}

.chat li.right .chat-body {
	margin-right: 60px;
}

.chat li .chat-body p {
	margin: 0;
	color: #777777;
}

.panel .slidedown .glyphicon, .chat .glyphicon {
	margin-right: 5px;
}

.panel-body {
	overflow-y: scroll;
	height: 250px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #555;
}

.portfolio-item-inner {
	line-height: 1.42857143;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	transition: box-shadow .25s;
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
	margin: 0 !important;
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
	word-wrap: break-word;
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
}
</style>
<script src=" https://use.fontawesome.com/56a81332b8.js "> </script>
</head>
<body id="page-top">
<input type="hidden" id="matchingId" value="${matchingId }">
	<c:import url="../../include/header.jsp" />

	<br>

	<div class="container top">
		<div class="row">
			<div class="col-lg-12 text-left">
				<strong style="font-size: 25pt; color: #faadad;">나의 매칭 정보</strong>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-8">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<i class="fa fa-comments fa-fw"></i>채팅내용
					</div>
					<div class="card-body1">
						<ul class="chat">
							
									<div id="chatdata"></div>
								
						</ul>
						<div class="panel-footer">
							<div class="input-group">
								<input type="hidden" id="sessionuserid"
									value="${sessionScope.user_id }"> <input id="message"
									type="text" class="form-control input-sm"
									placeholder="Type your message here..." /> <span
									class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="sendBtn">
										Send</button>
								</span>
								<div id="data"></div>
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
			<div class="row"></div>
		</div>
	</section>
	<hr>


	<c:import url="../../include/footer.jsp" />

	<script type="text/javascript">
	$(function() {
    $('#mainNav').css('background-color', '#faadad');
 });
</script>
</body>

</html>
