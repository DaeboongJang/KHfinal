<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<title>쪽지 보내기</title>
<style>
* {
	box-sizing: border-box;
	font-size: 13px;
}

/* 전체 컨테이너 */
.container {
	width: 400px;
	height: 450px;
	margin: auto;
}

/* 제목 */
#msgTitle {
	text-align: center;
}

/* 족지 아이콘 */
#messageImg {
	width: 35px;
	height: 35px;
}

/* 내용 */
#content {
	height: 150px;
	resize: none;
}

/* 전체 버튼 */
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
	<div class="container">
		<form id="noteForm">
			<div class="row">
				<div class="col-12">
					<table class="table">
						<thead>
							<tr>
								<th id="msgTitle" colspan="2">
									<div class="row">
										<div class="col-5 d-flex justify-content-end">
											<img id="messageImg" src="/resources/images/envelope.svg">
										</div>
										<div class="col-7 d-flex justify-content-start"
											style="margin-top: 4px;">
											<h4>쪽지 보내기</h4>

										</div>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>From</td>
								<td><input type="text" id="from_id" name="from_id"
									class="form-control" value="${loginSession.id}" readonly>
								</td>
							</tr>
							<tr>
								<td>To</td>
								<td><select id="to_id" name="to_id" class="form-select">
										<option value="">선택</option>
										<c:forEach items="${list}" var="dto">
											<option value="${dto.id}">${dto.id}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea id="content" name="content"
										placeholder="내용을 입력하세요." class="form-control"></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="row">
										<div class="col-6 d-flex justify-content-end">
											<button type="button" id="submitBtn" class="btn">전송</button>
										</div>
										<div class="col-6 d-flex justify-content-start">
											<button type="button" id="btnCancel" class="btn">취소</button>
										</div>
									</div>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
	<script>
        document.getElementById("submitBtn").onclick = function () {
            let noteSubmit = $("#noteForm").serialize();
            $.ajax({
                url: "${pageContext.request.contextPath}/note/note.do",
                method: "post",
                data: noteSubmit
            }).done(function (data) {
                if (data == "success") {
                    alert("쪽지가 전송되었습니다.");
                    window.close();
                } else {
                    alert("쪽지 전송에 실패하였습니다.");
                    window.close();
                }
            }).fail(function (e) {
                console.log(e);
            });
        }

        // 취소 버튼 클릭
        $("#btnCancel").on("click", function () {
            window.close();
        })

    </script>

</body>

</html>