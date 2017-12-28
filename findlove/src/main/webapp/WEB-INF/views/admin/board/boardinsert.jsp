<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
<link rel="stylesheet" type="text/css"
   href="/findlove/resources/css/pignose.calendar.css">
<style>
	.form-control.input-w-100 {
		width:100%;
	}
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<c:import url="./subheader.jsp" />
	<div class="container" style="min-height:500px;">
		<div class="row">
		
			<c:import url="./subnav.jsp" />
	        
	        <div class="col-md-9">
	        	<form action="boardinsert.do" id="boardWriteForm">
	        		<input type="hidden" name="boardNo" id="boardNo" value="0">
	        		<div class="row">
	        			<div class="col-3">
				        	<div class="form-group">
				        		<select class="form-control input-w-100" id="selectBoardType" name="boardType">
				        			<option>공지사항</option>
				        			<option>FAQ</option>
				        			<option>이벤트</option>
				        		</select>
				        	</div>
			        	</div>
			        	<div class="col-9">
			        		<div class="form-group">
			        			<input type="text" class="form-control input-w-100" id="title" placeholder="공지사항 제목" name="title">
			        		</div>
			        	</div>
	        		</div>
	        		<div class="row" id="faqType"  style="display:none">
		        		<div class="col-3">
			        		<div class="form-group">
			        			<select class="form-control input-w-100" id="selectFaqType" name="faqType">
			        				<option value="" disabled selected>카테고리</option>
				        			<option>계정</option>
				        			<option>결제</option>
				        			<option>게시판</option>
				        			<option>프로필</option>
				        			<option>매칭</option>
				        			<option>기타</option>
				        		</select>
			        		</div>
		        		</div>
	        		</div>
	        		<div class="form-group" id="boardContent">
	        			<textarea class="form-control input-w-100" rows="8" id="content" placeholder="공지사항 내용" name="content"></textarea>
	        		</div>
	        		<div id="eventAnswer" class="hidden" style="display:none">
	        			<div class="form-group">
	        				<input type="text" id="eventAnswer1" class="form-control input-w-100" placeholder="이벤트 답변 보기 1" name="eventAnswer1">
	        			</div>
	        			<div class="form-group">
	        				<input type="text" id="eventAnswer2" class="form-control input-w-100" placeholder="이벤트 답변 보기 2" name="eventAnswer2">
	        			</div>
	        			<div class="form-group">
	        				<input type="text" id="eventAnswer3" class="form-control input-w-100" placeholder="이벤트 답변 보기 3" name="eventAnswer3">
	        			</div>
	        			<div class="row">
	        				<div class="col-6">
		        			<div class="form-group">
		        				<input type="text" id="startDate" class="calendar form-control input-w-100" placeholder="시작일" name="startDate">
		        			</div>
		        			</div>
		        			<div class="col-6">
		        			<div class="form-group">
		        				<input type="text" id="endDate" class="calendar form-control input-w-100" placeholder="마감일" name="endDate">
		        			</div>
		        			</div>
	        			</div>
	        		</div>
	        		<input id="board-write-btn" type="submit" class="btn btn-primary float-right" value="등록하기">
	        	</form>
	        </div>
        </div>
	</div>
	
	<c:import url="../../include/footer.jsp" />

<script type="text/javascript" src="/findlove/resources/js/moment.latest.min.js"></script>
<script type="text/javascript" src="/findlove/resources/js/pignose.calendar.min.js"></script>
<script>
	$(function() {
		$('#mainNav').css('background-color', '#faadad');
		$('.card:first').addClass('selected');
		$('.list-group-item:first').addClass('selected');
		
		var dateObj = new Date();
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var day = dateObj.getDate();
		var today = year + "-" + month + "-" + day;
		
		$('.calendar').pignoseCalendar({
			
			format: 'YYYY-MM-DD',
			lang: 'ko',
			minDate: today,
		});
		<c:if test="${notice ne null}">
			$('#selectBoardType').not(":selected").attr("readonly", "readonly");
			$('#boardNo').val('${notice.notice_no}');
			$('#title').val('${notice.notice_title}');
			$('#content').val('${notice.notice_content}');
			$('#board-write-btn').val('수정하기');
			$('#boardWriteForm').attr('action', 'boardupdate.do');
		</c:if>
		<c:if test="${faq ne null}">
			$('#boardNo').val('${faq.faq_no}');
			$('#title').attr('placeholder','자주 묻는 질문');
			$('#content').attr('placeholder','자주 묻는 질문 답변');
			$('#eventAnswer').hide();
			$('#faqType').show();
			$('#boardContent').show();
			
			$('#selectBoardType option:eq(1)').attr('selected','selected');
			$('#selectBoardType').not(":selected").attr("readonly", "readonly");
			$('#title').val('${faq.faq_title}');
			$('#selectFaqType').val('${faq.faq_gb}')
			$('#content').val('${faq.faq_content}');
			
			$('#board-write-btn').val('수정하기');
			$('#boardWriteForm').attr('action', 'boardupdate.do');
		</c:if>
		<c:if test="${poll ne null}">
			$('#selectBoardType option:last').attr('selected','selected');
			$('#selectBoardType').not(":selected").attr("readonly", "readonly");
			$('#boardNo').val('${poll.poll_no}');
			$('#title').attr('placeholder','이벤트 질문');
			$('#boardContent').hide();
			$('#faqType').hide();
			$('#eventAnswer').show();
			
			$('#title').val('${poll.poll_title}');
			$('#eventAnswer1').val('${poll.answer1}');
			$('#eventAnswer2').val('${poll.answer2}');
			$('#eventAnswer3').val('${poll.answer3}');
			$('#startDate').val('${poll.start_dt}');
			$('#endDate').val('${poll.end_dt}');
			
			$('#board-write-btn').val('수정하기');
			$('#boardWriteForm').attr('action', 'boardupdate.do');
		</c:if>
	});
	
	$('#selectBoardType').on('change', function() {
		if($(this).val() == '공지사항') {
			$('#title').attr('placeholder','공지사항 제목');
			$('#content').attr('placeholder','공지사항 내용');
			$('#eventAnswer').hide();
			$('#faqType').hide();
			$('#boardContent').show();
		} else if($(this).val() == 'FAQ') {
			$('#title').attr('placeholder','자주 묻는 질문');
			$('#content').attr('placeholder','자주 묻는 질문 답변');
			$('#eventAnswer').hide();
			$('#faqType').show();
			$('#boardContent').show();
		} else {
			$('#title').attr('placeholder','이벤트 질문');
			$('#boardContent').hide();
			$('#faqType').hide();
			$('#eventAnswer').show();
		}
	});
</script>
</body>
</html>