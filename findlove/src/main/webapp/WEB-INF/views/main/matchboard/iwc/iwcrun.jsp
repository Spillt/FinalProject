<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>이상형 월드컵</title>
<link rel="stylesheet" href="/findlove/resources/css/animate.css">
<style>
	header.subhead {
		height: 76px
	}
	
	@media ( min-width :992px) {
		header.subhead {
			height: 123px
		}
	}

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
	
	.btn.iwc-inner-btn {
		border-radius: 2px;
		background-color: none;
	}
	
	span {
		font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif
	}
	
	.iwc-background {
		background: #ffffff;
		  background: -webkit-linear-gradient(-45deg, #FFE9E9 50%, #FED5D5 50%);
	}
	
	.iwc-nm, .iwc-nicknm {
		color: #f77070;
	}
	.iwc-nm {
		font-size: 15px;
	}
	
	.btn.btn-iwc-profile {
		color: #faadad;
		background-color: #fff;
		border-radius:0;
	}
	
</style>
</head>
<body id="page-top">
	<c:import url="../../../include/header.jsp" />
	<div class="container" style="min-height: 800px;">
		<header class="subhead"> </header>
		<div class="text-center" style="margin-bottom: 20px;"><h4 class="iwc-title" style="font-size: 30px; color: #faadad;">이상형 월드컵</h4></div>
		
		<div class="row justify-content-center align-items-center iwc-background" id="portfolio">
			<div class="col-12 text-center round-text"><span id="round-inner-text" style="background-color:#faadad; padding:8px; font-weight:bold; font-size:23px; color: #fff">${round}강전</span></div>
			<div class="col"></div>
			<div class="col-4 portfolio-item iwc-select-btn left-card animated bounceInLeft">
				<div class="portfolio-item-inner">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<div><img src="/findlove/resources/img/check-circle.png"></div>
							</div>
						</div> <img class="img-fluid iwc-img">
					</a>
					<div class="portfolio-caption">
						<h4 class="iwc-nicknm"></h4>
						<h5 class="iwc-nm"></h5>
					</div>
				</div>
			</div>
			<div class="col text-center versus-container">
				<h3 class="versus-text" style="color:#fff; font-weight: bold; margin-top: -20px">VS</h3>
			</div>
			
			<div class="col-4 portfolio-item iwc-select-btn right-card animated bounceInRight">
				<div class="portfolio-item-inner">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<div><img src="/findlove/resources/img/check-circle.png"></div>
							</div>
						</div> <img class="img-fluid iwc-img">
					</a>
					<div class="portfolio-caption">
						<h4 class="iwc-nicknm"></h4>
						<h5 class="iwc-nm"></h5>
					</div>
				</div>
			</div>
	<div class="col"></div>
	</div>
	</div>
	<c:import url="../../../include/footer.jsp" />
	<script type="text/javascript">
		var waitUser = new Array();
		var versusUser = new Array();
		var selectUser = new Array();
		var round = '${round}';
		var roundText = 1;
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
			initSetting();
			versusSetting();
			window.setTimeout( function(){
                $('.iwc-select-btn.left-card').removeClass('animated bounceInLeft');
                $('.iwc-select-btn.right-card').removeClass('animated bounceInRight');
            }, 1000);

			iwcClickEventBinding();
		});
			
		function initSetting() {
			var obj;
			<c:forEach items="${initIwcList}" var="iwc">
				obj = new Object();
				obj.user_id = '${iwc.user_id}';
				obj.user_nm = '${iwc.user_nm}';
				obj.user_nicknm = '${iwc.user_nicknm}';
				obj.picture_nm = '${iwc.picture_nm}';
				waitUser.push(obj)
			</c:forEach>
		}
		
		function versusSetting() {
			versusUser.push(waitUser.pop());
			versusUser.push(waitUser.pop());
			
			$('.left-card img.iwc-img').attr('src', '/findlove/uploadfiles/profile/'+versusUser[0].picture_nm);
			$('.left-card .iwc-nm').text(versusUser[0].user_nm);
			$('.left-card .iwc-nicknm').text(versusUser[0].user_nicknm);
			$('.right-card img.iwc-img').attr('src', '/findlove/uploadfiles/profile/'+versusUser[1].picture_nm);
			$('.right-card .iwc-nm').text(versusUser[1].user_nm);
			$('.right-card .iwc-nicknm').text(versusUser[1].user_nicknm);
		}
		
		function selectIdealUser(flag) {
			selectUser.push(versusUser[flag]);
			versusUser = [];
			if(waitUser.length == 0) {
				round = round/2;
				
				if(round == 2) {
					$('#round-inner-text').text('결승전');
				} else if(round != 1) {
					$('#round-inner-text').text(round+'강전');
				}
				if(round != 1) {
					waitUser = selectUser.slice(0);
					selectUser = [];
					versusSetting();
				}
				
			} else {
				versusSetting();
			}
		}
		
		function iwcClickEventBinding() {
			$('.iwc-select-btn').on('click', function() {
				$('.iwc-select-btn').off('click');
				if($(this).hasClass('left-card')) {
					$(this).addClass('animated flipOutY');
					$('.iwc-select-btn.right-card').addClass('animated zoomOutRight');
					window.setTimeout( function(){
						$('.iwc-select-btn.left-card').removeClass('animated flipOutY');
		                selectIdealUser(0);
		                if(round != 1) {
							$('.iwc-select-btn.right-card').removeClass('animated zoomOutRight');
		                	apperanceIwcSetting();
		                } else {
		                	selectUser.push(versusUser[0]);
		                	$('.versus-container').hide();
		                	$('.iwc-select-btn.right-card').hide();
		                	$('.iwc-select-btn.left-card').before('<div class="col"></div>');
		                	$('.iwc-select-btn.left-card').after('<div class="col"></div>');
		                	$('.iwc-select-btn.left-card').addClass('animated tada');
		                	$('#round-inner-text').text('우승자');
		                	$('.iwc-select-btn.left-card .portfolio-hover-content div').html('<button class="btn btn-iwc-profile" onclick="profileShortcut()">프로필 게시판 가기</button>');
		                }
		            }, 1000);
				} else {
					$(this).addClass('animated flipOutY');
					$('.iwc-select-btn.left-card').addClass('animated zoomOutLeft');
					window.setTimeout( function(){
						$('.iwc-select-btn.right-card').removeClass('animated flipOutY');
		                selectIdealUser(1);
		                if(round != 1) {
		                	$('.iwc-select-btn.left-card').removeClass('animated zoomOutLeft');
		                	apperanceIwcSetting();
		                } else {
		                	selectUser.push(versusUser[1]);
		                	$('.versus-container').hide();
		                	$('.iwc-select-btn.left-card').hide();
		                	$('.iwc-select-btn.right-card').before('<div class="col"></div>');
		                	$('.iwc-select-btn.right-card').after('<div class="col"></div>');
		                	$('.iwc-select-btn.right-card').addClass('animated tada');
		                	$('#round-inner-text').text('우승자');
		                	$('.iwc-select-btn.right-card .portfolio-hover-content div').html('<button class="btn btn-iwc-profile" onclick="profileShortcut()">프로필 게시판 가기</button>');
		                }
		            }, 1000);
				}
				console.log(waitUser);
				console.log(versusUser);
				console.log(selectUser);
				
			});
			
		}
		
		function apperanceIwcSetting() {
			$('.iwc-select-btn.left-card').addClass('animated bounceInLeft');
			$('.iwc-select-btn.right-card').addClass('animated bounceInRight');
			$('.round-text').addClass('animated fadeInDown');
			window.setTimeout( function(){
				$('.iwc-select-btn.left-card').removeClass('animated bounceInLeft');
				$('.iwc-select-btn.right-card').removeClass('animated bounceInRight');
				$('.round-text').removeClass('animated fadeInDown');
				iwcClickEventBinding();
			}, 1000);
		}
		
		function profileShortcut() {
			location.href = "openProfileDetail.do?user_nicknm=" + selectUser[0].user_nicknm;
		}
		
		/* $('.btn-iwc-profile').on('click', function() {
			location.href = "openProfileDetail.do?user_nicknm=" + waitUser[0].user_id;
		}); */
	</script>
	
</body>
</html>