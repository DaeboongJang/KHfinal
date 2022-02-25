<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
        $(document).ready(function () {
            $("#header").load("/resources/header/header.jsp");
            $("#footer").load("/resources/footer/footer.jsp");
            $("#messageNotice").load("/resources/messageNotice/messageNotice.jsp");
        });
    </script>
<title>쪽지보기페이지</title>
<style>
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

/* 전체 컨테이너 */
.noteContainer {
	width: 1200px;
	height: auto;
	margin: auto;
}

p {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(22, 22, 22);
	font-size: 15px;
}

.center {
	text-align: center;
}

.a_center a {
	text-align: center;
}

.title_text {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(22, 22, 22);
	font-size: 30px;
	text-align: center;
	font-weight: 700;
}

.color_white {
	color: white;
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
	margin-bottom: 50px;
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

.padding-top_50 {
	padding-top: 50px;
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

.mypage_text {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(70, 70, 70);
	font-size: 25px;
	font-weight: 700;
}

.mypage_right_line {
	border-right: 1px solid lightgray;
	height: 600px;
}

.mypage_profile_img {
	width: 100px;
	height: 100px;
	border-radius: 50px;
}

.mypage_right_margin {
	margin-left: 30px;
}

.mypage_comment {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: gray;
	font-size: 13px;
}

.mypage_board_text {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(70, 70, 70);
	font-size: 13px;
	text-align: center;
}

.mypage_board_title {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(70, 70, 70);
	font-size: 13px;
}

.my_board {
	padding-left: 20px;
}

.list_line2 {
	height: 1px;
	background-color: rgb(194, 194, 194);
	margin-left: 30px;
	padding-left: 30px;
}

.gab {
	margin-top: 50px;
}

/* 프로필 이미지 영역 */
#profileImgBox {
	border-radius: 100px;
	border: 1px solid black;
	width: 100px;
	height: 100px;
	padding: 0%;
	margin: 0%;
}

#profileImg {
	color: gray;
	width: 100%;
	height: 100%;
	border-radius: 100px;
	padding: 0%;
	margin: 0%;
}

/* ul 태그 영역 */
ul {
	list-style: none;
}

.ulList {
	margin-bottom: 5px;
}

.ulList>a {
	color: gray;
}

.ulList>a:hover {
	color: black;
}

/* 전체 버튼 */
.btn {
	background-color: #f9f9f9;
	color: gray;
	font-size: 13px;
	margin: 5px;
}

.btn:hover {
	background-color: gray;
	color: white;
}

/* 쪽지함 제목 이미지 */
#noteImg {
	width: 45px;
	height: 45px;
	margin-right: 10px;
}

/* 삭제 이미지 */
#deleteImg:hover {
	cursor: pointer;
}

/* 푸터 */
#footer {
	bottom: 0;
	grid-row-start: 2;
	grid-row-end: 3;
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<div id="header"></div>

	<!-- 검색창 아래 라인 -->
	<div class="noteContainer mb-5">
		<div class="row mt-5">
			<div class="col-12 d-flex justify-content-center">
				<img id="noteImg" src="/resources/images/letter.svg">
				<h3 class="mt-1">나의 쪽지함</h3>
			</div>
		</div>

		<div class="row mt-5">

			<!-- 마이페이지 왼쪽편 -->

			<div class="col-3 mypage_right_line">
				<div class="row d-flex justify-content-center mb-3">
					<c:if test="${loginSession.ori_name == null}">
						<div class="col-12" id="profileImgBox">
							<img class="mypage_profile_img" id="profileImg"
								src="/resources/images/profile.svg">
						</div>
					</c:if>
					<c:if test="${loginSession.ori_name != null}">
						<div class="col-12" id="profileImgBox">
							<img class="mypage_profile_img" id="profileImg"
								src="${pageContext.request.contextPath}/upload/${dto.getSys_name()}">
						</div>
					</c:if>

				</div>
				<div class="row">
					<div class="col-12 d-flex justify-content-center">
						<h5 style="color: gray;">${loginSession.id}</h5>
					</div>
				</div>

				<div class="row mt-5">
					<div class="col-12" style="margin-left: 30px;">
						<ul>
							<li class="ulList"><a
								href="${pageContext.request.contextPath}/member/toMyPage.do?id=${loginSession.id}">회원정보
									수정</a></li>
							<li class="ulList"><a
								href="${pageContext.request.contextPath}/board/toMyBoardList?id=${loginSession.id}&currentPage=1">나의
									게시글 확인</a></li>
							<li class="ulList"><a
								href="${pageContext.request.contextPath}/note/select_to_id.do?id=${dto.getId()}&currentPage=1">쪽지
									확인</a></li>
							<li class="ulList"><a
								href="${pageContext.request.contextPath}/member/note.do"
								onclick="window.open(this.href,'쪽지보내기','width=450, height=500');return false;">쪽지
									보내기</a></li>
						</ul>

					</div>

				</div>
			</div>

			<div class="modal">
				<div class="modal_body">
					<div>
						<h2>팔로워</h2>
					</div>
					<div>
						<table>
							<tbody>
								<c:if test="${!empty fList}">
									<c:forEach var="list" items="${fList}">
										<c:choose>
											<c:when test="${! empty f2List }">
												<c:forEach var="list2" items="${f2List}">
													<c:choose>
														<c:when
															test="${list.getFollow_id() eq list2.getFollower_id()}">
															<tr>
																<td>${list.follow_id}</td>
																<td>
																	<button type="button" class="followBtn"
																		value="${list.follow_id}">팔로우 취소</button>
																</td>
															</tr>
														</c:when>
														<c:otherwise>
															<tr>
																<td>${list.follow_id}</td>
																<td>
																	<button type="button" class="followBtn"
																		value="${list.follow_id}">팔로우</button>
																</td>
															</tr>
														</c:otherwise>

													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td>${list.follow_id}</td>
													<td>
														<button type="button" class="followBtn"
															value="${list.follow_id}">팔로우</button>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div>
			</div>


			<!-- 마이페이지 오른쪽 영역 -->
			<div class="col-9 mb-5">
				<div class="row">
					<div class="col-12">
						<table class="table">
							<thead>
								<tr>
									<th class="col-1"></th>
									<th class="col-2">보낸 사람</th>
									<th class="col-4">내용</th>
									<th class="col-2">보낸 날짜</th>
									<th class="col-3">선택</th>
								</tr>
							</thead>
							<tbody class="notebody">

							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-1" style="margin-left: 6px; padding-top: 0px;">
						<a id="deleteImg" onclick="deleteNoteSeq();"><img
							src="/resources/images/trash3.svg"></a>
					</div>
				</div>

				<div class="row">
					<div class="col-12 d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${naviMap.get('needPrev') eq true}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=${naviMap.get('startNavi')-1}">이전</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${naviMap.get('startNavi')}"
									end="${naviMap.get('endNavi')}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/note/select_to_id.do?id=${loginSession.id}&currentPage=${i}">${i}</a>
									</li>
								</c:forEach>
								<c:if test="${naviMap.get('needNext') eq true}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=${naviMap.get('endNavi')+1}">다음</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>



		</div>
	</div>

	<!--푸터 css에는 foot으로 표기-->
	<div id="footer"></div>
	<!-- 쪽지 알림 -->
	<div id="messageNotice"></div>

	<script>
	let arrCheck = new Array();	
	
        $(document).ready(function () {
            noteList();
        })
        
        // 쪽지 리스트 불러오기
        function noteList() {
            let currentPage = "${currentPage}";
            $.ajax({
                url: "${pageContext.request.contextPath}/note/getNoteList.do?to_id=${loginSession.id}&currentPage=" + currentPage
                , type: "get"
            }).done(function (data) {
                console.log(data);
                // 기존 댓글을 비워주는 작업
                let noteList = data.list;
                let naviMap = data.naviMap;
                $(".notebody").empty();
                if (noteList.length != 0) {
                	for (let note of noteList) {
                        let noteBox = "<tr>"
                        	+ "<td class='col-1'><input type='checkbox' name='noteCheck' class='noteCheckbox' value='"+note.note_seq+"'></td>"
                        	+ "<td class='col-2'>" + note.from_id + "</td>"
                            + "<td class='col-4'>" + note.content + "</td>"
                            + "<td class='col-2'>" + note.note_date + "</td>"
                            + "<td class='col-3'>"
                            + "<button type='button' class='btn deleteBtn' value='" + note.note_seq + "'>삭제</button>"
                            + "<button type='button' class='btn replyBtn' value='" + note.from_id + "'>답장</button></td>"
                            + "</tr>"
                        // 댓글 동적 요소 추가
                        $(".notebody").append(noteBox);

                    }
                } else {
                    let noteBox = "<td colspan='5' style='text-align:center;'>데이터가 없습니다.</td>"
                    $(".notebody").append(noteBox);

                }
            }).fail(function (e) {
                console.log(e);
            });
        }

		// 삭제 버튼 클릭시        
        $(document).on("click", ".deleteBtn", function (e) {
            console.log("a");
            let note_seq = $(e.target).val();
            let rs = confirm("정말 삭제하시겠습니까?");
            if (rs) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/note/deleteNote.do?note_seq=" + note_seq
                    , method: "get"
                }).done(function (data) {
                    if (data == "success") {
                        alert("삭제가 완료되었습니다.");
                        location.href = "${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=1";
                    } else {
                        alert("삭제에 실패하였습니다.");
                        location.href = "${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=1";
                    }
                }).fail(function (e) {
                    console.log(e);
                });
            }
        });

     // 쪽지 답장   
        $(document).on("click", ".replyBtn", function (e) {
            console.log("a");
            let from_id = "${loginSession.id}";
            let to_id = $(e.target).val();
            console.log(from_id + " : " + to_id);
            window.open("${pageContext.request.contextPath}/note/reply.do?from_id=" + from_id
                + "&to_id=" + to_id, "note", "width=450, height=500");
        });
        
     // checkbox 클릭 시 배열에 담기/빼기
        $(document).on("change", "input[name='noteCheck']", function(e){
        	console.log($(e.target).val());
        	console.log($(e.target).is(':checked'));
        	if($(e.target).is(':checked')){
        		arrCheck.push($(e.target).val());
        		console.log(arrCheck);
        		console.log(typeof(arrCheck));
        	}else {
        		for(let i=0; i < arrCheck.length; i++){
        			if(arrCheck[i] == $(e.target).val()){
        				arrCheck.splice(i, 1);
        				i--;
        			}
        			
        			console.log(arrCheck);
        		}
        	}
        });
        
     // 하단 삭제 버튼 클릭시
       	function deleteNoteSeq(){
       		let rs = confirm("정말 삭제하시겠습니까?");
            if (rs) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/note/checkDeleteNote.do"
                    , type: "get"
                    , data : {
                    	arrCheck : arrCheck
                    }
                }).done(function (data) {
                	console.log(data);
                    if (data == "success") {
                        alert("삭제가 완료되었습니다.");
                        location.href = "${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=1";
                    } else {
                        alert("삭제에 실패하였습니다.");
                        location.href = "${pageContext.request.contextPath}/note/select_to_id.do?to_id=${loginSession.id}&currentPage=1";
                    }
                }).fail(function (e) {
                    console.log(e);
                });
            }
       	};


    </script>
</body>

</html>