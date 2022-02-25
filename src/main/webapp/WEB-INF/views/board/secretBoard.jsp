<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>비밀번호 입력</title>
<style>
* {
	box-sizing: border-box;
	font-size: 13px;
}

/* 전체 컨테이너 */
.secretContainer {
	width: 250px;
	height: 300px;
	margin: auto;
}

/* 이미지 */
#secretImage {
	width: 150px;
	height: 150px;
	padding: 20px;
	fill: #c4c4c4;
	color: #c4c4c4;
}

/* 취소 버튼 */
.btn {
	background-color: #f9f9f9;
	color: gray
}

.btn:hover {
	background-color: gray;
	color: white;
}
</style>
</head>

<body>
	<div class="secretContainer">
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<img id="secretImage" src="/resources/images/lock.svg">
			</div>
			<div class="col-12 d-flex justify-content-center">
				<h5>보호되어 있는 글입니다.</h5>
			</div>
			<div class="col-12 d-flex justify-content-center">내용을 보시려면
				비밀번호를 입력 하세요.</div>
		</div>

		<form id="secretPassword" action="" method="post">
			<div class="row mt-2">
				<div class="col-12">
					<input type="password" id="secretPw" name="secretPw" class="form-control"
						placeholder="비밀번호" onkeyup="enterkey();">
				</div>
			</div>
		</form>

		<div class="row mt-2">
			<div class="col-6 d-flex justify-content-end">
				<button type="button" class="btn" id="btnSuccess" onkeyup="enterkey();">확인</button>
			</div>
			<div class="col-6 d-flex justify-content-start">
				<button type="button" class="btn" id="btnCancel">취소</button>
			</div>

		</div>
	</div>

	<script>
		// 팝업창이 열리면 password 인풋창에 포커스
		$("#secretPw").focus();
		
		// 확인 버튼 클릭
		$("#btnSuccess").on("click", function() {
			pwConfirm();
		});

		// 비밀번호 확인 함수
		function pwConfirm() {
			let data = $("#secretPassword").serialize(); // 댓글 form 안의 데이터 직렬화
			let board_seq = "${board_seq}";
			let re_board_seq = "${board_seq}";
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/board/secretBoard?board_seq="
						+ board_seq,
				data : data
				// 신고 하기 성공시	
				}).done(
				function(rs) {
					console.log("rs : " + rs);
					if (rs == "성공") {
						window.opener.location.href = "${pageContext.request.contextPath}/board/detailView.do?board_seq="
								+ board_seq + "&re_board_seq=" + re_board_seq + "&currentPage=1";
						window.close();
					} else if (rs == "실패") {
						alert("비밀번호를 다시 입력 해주세요.");
						return;
					}
					// 신고 하기 실패시	
				}).fail(function(e) {
			console.log(e);
		});
		}

		// 취소버튼 클릭
		$("#btnCancel").on("click", function() {
			self.close();
		});
	</script>
</body>

</html>