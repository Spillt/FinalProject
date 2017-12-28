<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<style>
	
.modal-header {
	height: 220px;
	background-color: #faadad;
	box-shadow: 0 10px 20px 0 rgba(0,0,0,0.3);
	transition: box-shadow .25s;
	padding-bottom: 0 !important;
}

.modal-content, .modal-header, .modal-body {
	border: 0 !important;
	border-radius: 0 !important;
}
.modal-body {
	height: 440px;
}
.modal-content a {
	color: #fff;
	padding-bottom: 10px;
}
.modal-header h4 {
	color: #fff;
	margin-bottom: 0
}


.modal-header img {
	padding: 10px
}




.modal-body .modal-body-content {
		margin-top: 15px;
		height: 55px;
	  line-height: 1.42857143;
	    background-color: #fff;
	    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
	    transition: box-shadow .25s; 
}


.modal-body-content div.modal-body-content-label {
	background-color: #faadad;
	color: #fff;
	padding: 5px;
	width: 70px;
	    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
	    transition: box-shadow .25s; 
}

.modal-body-content div.modal-body-content-sublabel {
}

.modal-body .row {
	margin-left: auto;
	margin-right: auto;
}
.modal-body-content {
	padding: 0 !important;
}

.modal-body.hidden {
	display: none;
}

.profile-body-info {
	margin-top: 15px;
}

.profile-body-info .profile-body-label {
	color: lightgray;
	font-size: 12px;
}
.profile-body-info .profile-body-label h3 {
	color: #faadad;
}

.profile-body-label h3 span {
	color: lightgray;
	font-size: 12px;
}

.badge-hobby {
	background-color: #faadad;
	color: #fff;
	margin-left: 3px;
	margin-right: 3px;
}

.profile-body-info h5{
	color: #faadad;
}

.profile-body-label .material-icons {
	color: lightgray;
}

.badge-style {
	border: 2px solid #faadad;
	color: #faadad;
	margin-left: 3px;
	margin-right: 3px;
}

.modal-header-tab.tab-1:after {
  content: '';
  display: block;
  margin-top: 7px;
  border-bottom: 3px solid #fff;
  width: 0;
  position: absolute;
  right: 0;
  -webkit-transition: 0.5s ease;
  transition: 0.5s ease;
}

.modal-header-tab.tab-1.selected:after { 
  width: 100%; 
}

.modal-header-tab.tab-2:after {
  content: '';
  display: block;
  margin-top: 7px;
  border-bottom: 3px solid #fff;
  width: 0;
  position: absolute;
  left: 0;
  -webkit-transition: 0.5s ease;
  transition: 0.5s ease;
}

.modal-header-tab.tab-2.selected:after { 
  width: 100%; 
}

.profile-inner {
	height: 171px;
}

.carousel-indicators {
	margin-bottom: 2px;
}

.profile-picture {
	background-color: #11161e; 
	opacity: 0.8;
	display: none;
}

.profile-picture-btn.hidden {
	display: none;
}

span.badge-favorite {
	background-color: #fff;
	position: absolute;
	top:100px;
	left:270px;
}
	
.modal-tab a.modal-header-tab {
	cursor: pointer;
	color: #fff !important;
	white-space: nowrap;
	overflow: hidden;
}

.modal-body.profile-info {
	padding-top: 20px;
}

</style>
</head>
<body>
<div class="modal fade" id="userdetail">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<i class="material-icons modal-close" data-dismiss="modal" style="position:absolute">backspace</i>
				<i class="material-icons profile-picture-btn open" style="position:absolute; right: 15px;" data-toggle="tooltip" data-placement="bottom" title="사진 더보기">image</i>
				<div class="profile-main container-fluid text-center">
					<div class="profile-inner">
					<img id="picture_nm" class="img-fluid rounded-circle" src="/findlove/uploadfiles/profile/default.png" width="120px">
					<span class="badge badge-pill badge-favorite"><i class="material-icons" style="color: #ff5050; font-size:16px;">favorite</i><span id="favorite_cnt" style="margin-top:0px;" ></span></span>
						
					<h4 class="user_nm"></h4>
					<div class="row text-center justify-content-center">
						<div>
						<i id="star1" class="material-icons" style="color: #ffff99; font-size:17px;">star</i>
						<i id="star2" class="material-icons" style="color: #ffff99; font-size:17px;">star</i>
						<i id="star3" class="material-icons" style="color: #ffff99; font-size:17px;">star</i>
						<i id="star4" class="material-icons" style="color: #ffff99; font-size:17px;">star</i>
						<i id="star5" class="material-icons" style="color: #ffff99; font-size:17px;">star</i>
						</div>
						<span id="grade_avg" style="color: #fff; font-size:15px; margin-left:5px;"></span>
					</div>
						
					</div>
					<div class="row modal-tab">
							<a class="col"></a>
							<a class="col-4 text-center modal-header-tab tab-1 selected">기본 정보</a>
							<a class="col-4 text-center modal-header-tab tab-2">프로필 정보</a>
							<a class="col"></a>
					</div>
				</div>
				<div class="profile-picture container-fluid text-center h-100">
					<i class="material-icons profile-picture-btn close" style="position:absolute; right: 15px; color:#fff; opacity:1 !important">arrow_forward</i>
					<div id="profile" class="carousel slide h-100" data-ride="carousel" data-interval="false">
					
						<ul id="picture-indicator" class="carousel-indicators">
						</ul>
						<div id="picture-container" class="carousel-inner">
						</div>
						<a class="carousel-control-prev" href="#profile" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
						  </a>
						  <a class="carousel-control-next" href="#profile" data-slide="next">
						    <span class="carousel-control-next-icon"></span>
						  </a>
						</div>
				</div>
			</div>
			<div class="modal-body basic-info">
			
					<div class="modal-body-content row">
						<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">ID<div class="modal-body-content-sublabel">아이디</div></div>
						<div id="user_id" class="col text-center justify-content-center align-self-center"></div>
					</div>
				
					<div class="row">
						
						<div class="modal-body-content col-5 row">
								<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">NAME<div class="modal-body-content-sublabel">이름</div></div>
								<div class="col text-center justify-content-center align-self-center user_nm"></div>
						</div>
						<div class="col-1"></div>
						<div class="modal-body-content col-6 row">
								<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">NICK<div class="modal-body-content-sublabel">닉네임</div></div>
								<div id="user_nicknm" class="col text-center justify-content-center align-self-center"></div>
						</div>
					</div>
					<div class="modal-body-content row">
						<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">PHONE<div class="modal-body-content-sublabel">휴대폰</div></div>
						<div id="phone" class="col text-center justify-content-center align-self-center"></div>
					</div>
					<div class="modal-body-content row">
						<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">EMAIL<div class="modal-body-content-sublabel">이메일</div></div>
						<div id="email" class="col text-center justify-content-center align-self-center"></div>
					</div>

					
					<div class="row">
						<div class="modal-body-content col-6 row">
								<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">DATE<div class="modal-body-content-sublabel">가입일</div></div>
								<div id="enroll_dt" class="col text-center justify-content-center align-self-center"></div>
						</div>
						<div class="col-1"></div>
						<div class="modal-body-content col-5 row">
								<div class="text-center justify-content-center align-self-center modal-body-content-label h-100">RANK<div class="modal-body-content-sublabel">등급</div></div>
								<div id="rank_gb" class="col text-center justify-content-center align-self-center"></div>
						</div>
					</div>
					<hr>
					<div class="row">
						<i id="user_st_icon" class="material-icons state">lens</i>&nbsp;
						<div id="user_st" style="color:gray"></div>
					</div>
			</div>
			
			<div class="modal-body profile-info hidden">
				<div class="row profile-body-info">
					<div class="col"></div>
					<div class="col-3 text-center profile-body-label">나이<h3 id="age"></h3></div>
					<div class="col-3 text-center profile-body-label">키<h3 id="height"></h3></div>
					<div class="col-3 text-center profile-body-label">체형<h3 id="bodyform"></h3></div>
					<div class="col"></div>
				</div>
				
				<div class="row profile-body-info">
					<div class="col"></div>
					<div class="col-3 text-center profile-body-label">성별<h5 id="gender"></h5></div>
					<div class="col-3 text-center profile-body-label">혈액형<h3 id="blood_type"></h3></div>
					<div class="col"></div>
				</div>
				
				<div class="row profile-body-info">
					<div class="col"></div>
					<div class="col-4 text-center profile-body-label">지역<h5 id="area"></h5></div>
					<div class="col-3 text-center profile-body-label">학력<h5 id="achievement"></h5></div>
					<div class="col-3 text-center profile-body-label">종교<h5 id="religion"></h5></div>
					<div class="col"></div>
				</div>
				
				<div class="row profile-body-info">
					<div class="col"></div>
					<div class="col-3 text-center profile-body-label"><i class="material-icons">smoking_rooms</i><h5 id="smoking"></h5></div>
					<div class="col-3 text-center profile-body-label"><i class="material-icons">local_drink</i><h5 id="drinking"></h5></div>
					<div class="col"></div>
				</div>
				
				<div class="profile-body-info">
					<div class="text-center profile-body-label">스타일</div>
					<div class="row text-center">
						<div id="style" class="col-12">
						</div>
					</div>
				</div>
				
				<!-- <div class="profile-body-info">
					<div class="text-center profile-body-label">취미</div>
					<div class="row text-center">
						<div id="hobby" class="col-12">
						</div>
					</div>
				</div> -->
			</div>
			
		</div>
	</div>
</div>
<script>
$('a.modal-header-tab.tab-1').on('click', function() {
	$('a.modal-header-tab').removeClass('selected');
	$('a.modal-header-tab.tab-1').addClass('selected');
	$('.modal-body.profile-info').addClass('hidden');
	$('.modal-body.basic-info').removeClass('hidden');
	
});
$('a.modal-header-tab.tab-2').on('click', function() {
	$('a.modal-header-tab').removeClass('selected');
	$('a.modal-header-tab.tab-2').addClass('selected');
	$('.modal-body.basic-info').addClass('hidden');
	$('.modal-body.profile-info').removeClass('hidden');
});

$('.profile-picture-btn.open').on('click', function() {
	$('.profile-main').hide();
	$('.profile-picture').show('slide');
	$('.profile-picture-btn.open').addClass('hidden');
	$('.modal-close').hide();
});

$('.profile-picture-btn.close').on('click', function() {
	$('.profile-picture').hide('slide');
	$('.profile-main').show();
	$('.profile-picture-btn.open').removeClass('hidden');
	$('.modal-close').show();
});

function userDetailModal(thisObj) {
	$.ajax({
		url: "userdetail.do",
		type: "get",
		headers: {
			"Content-Type" : "application/json"
		},
		data: {"userId" : thisObj.attr('id')},
		success: function(responseData) {
			var detail = responseData.userDetail;
			
			if(detail.picture_nm == "") {
				$('#picture_nm').attr("src", "/findlove/uploadfiles/profile/default.png");
			} else {
				$('#picture_nm').attr("src", "/findlove/uploadfiles/profile/"+detail.picture_nm);
			}
			var star = Math.floor(detail.grade_avg);
			var halfstar = Math.round(detail.grade_avg-Math.floor(detail.grade_avg));
			for(var i=1; i <= 5; i++) {
				if(i <= star) {
					$('#star'+i).text('star');
				} else if(i == star+1) {
					if(halfstar == 1)
						$('#star'+i).text('star_half');
					else
						$('#star'+i).text('star_border');
				} else {
					$('#star'+i).text('star_border');
				}
				
			}
			$('#grade_avg').text(detail.grade_avg);
			$('#favorite_cnt').text(detail.favorite_cnt);
			$('#user_id').text(detail.user_id);
			$('.user_nm').text(detail.user_nm);
			$('#user_nicknm').text(detail.user_nicknm);
			$('#email').text(detail.email);
			$('#phone').text(detail.phone);
			$('#enroll_dt').text(detail.enroll_dt);
			switch(detail.user_st) {
			case '0' : $('#user_st_icon').css('color', '#66ccff'); $('#user_st').text('가입 승인 대기'); break;
			case '1' : $('#user_st_icon').css('color', '#99ff99'); $('#user_st').text('가입 승인 완료'); break;
			case '2' : $('#user_st_icon').css('color', '#ffff66'); $('#user_st').text('휴면 상태'); break;
			case '3' : $('#user_st_icon').css('color', '#ff5050'); $('#user_st').text('정지 상태'); break;
			case '4' : $('#user_st_icon').css('color', '#333333'); $('#user_st').text('삭제 대기'); break;
			}
			switch(detail.rank_gb) {
			case 'M': $('#rank_gb').text('관리자');break;
			case 'D': $('#rank_gb').text('DIAMOND');break;
			case 'P': $('#rank_gb').text('PLATINUM');break;
			case 'G': $('#rank_gb').text('GOLD');break;
			case 'S': $('#rank_gb').text('SILVER');break;
			case 'B': $('#rank_gb').text('BRONZE');break;
			}
			
			var profile = responseData.userProfile;
			if(profile != null) {
				$('a.modal-header-tab.tab-2').show();
				$('#age').text(profile.age);
				$('#height').html(profile.height+"<span>cm</span>");
				$('#bodyform').html(profile.bodyform);
				if(profile.gender == 'M') {
					$('#gender').text('남자');
				} else {
					$('#gender').text('여자');
				}
				
				$('#blood_type').html(profile.blood_type+"<span>형</span>");
				$('#area').text(profile.area);
				$('#achievement').text(profile.achievement);
				$('#religion').text(profile.religion);
				$('#smoking').text(profile.smoking);
				$('#drinking').text(profile.drinking);
				
				var stylelist = profile.style.split(",");
				var stylehtml = "";
				for(var i=0; i<stylelist.length; i++) {
					stylehtml += "<span class='badge badge-pill badge-style'>"+stylelist[i]+"</span>";
				}
				$('#style').html(stylehtml);
				/* 
				var hobbylist = profile.hobby.split(",");
				var hobbyhtml = "";
				for(var i=0; i<hobbylist.length; i++) {
					hobbyhtml += "<span class='badge badge-pill badge-hobby'>"+hobbylist[i]+"</span>";
				}
				$('#hobby').html(hobbyhtml); */
			} else {
				$('a.modal-header-tab.tab-2').hide();
				$('#age').text("");
				$('#height').text("");
				$('#bodyform').text("");
				$('#gender').text("");
				$('#blood_type').text("");
				$('#area').text("");
				$('#achievement').text("");
				$('#religion').text("");
				$('#smoking').text("");
				$('#drinking').text("");
				$('#style').text("");
				$('#hobby').text("");
			}
			var profilePicture = responseData.userPictureList
			if(profilePicture != null) {
								
				var pictureIndicatorHtml = "<li data-target='#profile' data-slide-to='0' class='active'></li>";
				var pictureHtml = "<div class='carousel-item active'><img class='h-100' src="+$('#picture_nm').attr('src')+"></div>";
				for(var i = 0; i < profilePicture.length; i++) {
					pictureIndicatorHtml += "<li data-target='#profile' data-slide-to="+i+"></li>";
					pictureHtml += "<div class='carousel-item'><img class='h-100' src=/findlove/uploadfiles/profile/"+profilePicture[i]+"></div>";
				}
				$('#picture-indicator').html(pictureIndicatorHtml);
				$('#picture-container').html(pictureHtml);
			}
			
			$('a.modal-header-tab').removeClass('selected');
			$('a.modal-header-tab.tab-1').addClass('selected');
			$('.modal-body.profile-info').addClass('hidden');
			$('.modal-body.basic-info').removeClass('hidden');
			$('.profile-picture').hide('slide');
			$('.profile-main').show();
			$('.profile-picture-btn.open').removeClass('hidden');
			$('.modal-close').show();
			
			$('#userdetail').modal();
		}
	});
}

$('.userdetail-btn').on('click', function() {
	userDetailModal($(this));
});
</script>
</body>
</html>