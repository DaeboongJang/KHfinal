<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go 가자</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap')
	;

a {
	text-decoration: none;
}

.line_check {
	border: 1px solid black;
}

.font_nanum {
	font-family: 'Nanum Gothic', sans-serif,;
}

.nomal_font {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 13px;
}

.p_center {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: 700;
	font-size: 15px;
}

.p_right {
	text-align: right;
	margin: 0px;
	margin-right: 0px;
	padding: 0px;
	padding-right: 0px;
}

.p_left {
	text-align: left;
	margin: 0px;
	margin-left: 0px;
	padding: 0px;
	margin-left: 0px;
}

.margin_top_100 {
	margin-top: 100px;
}

.margin_top_50 {
	margin-top: 50px;
}

.margin_top_30 {
	margin-top: 30px;
}

.margin_top_20 {
	margin-top: 20px;
}

.margin_top_10 {
	margin-top: 10px;
}

.margin_top_5 {
	margin-top: 5px;
}

.margin_bottom_100 {
	margin-bottom: 100px;
}

.margin_bottom_50 {
	margin-bottom: 50px;
}

.margin_bottom_30 {
	margin-bottom: 30px;
}

.margin_bottom_20 {
	margin-bottom: 20px;
}

.margin_bottom_10 {
	margin-bottom: 10px;
}

.margin_bottom_5 {
	margin-bottom: 5px;
}

.main_logo_size {
	width: 120px;
}

.search_space {
	margin-top: 20px;
	margin-bottom: 10px;
}

.search_icon_img {
	width: 30px;
}

.main_search_bar {
	background-color: rgb(245, 245, 245);
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 13px;
}

.navi_text {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 13px;
}

.navi_category {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(70, 70, 70);
	font-size: 25px;
	font-weight: 700;
}

.socketBox {
	position: relative;
}

#socketAlert {
	position: fixed;
	display: none;
	z-index: 99;
	top: 0px;
	width: 100%;
	height: 50px;
	font-weight: bold;
	align-items: center;
}
</style>
</head>

<body>
	<div class="socketBox">
		<div id="socketAlert" class="alert alert alert-primary" role="alert">
		</div>
	</div>
	<!--메인 검색 창-->
	<div class="container">
		<div class="row search_space">
			<div class="col-1"></div>
			<div class="col-2">
				<p>
					<a href="${pageContext.request.contextPath}/"> <img
						class="main_logo_size" src="/resources/images/go_logo_type.png">
					</a>
				</p>
			</div>
			<div class="col-5">
				<input type="text" class="form-control main_search_bar"
					id="main_search" placeholder="가고싶은곳을 검색하세요. GO!">
			</div>
			<div class="col-1">
				<p class="p_left">
					<img class="search_icon_img"
						src="/resources/images/search_icon.png">
				</p>
			</div>
			<c:choose>
				<c:when test="${!empty loginSession}">
					<div class="col-3">
						<a href="${pageContext.request.contextPath}/member/toLogout.do">
							<span class="navi_text"> 로그아웃 </span>
						</a> &nbsp; &nbsp; <a
							href="${pageContext.request.contextPath}/member/toMyPage.do">
							<span class="navi_text"> 마이페이지 </span>
						</a> &nbsp; &nbsp; <span class="navi_text"> ${loginSession.id}
							님 </span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-3">
						<a href="${pageContext.request.contextPath}/member/toJoinus.do">
							<span class="navi_text"> 회원가입 </span>
						</a> &nbsp; &nbsp; <a
							href="${pageContext.request.contextPath}/member/toLogin.do">
							<span class="navi_text"> 로그인 </span>
						</a> &nbsp; &nbsp;
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>




	<!-- 검색창 아래 라인 -->
	<div class="container-fluid">
		<hr style="border: solid 2px lightgray">
	</div>




	<!-- 메인 메뉴-->
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-3">
				<a
					href="${pageContext.request.contextPath}/board/toBoard.do?currentPage=1">
					<h5 class="navi_category">여행 커뮤니티</h5>
				</a>
			</div>
			<div class="col-2">
				<a href="${pageContext.request.contextPath}/">
					<h5 class="navi_category">홈</h5>
				</a>
			</div>
			<div class="col-3">
				<a href="${pageContext.request.contextPath}/publicdata/toDetailList">
					<h5 class="navi_category">여행 정보</h5>
				</a>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<script>
		ws = new WebSocket("ws://192.168.219.101/reply");

		ws.onopen = function() {
			console.log("커넥션 오픈");

		};

		// 메세지 수신(알림)
		/*ws.onmessage = function(e) {
			console.log("ReceiveMessage", e.data + '\n');
			let socketAlert = $("#socketAlert");
			socketAlert.html(e.data);
			socketAlert.css('display', 'block');
			
			setTimeout(function() {
				socketAlert.css('display', 'none');
			}, 3000); 
		}*/

		// 메세지 수신
		ws.onmessage = function(e) {
			e.preventDefault();
			console.log(e.data);
			// JSON 데이터 불러오기
			let msgObj = JSON.parse(e.data);
			console.log(msgObj);

			// 변수 선언
			let socketAlert = $("#socketAlert");

			//socketAlert.append(msgObj.loginId + " : " + msgObj.message + " : " + msgObj.board_writer);

			// ReplyEndpoint 에서 받은 obj.addProperty 값을 seocketAlert에 출력
			socketAlert.html(e.data);
			socketAlert.fadeIn(1000);
			socketAlert.css('display', 'block');

			setTimeout(function() {
			socketAlert.css(
			'display', 'none'
			);
			}, 5000);
		}

		ws.onclose = function(e) {
			console.log("커넥션 닫힘");
			setTimeout(function() {
				connect();
			}, 1000);
		};

		ws.onerror = function(e) {
			console.log("커넥션 닫힘");
		};
		
		/*
		$("#btnSend").on("click", function(e) {
			e.preventDefault();
			if (socket.readyState !== 1)
				return;
			let msg = $("input#msg").val();
			socket.send(msg);
		});
		
		connect();
		*/ 
	</script>


</body>

</html>