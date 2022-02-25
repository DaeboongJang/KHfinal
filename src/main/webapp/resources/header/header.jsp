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

.margin {
	margin-top: 20px;
}


#searchBtn {
	border: 0px solid white;
	background-color: rgba(0, 0, 0, 0);
	color: #white; ======= #
	travelCm: hover{ 
	cursor: pointer;
	
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
				<!-- <p class="p_left">
					<img class="search_icon_img"
						src="/resources/images/search_icon.png" id="search_icon_img">
				</p> -->
				<button type="button" id="searchBtn">
					<img class="search_icon_img"
						src="/resources/images/search_icon.png" id="search_icon_img">
				</button>
			</div>
			<c:choose>
				<c:when test="${!empty loginSession && loginSession.userType eq 0}">
					<!-- userType이 0일때 -->
					<div class="col-3">
						<a href="${pageContext.request.contextPath}/member/toLogout.do">
							<span class="navi_text"> 로그아웃 </span>
						</a> &nbsp; &nbsp; <a
							href="${pageContext.request.contextPath}/member/toMyPage.do?id=${loginSession.id}">
							<span class="navi_text"> 마이페이지 </span>
						</a> &nbsp; &nbsp; <span class="navi_text"> ${loginSession.id}
							님 </span>
					</div>
				</c:when>
				<c:when test="${loginSession.userType eq 2}">
					<!-- 2일때 -->
					<div class="col-3">
						<a href="${pageContext.request.contextPath}/member/toLogout.do">
							<span class="navi_text"> 로그아웃 </span>
						</a> &nbsp; &nbsp; <span class="navi_text"> <a
							href="${pageContext.request.contextPath}/admin/main.do?currentPage=1">
								<span class="navi_text"> 관리자페이지 </span>
						</a> &nbsp; &nbsp; <span class="navi_text"> ${loginSession.id}
								님 </span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-3">
						<!-- 비회원일때 -->
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
				<c:choose>
					<c:when test="${!empty loginSession}">
						<a
							href="${pageContext.request.contextPath}/board/toBoard.do?currentPage=1">
							<h5 class="navi_category">여행 커뮤니티</h5>
						</a>
					</c:when>
					<c:otherwise>
						<a onclick="toBoard();" id="travelCm">
							<h5 class="navi_category">여행 커뮤니티</h5>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-2">
				<a href="${pageContext.request.contextPath}/">
					<h5 class="navi_category">홈</h5>
				</a>
			</div>
			<div class="col-3">
				<a
					href="${pageContext.request.contextPath}/publicdata/toDetailList.do?currentPage=1">
					<h5 class="navi_category" id="bigData">여행 정보</h5>
				</a>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<div class="margin"></div>

	<script>
		ws = new WebSocket("ws://192.168.219.102/reply");

		ws.onopen = function() {
			console.log("커넥션 오픈");
		};

		// 메세지 수신
		ws.onmessage = function(e) {
			e.preventDefault();
			console.log(e.data);
			// JSON 데이터 불러오기
			let msgObj = JSON.parse(e.data);
			console.log(msgObj);

			// 변수 선언
			let socketAlert = $("#socketAlert");

			// ReplyEndpoint 에서 받은 obj.addProperty 값을 seocketAlert에 출력
			socketAlert.html(e.data);
			socketAlert.fadeIn(1000);
			socketAlert.css('display', 'block');

			setTimeout(function() {
			socketAlert.css('display', 'none');
			}, 5000);
		}

		ws.onclose = function(e) {
			console.log("커넥션 닫힘");
			setTimeout(function() {
				connect();
			}, 1000);
		};

		ws.onerror = function(e) {
			console.log("에러 : ", e);
			console.log("커넥션 닫힘");
		};

		// 게시판으로 이동
		function toBoard() {
			alert("로그인 후에 이용 가능 합니다.");
			return;
		}

	</script>

	<!-- Channel Plugin Scripts -->
	<script>

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "4aaaca92-fb66-477f-a5da-7f1a18d3782f"
  });
	<!-- End Channel Plugin -->

	</script>

	<script>
		$("#search_icon_img").on("click", function(){
			let main_search = $("#main_search").val()
			console.log(main_search);
			location.href = "${pageContext.request.contextPath}/mainSearch.do?main_search="+main_search+"&currentPage=1"
		})
	</script>
</body>

</html>