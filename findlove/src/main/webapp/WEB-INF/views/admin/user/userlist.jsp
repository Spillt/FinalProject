<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
header.subhead {
	height: 56px
}

@media ( min-width :992px) {
	header.subhead {
		height: 103px
	}
}

button.tab-btn {
	padding: 20px !important;
	margin: 5px !important;
	background-color: #faadad;
	border: 0
}

th {
	color: #faadad
}

button.tab-btn.selected {
	background-color: #f77070;
}

.material-icons.icons-detail {
	color: #faadad;
}
</style>
</head>
<body id="page-top">
	<c:import url="../../include/header.jsp" />
	<div class="container">
		<header class="subhead"> </header>

		<div class="tab">
			<h1>관리자 페이지</h1>
			<div class="text-center">
				<button onclick="window.location.href='userlist.do'" class="tab-btn selected">전체 회원 관리</button>
				<button onclick="window.location.href='registerlist.do'" class="tab-btn">가입 승인 관리</button>
				<button onclick="window.location.href='reporterlist.do'" class="tab-btn">신고 회원 관리</button>
			</div>
			<hr>
		</div>

		<div class="tab-content">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>사진</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th>등급</th>
						<th>비고</th>
						<th>상세</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a data-toggle="modal" data-target="#userdetail"><i
								class="material-icons icons-detail">more</i></a></td>

					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/1.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/3.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/1.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/3.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/1.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/3.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
					<tr>
						<td style="padding: 0"><img class="img-fluid"
							src="/findlove/resources/img/team/2.jpg" width="50px"></td>
						<td>chanwo1993</td>
						<td>남찬우</td>
						<td>쇼한샤</td>
						<td>chanwo1993@naver.com</td>
						<td>010-1234-5678</td>
						<td>2017.12.10</td>
						<td>Bronze</td>
						<td></td>
						<td><a href="#"><i class="material-icons icons-detail">more</i></a></td>
					</tr>
				</tbody>
			</table>
			<div class="modal fade" id="userdetail">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-body">

							<img class="img-fluid" src="/findlove/resources/img/team/3.jpg"
								width="200px">




						</div>
					</div>

				</div>

			</div>
		</div>
		
		
	</div>




	<%-- <c:import url="../include/footer.jsp" /> --%>

	<script type="text/javascript">
		$(function() {
			$('#mainNav').css('background-color', '#faadad');
		});

	</script>
</body>
</html>