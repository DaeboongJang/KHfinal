<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>

   $(document).ready(function(){
      $("#header").load("/resources/header/header.jsp");
      $("#footer").load("/resources/footer/footer.jsp");
      $("#messageNotice").load("/resources/messageNotice/messageNotice.jsp");
   });
</script>
<title>상세보기</title>
<style>
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

/* 전체 컨테이너 */
.detailViewContainer {
	width: 900px;
	margin: auto;
}
/* 제목 */
h1 {
	color: #2d0174;
	font-weight: bold;
}

/* 게시글 헤더 영역 */
#titleBox {
	background-color: #f9f9f9;
	height: 50px;
	width: 100%;
	padding-top: 15px;
	border-radius: 5px;
	margin: 0%;
}
/* 팔로우 버튼 */
#follow {
	width: 25px;
	height: 25px;
	margin: 0px;
}

/* label 태그 */
label {
	font-weight: bold;
}

/* 내용 박스 */
#contentBox {
	width: 800px;
	padding: 0px;
	margin-left: 40px;
	margin-top: 30px;
}

/* 좋아요 */
#likes {
	width: 25px;
	height: 25px;
}

#likesBlack {
	width: 25px;
	height: 25px;
	border: none;
	color: red;
}

/* 댓글 영역 */
#replyHeader {
	background-color: #f9f9f9;
	border-radius: 5px;
	padding: 5px;
	margin-bottom: 10px;
	border-bottom: 1px solid lightgray;
}
/* 댓글 아이콘 */
#replyIcon {
	width: 25px;
	height: 25px;
}
/* 댓글 내용 */
#reply_content {
	width: 100%;
	overflow: hidden;
	resize: none;
	height: auto;
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

/* 신고 아이콘 */
#report {
	width: 25px;
	height: 25px;
	margin-top: 5px;
}

#report:hover {
	cursor: pointer;
}

/* 아이디 드롭다운박스 */
#dropdownMenu2 {
	margin-bottm: 20px;
	margin-left: 5px;
	padding: 0px;
	border: none;
}

#dropdownMenu2:hover {
	background-color: lightgray;
}

/* 좋아요 호버 */
#likes:hover {
	cursor: pointer;
}

/**/
</style>
</head>
<body>
	<div id="header"></div>

	<div class="detailViewContainer mt-5">
		<!-- ==================== 게시글 내용 ==================== -->
		<form id="modifyForm"
			action='${pageContext.request.contextPath}/board/modify.do?board_seq=${dto.board_seq}&re_board_seq=${dto.board_seq}'
			method="post">
			<div class="row">

				<div class="col-11 d-flex justify-content-start">
					<h3>
						<input type="text" id="title" name="title" value="${dto.title}"
							style="border: none;width:800px;" readonly>
					</h3>
				</div>
				<c:if test="${ loginSession.id != dto.writer_id }">
					<div class="col-1 d-flex justify-content-end">
						<img id="report" src="/resources/images/reportIcon.svg">
					</div>
				</c:if>
			</div>

			<div class="row" hidden>
				<input type="text" name="writer_id" value="${dto.writer_id}">
				<input type="text" name="writer_nickname"
					value="${dto.writer_nickname}"> <input type="text"
					name="category" value="${dto.category}"> <input type="text"
					name="secret" value="N"> <input type="password"
					name="secretPw" value="">
			</div>

			<div class="row d-flex justify-content-center" id="titleBox">
				<div class="col-2">
					<label>${dto.category}</label>
				</div>
				<div class="col-4">
					<c:choose>
						<c:when test="${ loginSession.id != dto.writer_id }">
							<label>작성자 : </label>
							<span class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button"
									id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
									${dto.writer_id}</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<button class="dropdown-item" type="button" id="sendMessage">쪽지쓰기</button>
								</div>
							</span>


						</c:when>
						<c:when test="${ loginSession.id == dto.writer_id }">
							<label>작성자 : </label>
							<a href="${pageContext.request.contextPath}/member/toMyPage.do"
								style="color: black;">${dto.writer_id}</a>
						</c:when>
					</c:choose>
					<c:if test="${ loginSession.id != dto.writer_id }">
						<a class="text-dark follow" style="text-decoration-line: none;">
							<img src="/resources/images/followPlusWhite.svg" id="follow">
						</a>
					</c:if>
				</div>
				<div class="col-4">
					<label>작성일 : </label> ${dto.written_date}
				</div>
				<div class="col-2">
					<label>조회 : </label> ${dto.view_count}
				</div>
			</div>

			<!-- 게시글 내용 -->
			<div class="row mt-3" id="summernoteBox">
				<div class="col-12 d-flex justify-content-center">
					<!-- <div class="click2edit" id="showBox">${dto.content}</div> -->

					<div id="summernote">${dto.content}</div>
					<textarea id="hiddenSummernote" name="content" hidden>${dto.content}</textarea>
					<input id="sys_name" name="sys_name" hidden>
				</div>
			</div>

		</form>


		<!-- 좋아요 영역 -->
		<div class="row-12 mt-3">
			<div class="col-12 d-flex justify-content-end">
				<a class="text-dark likes" style="text-decoration-line: none;">
					<img src="/resources/images/heartWhite.svg" id="likes">
				</a>
			</div>
		</div>

		<!-- ==================== 댓글 영역 ==================== -->
		<!-- 댓글 헤더 -->
		<div class="row mt-5" id="replyHeader">
			<div class="col-12">
				<img src="/resources/images/replyIconWhite(...).svg" id="replyIcon">
				<label>댓글</label>
			</div>
		</div>

		<!-- 댓글 출력 -->
		<div id="replyContainer"></div>


		<!-- 댓글 입력 -->
		<form id="replyForm" method="post">
			<div class="row">
				<div class="col-12 mt-2">
					<textarea id="reply_content" name="re_content" class="form-control"
						placeholder="댓글을 입력 해주세요"></textarea>
					<input type="text" id="reply_writer_id" name="reply_writer_id"
						value="${loginSession.id}" hidden> <input type="text"
						id="reply_writer_nickname" name="reply_writer_nickname"
						value="${loginSession.nickname}" hidden>
				</div>
				<div class="col-12 mt-2 d-flex justify-content-end">
					<button type="button" id="btnReplyConfirm" class="btn">등록</button>
				</div>
			</div>
		</form>

		<!-- 댓글 페이징 -->
		<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.get('needPrev') eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/detailView.do?currentPage=${naviMap.get('startNavi')-1}&board_seq=${dto.board_seq}&re_board_seq=${dto.board_seq}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${naviMap.get('startNavi')}"
							end="${naviMap.get('endNavi')}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/detailView.do?currentPage=${i}&re_board_seq=${dto.board_seq}&board_seq=${dto.board_seq}">${i}</a></li>
						</c:forEach>
						<c:if test="${naviMap.get('needNext') eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/detailView.do?currentPage=${naviMap.get('endNavi')+1}&board_seq=${dto.board_seq}&&re_board_seq=${dto.board_seq}">다음</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>

		<!-- 수정, 삭제, 목록으로 버튼 -->
		<div class="row mt-5">
			<div class="col-2 d-flex justify-content-start">
				<button type="button" id="btnGetList" class="btn">목록으로</button>
			</div>
			<c:if test="${ loginSession.id == dto.writer_id }">
				<div class="col-8 d-flex justify-content-end">
					<button type="button" id="btnModify" class="btn"
						onclick="modifySummernote()">글수정</button>
					<button type="button" id="btnModifyConfirm" class="btn"
						onclick="save()" style="display: none;">완료</button>
				</div>
				<div class="col-2 d-flex justify-content-end">
					<button type="button" id="btnDelete" class="btn">글삭제</button>
					<button type="button" id="btnModifyCancel" class="btn"
						onclick="cancel()" style="display: none;">취소</button>
				</div>
			</c:if>
		</div>
	</div>

	<!--푸터 css에는 foot으로 표기-->
	<div id="footer" class="mt-5"></div>

	<!-- 쪽지 알림 -->
	<div id="messageNotice"></div>

	<script>
   var a = $('#summernote');
   
     // 수정버튼
     var edit = function () {
         a.summernote({ focus: true });
         //a.summernote('code');
         modifySummernote();
     };
     
     // 수정 종료
     var save = function () {
         var markup = a.summernote('code');
         a.summernote('destroy');
     };
     
     // 수정 취소
     var cancel = function() {
        var markup = a.summernote('code');
         a.summernote('destroy');
        location.href = "${pageContext.request.contextPath}/board/detailView.do?board_seq=${dto.board_seq}&re_board_seq=${dto.board_seq}&currentPage=1";
     }
	
	//썸머노트 이미지 업로드
	function modifySummernote() {
		 $('#summernote').summernote({
			 	width: 800, 
				minHeight: 500,	// 최소높이
				maxHeight: null,	// 최대 높이
				focus: true,	// 에디터 로딩후 포커스
				lang: "ko-KR",
				callbacks: {
					onImageUpload : function(files, editor, welEditable){
						for(let file of files){
							console.log(file);
							sendFile(file,this);
							console.log("sendFile 함수로 이동");
					}
				}
			} 
		});
	}
	
	
	  // 썸머노트 이미지 업로드
		function sendFile(file){
			var data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${pageContext.request.contextPath}/files/SummerNoteImageFile",
				contentType : false,
				processData : false
			}).done(function(data){
				// 경로갑 출력
				$("#summernote").summernote("insertImage", data.path);
			}).fail(function(e){
				console.log(e);
			});				
		}
   
   // 팔로우 기능
   $(document).ready(function (e) {
            
   // 팔로우 있는지 확인한 값을 likesVal에 저장
        let followVal = "${follow.follow_count}";
        if(followVal > 0) {
            $("#follow").prop("src", "/resources/images/followPlusBlack.svg");
            $(".follow").prop('name', followVal)
        }
        else {
            $("#follow").prop("src", "/resources/images/followPlusWhite.svg");
            $(".follow").prop('name', followVal)
        }

   // 팔로우을 클릭 시 실행되는 코드
        $(".follow").on("click", function () {
            let that = $(".follow");
       $.ajax({
          url :"${pageContext.request.contextPath}/follow/insertFollow",
           type :"POST",
           data : {"follow_id":"${loginSession.id}", "follower_id":"${dto.writer_id}"},
          success : function(data){
             that.prop("name",data);
              if(data == 1) {
                    $("#follow").prop("src","/resources/images/followPlusBlack.svg");
              } else {
                       $("#follow").prop("src","/resources/images/followPlusWhite.svg");
              }
              }
       });
        });
    });
   
   // 좋아요 기능 영역
   $(document).ready(function () {
            
   // 좋아요가 있는지 확인한 값을 likesVal에 저장
        let likesVal = "${likes.likes_count}";
        // likesVal이 1이면 좋아요가 이미 되있는것이므로 heartBlack.svg를 출력하는 코드
        if(likesVal > 0) {
            $("#likes").prop("src", "/resources/images/heartBlack.svg");
            $(".likes").prop("name", likesVal)
        }
        else {
            $("#likes").prop("src", "/resources/images/heartWhite.svg");
            $(".likes").prop("name", likesVal)
        }

   // 좋아요 버튼을 클릭 시 실행되는 코드
       $(".likes").on("click", function () {
            let that = $(".likes");
       $.ajax({
          url :"${pageContext.request.contextPath}/likes/insertLikes",
           type :"POST",
           data : {"board_seq":"${dto.board_seq}", "likes_id":'${loginSession.id}'},
          success : function(data){
             that.prop("name",data);
              if(data == 1) {
                    $("#likes").prop("src","/resources/images/heartBlack.svg");
              } else {
                       $("#likes").prop("src","/resources/images/heartWhite.svg");
              }
              }
      	 });
        });
    });
   
   // 댓글 출력
   $(document).ready(function(){
      getReplyList();
   })
   function getReplyList(){
      let re_board_seq = "${dto.board_seq}";
      let board_seq = "${dto.board_seq}";
      let currentPage = "${currentPage}";
   
      $.ajax({
         url: "${pageContext.request.contextPath}/reply/getReplyList?re_board_seq=" + re_board_seq + "&currentPage=${naviMap.get('currentPage')}"
         , type : "get"
      }).done(function(data){
         // 기존 댓글을 비워주는 작업
         let replyList = data.replyList;
         $("#replyContainer").empty();
         for(let reply of replyList) {
            let replyBox = "<div class='row-12 mt-3 p-2' style='background-color:#f9f9f9; border-radius:5px;'>"
            + "<form class='modifyReplyForm'>" // id => class 로 바꿨음(에러 시 다시 id로)
            + "<div class='col-12'>작성자 : "
            + reply.reply_writer_id
            + "</div>"
            + "<div class='col-12'>"
            + "<input type='text' class='form-control' value='" + reply.re_content + "' name='" + reply.reply_seq + "' style='background-color:#f9f9f9; border:none;' readonly>"
            + "</div>"
            + "<div class='col-12 contentDiv-cmt'>작성일 : "
            + reply.reply_written_date
            + "</div>"
            + "</form>"
            + "</div></br>"
            // 댓글 동적 요소 추가
            $("#replyContainer").append(replyBox);
            
            // 댓글 수정 삭제 버튼
            // 세션에 담겨 있는 id와 댓글리스트 안의 reply_writer 와 같은 경우 버튼 생성
            if("${loginSession.id}" == reply.reply_writer_id) {
               let btns = "<div class='col-12 d-flex justify-content-end pd-5'>"
               + "<button type='button' class='btn btn-modifyReply' value='"+ reply.reply_seq +"' >수정</button>"
               + "<button type='button' class='btn btn-deleteReply' value='"+ reply.reply_seq +"' >삭제</button>"
               + "<button type='button' class='btn btn-modifyConfirm' value='"+ reply.reply_seq +"' style='display:none;'>확인</button>"
               + "<button type='button' class='btn btn-modifyCancel' value='"+ reply.reply_seq +"' style='display:none;'>취소</button>"
               + "</div>";
               
               // 가장 최근에 만들어진 댓글 옆에 버튼 추가
               $(".contentDiv-cmt:last").after(btns);
            }
         }
      }).fail(function(e){
         console.log(e);
      })
   }
   // 댓글 수정 버튼 클릭시
   $("#replyContainer").on("click", ".btn-modifyReply" , function(e){
      console.log($(e.target).val());
      $(".btn-modifyConfirm").show();
      $(".btn-modifyCancel").show();
      $(".btn-modifyReply").hide();
      $(".btn-deleteReply").hide();
      let reply_seq = $(this).val();
      console.log(reply_seq);
      $("input[name='" + reply_seq + "']").attr("readonly",false);
      $("input[name='" + reply_seq + "']").focus();
   })
   
   // 댓글 수정취소 버튼 클릭시
   $("#replyContainer").on("click", ".btn-modifyCancel" , function(e){
      console.log($(e.target).val());
      $(".btn-modifyConfirm").hide();
      $(".btn-modifyCancel").hide();
      $(".btn-modifyReply").show();
      $(".btn-deleteReply").show();
      let reply_seq = $(this).val();
      console.log(reply_seq);
      $("input[name='" + reply_seq + "']").attr("readonly",true);
   })
      
   // 댓글 수정(동적 댓글 생성후 클릭버튼 위임) 
   $("#replyContainer").on("click", ".btn-modifyConfirm" , function(e){
      console.log($(e.target).val());
      let data = $("#modifyReplyForm").serialize();
      let reply_seq = $(this).val();
      console.log(reply_seq);
      let re_content = $("input[name='" + reply_seq + "']").val();
      console.log(re_content);
      
      $.ajax({
         url : "${pageContext.request.contextPath}/reply/modifyReply?reply_seq="
               + reply_seq + "&re_content=" + re_content
         , type : "put"
         , data : re_content
      }).done(function(rs) {
         if (rs == "성공") {
            alert("댓글 수정이 완료 되었습니다.");
            getReplyList();
         } else if (rs == "실패") {
            alert("댓글 등록에 실패 했습니다.");
         }
      }).fail(function(e) {
         console.log(e);
      })
      
   })
   
   // 댓글 삭제
   $("#replyContainer").on("click", ".btn-deleteReply" , function(e){
      console.log($(e.target).val());
      let reply_seq = $(e.target).val();
      $.ajax({
         url : "${pageContext.request.contextPath}/reply/deleteReply?reply_seq="
               + reply_seq
         , type : "post"
      }).done(function(rs) {
         if (rs == "성공") {
            getReplyList();
         } else if (rs == "실패") {
            alert("댓글 삭제 에 실패 했습니다.");
         }
      }).fail(function(e) {
         console.log(e);
      })
      
   })
   
   // 댓글 등록 버튼
   $("#btnReplyConfirm").on("click",function(e) {
      e.preventDefault();
      
      // 게시글 번호
      let board_seq = "${dto.board_seq}";
      console.log(board_seq);
      
      let re_board_seq = "${dto.board_seq}";
      
      // 댓글 작성자(지금 로그인 한 ID)
      let loginId = "${loginSession.id}";
      
      // 게시글 작성자
      board_writer = "${dto.writer_id}";
      
      if($("#reply_content").val() == "") {
         alert("댓글을 입력 해주세요.");
         return;
      } else {
         // 게시글 등록 직렬화
         let data = $("#replyForm").serialize();
            $.ajax({
               url : "${pageContext.request.contextPath}/reply/insertReply?re_board_seq="
                     + re_board_seq + "&currentPage=1" + "&board_seq=" + board_seq,
               type : "post",
               data : data
            }).done(function(rs) {
               // 댓글 작성 성공시
               if (rs == "성공") {
                     
                  if (ws) { // socket이 연결이 되었다면
                     let replyData = [loginId, board_writer, board_seq];
                     
                     //websocket에 보내기! (reply, 댓글작성자,게시글작성자, 글번호)
                     /*let socketMsg = "[로그인 아이디] : " + loginId
                        + ", [게시글 작성자] : " + board_writer 
                        + ", [게시글 번호] " + board_seq;
                     */
                     let socketMsg = replyData;
                     
                     //let socketMsg = "<a href='#'>" + loginId + "</a>" 
                     //+ " 님이 " + "<a href='${pageContext.request.contextPath}/board/detailView.do?board_seq='" + board_seq + "'&curretPage=1>" 
                     //       + "</a>" + " 번 게시글에 댓글을 달았습니다."; 
                     
                     
                     //socket에 send를 해준다
                     ws.send(socketMsg);
               
                  location.href = "${pageContext.request.contextPath}/board/detailView.do?board_seq="
                     + board_seq + "&currentPage=1&re_board_seq=" + re_board_seq;
                  }
               // 댓글 작성 실패시
               } else if (rs == "실패") {
                  alert("댓글 등록에 실패 했습니다.");
               }
            }).fail(function(e) {
               console.log(e);
            })
      }
   })
   
   // 목록으로 버튼 클릭
   $("#btnGetList").on("click", function(){
      location.href = "${pageContext.request.contextPath}/board/toBoard.do?currentPage=1";
   })
   
   // 글삭제 버튼 클릭
   $("#btnDelete").on("click", function(){
      let chk = confirm("정말 삭제하시겠습니까?");
      let board_seq = "${dto.board_seq}";
         if (chk) {
            location.href = "${pageContext.request.contextPath}/board/delete.do?board_seq=" + board_seq;
         }
   })
   
   // 글수정 버튼 클릭
   $("#btnModify").on("click", function(){
      //$("#summernote").summernote.airMode = false;
      $("#btnModifyConfirm").css("display", false);
      $("#btnModifyConfirm").show();
      $("#btnModifyCancel").show();
      $("#btnModify").hide();
      $("#btnDelete").hide();
      $("#title").attr("readonly", false);
   })
   
   // 글수정 취소 버튼 클릭시
   $("#btnModifyCancel").on("click", function(){
      $("#btnModifyConfirm").css("display", false);
      $("#btnModifyConfirm").hide();
      $("#btnModifyCancel").hide();
      $("#btnModify").show();
      $("#btnDelete").show();
      $("#title").attr("readonly", true);
      $("#title").val("${dto.title}");
   })
   
   // 글수정 확인 버튼 클릭시
   $("#btnModifyConfirm").on("click", function(){
      // content 변수
      let hiddenSummernote = $("#hiddenSummernote");
      let content = $("#summernote").html();
      
      // content 출력
      //console.log("+html : ", content);
      console.log("content 값 : ", hiddenSummernote.html(content));
      
      // sys_name 추출 정규식
      let RexSys_name = /(?<=upload\\)\\*[\"']?([^>\"']+)[\']?[^">]/g;
      // content 정규식 적용
      let sysArr = hiddenSummernote.val().match(RexSys_name);
      let sys_name = $("#sys_name").val(sysArr);
      console.log("sys_name : ", sys_name);
      
      // 정규식 배열 출력
      /*for(let i=0; i<sysArr.length; i++) {
         console.log("sys_name 배열 : ", sysArr[i]);
      }*/
      for(let i=0; i<sys_name.length; i++) {
         console.log("sys_name 배열 : ", sys_name[i]);
      }

      // content값 확인
      console.log("히든썸머노트 값 : ", hiddenSummernote.val());
      
      $("#btnModifyConfirm").hide();
      $("#btnModify").show();
      $("#btnDelete").show();
      $("#btnModifyCancel").hide();
      
      $("#modifyForm").submit();
   })
   
   // 쪽지 보내기
   $("#sendMessage").on("click", function(){
      let writer_id = "${dto.writer_id}";
      let width = '450';
      let height = '500';
      let left = Math.ceil(( window.screen.width - width )/2);
      let top = Math.ceil(( window.screen.height - height )/2); 
      
      let url = "${pageContext.request.contextPath}/member/bnote.do?writer_id=" + writer_id;
      let name = "쪽지 보내기";
      let option = "width=" + width + ", height=" + height
         + ", left=" + left + ", top=" + top;
      window.open(url, name, option);
   })
   
   // 신고 팝업창
   // 게시글 신고
      $("#report").on("click", function(){
            let popupX = (document.body.offsetWidth / 2) - (400 / 2);
            let popupY= (window.screen.height / 2) - (500 / 2);
            let reported_person = "${dto.writer_id}";
            
            let url = "${pageContext.request.contextPath}/board/toReport.do?reported_person=" + reported_person;
            let name = "신고";
            let option = "width=400, height=480, top=popupY, left=popupX";
            window.open(url, name, 'status=no, height=480, width=400, left='+ popupX + ', top='+ popupY);
      })
   </script>

</body>
</html>