<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(document).ready(function(){
		$("#header").load("/resources/header/header.jsp");
		$("#footer").load("/resources/footer/footer.jsp");		
	});
</script>
<title>회원가입</title>
<style type="text/css">

/* 전체 컨테이너 */
.joinUsContainer {
	width: 500px;
	margin: auto;
}

a {
	text-decoration: none;
}

label {
	font-size: 10px;
	font-style: italic;
}

/* 버튼 */
.btn {
	background-color: #f9f9f9;
	color: gray
}

.btn:hover {
	background-color: gray;
	color: white;
}

#profileImg {
	width: 200px;
	height: 200px;
	border: 1px solid lightgray;
	border-radius: 50%;
	background-image: url("/resources/images/profile.svg");
	background-size: 100%;
	cursor: pointer;
}

#profileUpload {
	display: none;
}

#image_container {
	border: 1px solid lightgray;
	width: 110px;
	height: 110px;
	border-radius: 100%;
}

/* 마케팅 동의 박스 */
#marketingAgreement {
	font-size: 11px;
	width: 96%;
	margin-left: 12px;
	padding-left: 8px;
}

/* 개인정보 수집 동의 박스 */
#userAgreement {
	font-size: 11px;
	width: 96%;
	margin-left: 12px;
	padding-left: 8px;
	text-align: center;
}

/* 개인 정보 동의 박스 */
#userAgreement button {
	background-color: white;
	border: none;
	text-decoration: underline;
}

/* 개인 정보 이용 동의 내용*/
#agreementInfo {
	font-size: 9px;
	resize: none;
	height: 100px;
	display: none;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header"></div>


	<div class="joinUsContainer">
		<form action="${pageContext.request.contextPath}/member/joinus.do"
			id="JoinusForm" method="post" enctype="multipart/form-data">

			<!-- 해당 페이지 타이틀 -->
			<div class="row mb-5 mt-5">
				<div class="col d-flex justify-content-center">
					<h3>회원가입</h3>
				</div>
			</div>

			<!-- 프로필 사진 -->
			<div class="row mb-3">
				<label>프로필 사진</label>
				<div class="col-4 mt-1">
					<div id="image_container"></div>
				</div>
				<div class="col-8">
					<input type="file" class="form-control form-control-sm" name="file"
						onchange="setThumbnail(event);">
				</div>
			</div>
			<!-- 프로필 영역 끝 -->

			<!-- ID 영역 -->
			<div class="row mb-2">
				<label for="ID">아이디</label>
				<div class="col-8">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="" maxlength="20" required="required">
				</div>

				<div class="col-4">
					<button type="button" class="btn w-100" id="btnVerifyId">중복확인</button>
				</div>

				<div class="row mb-1">
					<div class="col" id="res_id"></div>
				</div>
			</div>

			<!-- ID 영역 끝 -->

			<!-- PW 영역 -->
			<div class="row mb-2">
				<label for="PW">비밀번호</label>
				<div class="col-12">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="" maxlength="20" required="required">
				</div>

				<div class="row mb-1">
					<div class="col" id="res_pw"></div>
				</div>
			</div>

			<div class="row mb-2">
				<label for="PW_confirm">비밀번호 재확인</label>
				<div class="col-12">
					<input type="password" class="form-control" id="confirmPw"
						maxlength="20" required="required">
				</div>

				<div class="row mb-1">
					<div class="col" id="res_confirmPw"></div>
				</div>
			</div>

			<!-- PW 영역 끝 -->

			<!-- Nickname 영역 -->
			<div class="row mb-2">
				<label for="Nickname">닉네임</label>
				<div class="col-8">
					<input type="text" class="form-control" id="nickname"
						name="nickname" placeholder="" maxlength="20" required="required">
				</div>

				<div class="col-4">
					<button type="button" class="btn w-100" id="btnVerifyNickname">중복확인</button>
				</div>

				<div class="row mb-1">
					<div class="col" id="res_nickname"></div>
				</div>
			</div>

			<!-- Nickname 영역 끝 -->

			<!-- E-mail 영역 -->
			<div class="row mb-2">
				<label for="E-mail">이메일</label>
				<div class="col-8">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="이메일" required="required">
				</div>

				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="btn w-100" id="btnVerifyEmail">이메일
						확인</button>
				</div>
			</div>

			<div class="row mb-2">
				<div class="col" id="res_email"></div>
			</div>

			<div class="row mb-2" id="certification_area" style="display: none;">
				<div class="col-8">
					<input type="text" class="form-control code_Input"
						placeholder="인증번호" disabled="disabled" maxlength="6"
						required="required">
				</div>

				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="btn w-100" id="btnCertificate_code">인증번호
						발송</button>
				</div>
			</div>

			<div class="row mb-2">
				<div class="col-4">
					<input type="text" class="form-control code_Input"
						placeholder="인증번호" disabled="disabled" maxlength="6"
						required="required" style="display: none;">
				</div>

				<div class="col-8" id="Res_Emailvalidation"></div>
			</div>
			<!-- E-mail 영역 끝 -->

			<!-- Address 영역 -->
			<div class="row mb-2 justify-content-center">
				<label for="Address">주소</label>
				<div class="col-6 d-flex justify-content-end">
					<input type="text" class="form-control" id="Postcode"
						name="Postcode" placeholder="(우편번호)">
				</div>

				<div class="col-6 d-flex justify-content-center">
					<button type="button" class="btn w-100"
						onclick="ExecDaumPostcode()">우편번호 찾기</button>
				</div>
			</div>

			<div class="row mb-2 justify-content-center">
				<div class="col">
					<input type="text" class="form-control" id="RoadAddress"
						name="RoadAddress" placeholder="도로명주소">
				</div>
			</div>

			<div class="row mb-2 justify-content-center">
				<div class="col">
					<input type="text" class="form-control" id="DetailAddress"
						name="DetailAddress" placeholder="상세주소">
				</div>
			</div>

			<div class="row mb-2 justify-content-center">
				<div class="col">
					<input type="text" class="form-control" id="Address" name="Address"
						style="display: none;" required="required">
				</div>
			</div>
		</form>
		<!-- Address 영역 끝 -->

		<div class="row">
			<div class="col-10 form-control mt-2 d-flex justify-content-center"
				id="marketingAgreement">
				마케팅/신제품정보 수신동의(SMS/E-MAIL) <input type="radio" id="yes" value="Y"
					name="agreement">Yes <input type="radio" id="no" value="N"
					name="agreement">No
			</div>
			<div class="col-10 form-control mt-2" id="userAgreement">
				<button type="button" id="btnUserAgreement">이용약관 개인정보 수집 및
					이용 동의</button>
				<input type="checkbox" id="checkAgreement" value="Y">
			</div>
			<div class="col-12">
				<textarea class="form-control mt-2" id="agreementInfo">
■ 개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.
o 개인정보보호담당자 및 책임자
성명 : Lucky Blue Smith
소속 : 전산팀
전화번호 : 02-512-0910
이메일 : info@205company.com
o 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.
o 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다." 
                </textarea>
			</div>
		</div>

		<!-- 가입, 취소 -->
		<div class="row justify-content-center mb-5 mt-3">
			<div class="col-6 d-flex justify-content-end">
				<button type="button" class="btn" id="btnSuccess">확인</button>
			</div>

			<div class="col-6 d-flex justify-content-start">
				<button type="button" class="btn" id="btnCancel">취소</button>
			</div>
		</div>

	</div>

	<!--푸터 css에는 foot으로 표기-->
	<div id="footer"></div>

	<script>
	<!-- script area -->
																			
	<!-- 아이디 -->
	/*__________ID__________*/
		let id = document.getElementById("id");
		let btnVerifyID = document.getElementById("btnVerifyId");
		let ResID = $("#res_id");

		//	regexID (통과하면 true, 실패면 false)
		function regexID() {
			const RegexID = /^[a-z0-9]{5,19}$/; //	ID는 영문 소문자, 숫자로 시작하며 6~20자 이내로 (영문 대문자 시작 불가능)

			return RegexID.test(id.value); //	ID의 값을 RegexID 정규식을 통해 통과면 true, 불통과면 false
		}

		//	ID 입력창을 벗어날 때 regex검사 (Verify 버튼과 겹침)
		id.onchange = function(e) {
			if (!regexID()) { //	RegexID에 위배되면 ID 결과창에 아래처럼 출력
				ResID.html("6~20자의 영문 소문자, 숫자만 사용가능 합니다.");
				ResID.css({
					"font-size" : "10px",
					"color" : "red"
				});

				id.value = ""; //	입력값 지움
			}
		}

		//	중복검사 클릭시 메서드
		btnVerifyID.onclick = function(e) {
			if (regexID()) {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/VerifyID.do",
					type : "post",
					data : {id : id.value}
				}).done(function(res) { //	res : result
					if (res == "Available") {
						ResID.html("멋진 아이디네요!");
						ResID.css({
							"font-size" : "10px",
							"color" : "green"
						});
						//	console.log(id.value);
						
						id.readOnly = "true";	//	잠금
						
					} else if (res == "Unavailable") {
						ResID.html("이미 사용중인 아이디입니다.");
						ResID.css({
							"font-size" : "10px",
							"color" : "red"
						});

					}
				}).fail(function(e) {
					console.log(e);
				});
				
			}
		}

	<!-- PW -->
		/*__________PW__________*/
		let pw = document.getElementById("pw");
		let ResPW = $("#res_pw");
		let PWconfirm = document.getElementById("confirmPw");
		let ResPWconfirm = $("#res_confirmPw");

		//	regexPW (통과 : true, 불통 : false)
		function regexPW() {
			const RegexPW = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/; //	PW는 영문 대.소문자, 숫자, 특수문자가 반드시 포함되어야 하고 8~20자 이내로.

			return RegexPW.test(pw.value);
		}

		//	PW입력창을 떠났을 때 Regex 검사
		pw.onchange = function(e) {
			if (!regexPW()) { //	RegexPW에 위배시 아래 출력
				ResPW.html("8~20자의 영문 대.소문자, 숫자, 특수문자를 사용하세요.");
				ResPW.css({
					"font-size" : "10px",
					"color" : "red"
				});

				pw.value = ""; //	값 지움

			} else if (regexPW()) { //	보안 단계
				if ((regexPW() == true && pw.value.length >= 8)
						&& (regexPW() == true && pw.value.length <= 10)) {
					ResPW.html("보안 : 낮음");
					ResPW.css({
						"font-size" : "10px",
						"color" : "yellow"
					});
					
				} else if ((regexPW() == true && pw.value.length > 11)
						&& (regexPW() == true && pw.value.length <= 13)) {
					ResPW.html("보안 : 중간");
					ResPW.css({
						"font-size" : "10px",
						"color" : "gray"
					});
					
				} else if ((regexPW() == true && pw.value.length > 14)
						&& (regexPW() == true && pw.value.length <= 20)) {
					ResPW.html("보안 : 강력");
					ResPW.css({
						"font-size" : "10px",
						"color" : "green"
					});
					
				}
			}
		}

		//	PW_Confirm 창에 값이 PW창에서 입력한 값과 일치하는지 여부 확인
		PWconfirm.onchange = function(e) {
			if (pw.value === PWconfirm.value) { //	엄격한 비교 : 값과 자료형이 둘다 일치하는가
				ResPWconfirm.html("비밀번호가 일치합니다.");
				ResPWconfirm.css({
					"font-size" : "10px",
					"color" : "green"
				});
				
				pw.readOnly = "true";
				PWconfirm.readOnly = "true";
				
			} else if (pw.value !== PWconfirm.value) {
				ResPWconfirm.html("비밀번호가 일치하지 않습니다. <br> 다시 입력하세요.");
				ResPWconfirm.css({
					"font-size" : "10px",
					"color" : "red"
				});

				PWconfirm.value = "";
			}
		}

	<!-- 닉네임 -->
		/*__________Nickname__________*/
		let nickname = document.getElementById("nickname");
		let btnVerifyNickname = document.getElementById("btnVerifyNickname");
		let ResNickname = $("#res_nickname");

		//	regexNickname (통과하면 true, 실패면 false)
		function regexNickname() {
			const RegexNickname = /^[a-zA-Zㄱ-힣0-9]{2,19}$/; //	Nickname는 영문 대.소문자, 한글, 숫자로 시작하며 6~20자 이내로
			return RegexNickname.test(nickname.value); //	Nickname의 값을 RegexNickname 정규식을 통해 통과면 true, 불통과면 false
		}

		//	Nickname 입력창을 벗어날 때 regex검사 (Verify 버튼과 겹침)
		nickname.onchange = function(e) {
			if (!regexNickname()) { //	RegexNickname에 위배되면 Nickname 결과창에 아래처럼 출력
				ResNickname.html("6~20자의 영문 대.소문자, 한글, 숫자를 사용하세요.");
				ResNickname.css({
					"font-size" : "10px",
					"color" : "red"
				});

				nickname.value = ""; //	입력값 지움
			}
		}

		//	중복검사 클릭시 메서드
		btnVerifyNickname.onclick = function(e) {
			if (regexNickname()) {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/VerifyNickname.do",
					type : "post",
					data : {nickname : nickname.value}
				}).done(function(res) { //	res : result
					if (res == "Available") {
						ResNickname.html("사용 가능한 닉네임입니다.");
						ResNickname.css({
							"font-size" : "10px",
							"color" : "green"
						});
						
						nickname.readOnly = "true";

					} else if (res == "Unavailable") {
						ResNickname.html("이미 사용중인 닉네임입니다.");
						ResNickname.css({
							"font-size" : "10px",
							"color" : "red"
						});
						
					}
				}).fail(function(e) {
					console.log(e);
				});
				
			}
		}
		
		/* Nickname 단점 : abc로 설정한 사람과 Abc로 설정한 사람이 다름 */

	<!-- 이메일 -->
		/*__________이메일__________*/
		let email = document.getElementById("email");	//	이메일 입력 input창
		let btnVerifyEmail = document.getElementById("btnVerifyEmail");	//	이메일 확인(중복검사) 버튼
		let btnCertificatecode = document.getElementById("btnCertificate_code");	//	인증번호 발송 버튼
		let ResEmail = $("#res_email");	//	이메일이 제대로 입력됐는지 확인을 알려주는 결과를 담아줄 변수
		let codeInput = $(".code_Input");	//	인증번호 입력 input창
		let code = "";	//	이메일 인증코드 저장을 위한 변수
		let ResEmailvalidation = $("#Res_Emailvalidation");	//	입력한 인증번호가 맞는지 틀린지 알려주는 결과를 담아줄 변수

		//	E-mail regex (정규식 문구 올바른지 검증 필요)
		function regexEmail() {
			const RegexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			return RegexEmail.test(email.value);
		}

		//	E-mail 입력창을 벗어났을 때 정규식 검사
		email.onchange = function(e) {
			if (!regexEmail()) {
				ResEmail.html("이메일이 정확하지 않습니다.");
				ResEmail.css({
					"font-size" : "10px",
					"color" : "red"
				});

				email.value = "";
			}
		}
		
		//	이메일 중복검사를 눌렀을때
		btnVerifyEmail.onclick = function(e) {
			if (regexEmail()) {
				$.ajax({
					url: "${pageContext.request.contextPath}/member/VerifyEmail.do", 
					type: "post", 
					data: {email : email.value}
				}).done(function(res) {
					console.log(res);
					
					if (res == "Available") {
						ResEmail.html("사용 가능한 이메일입니다.");
						ResEmail.css({
							"font-size" : "10px",
							"color" : "green"
						});
						
						$("#certification_area").fadeIn(1000);
						
						email.readOnly = "true";
						
						//btnCertificatecode.css("visibility", "visible");

					} else if (res == "Unavailable") {
						ResEmail.html("이미 사용중인 이메일입니다.");
						ResEmail.css({
							"font-size" : "10px",
							"color" : "red"
						});
						
					}
				}).fail(function(e) {
					console.log(e);
				});
				
			}
		}

		//	인증번호 발송을 눌렀을때
		btnCertificatecode.onclick = function(e) {
			if (regexEmail()) { //	regex를 통과해야 비로소 중복 검사 실행
				
				ResEmail.html("인증번호를 보냈습니다");
				ResEmail.css({
					"font-size" : "10px",
					"color" : "green"
				});
				
				$.ajax({
					url : "${pageContext.request.contextPath}/member/CertificateCode.do", 
					type : "post", 
					data : {email : email.value}, 
					success : function(data) {
						//	console.log("data : " + data);	//	인증번호 값이 잘 넘어왔나 확인
						
						codeInput.attr("disabled", false);	//	disabled를 풀어버림
						
						code = data;	//	코드를 담음
						console.log(code);
					}
				}).done(function(data) {
					//	console.log(data);
				}).fail(function(e) {
					console.log(e);
				});

			}
		}
		
		codeInput.change(function(e) {
			if (codeInput.val() === code) {
				ResEmailvalidation.html("인증번호가 일치합니다.");
				ResEmailvalidation.css({
					"font-size" : "15px",
					"color" : "green"
				});
				
				codeInput.attr("disabled", true);
				
			} else if (codeInput.val() !== code) {
				ResEmailvalidation.html("인증번호가 불일치합니다.");
				ResEmailvalidation.css({
					"font-size" : "15px",
					"color" : "red"
				});

			}
		});		

	<!-- 우편번호 -->
		/*__________Postcode__________*/
		let Postcode = document.getElementById("Postcode");
		let RoadAddress = document.getElementById("RoadAddress");
		let DetailAddress = document.getElementById("DetailAddress");
		
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function ExecDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("Postcode").value = data.zonecode;
					document.getElementById("RoadAddress").value = roadAddr;
				}
			}).open();
		}

	<!-- 가입, 취소 -->
		//	가입 (Registry)를 눌렀을 때 가입
		 document.getElementById("btnSuccess").onclick = function(e) {
         if (id.value === "" || !regexID()) {
            alert("아이디를 입력해주세요.");
            
            return;
         } else if (pw.value === "" || !regexPW()) {
            alert("비밀번호를 입력해주세요.");
            
            return;
         } else if (nickname.value === "" || !regexNickname()) {
            alert("닉네임을 입력해주세요.");
            
            return;
         } else if (email.value === "" || !regexEmail()) {
            alert("이메일을 입력해주세요.");
            
            return;
         } else if (Postcode.value == "" && RoadAddress.value == "") {
            alert("주소를 입력해주세요.");
            
            return;
         } else if (codeInput.val() == "") {
            alert("인증번호를 입력해주세요.");
            
            return;
         }else if ($("#yes:checked").val() !== "Y" && $("#no:checked").val() !== "N") {
                alert("마케팅 수신 동의를 체크 해주세요.");
             
                return;
         } else if ($("#checkAgreement:checked").val() !== "Y") {
                alert("개인정보 수집에 동의 해주세요.");
                
                return;
         } else if (!id.readOnly) {
            alert("아이디 중복확인을 해주세요.");
            
            return;
         } else if (!nickname.readOnly) {
            alert("닉네임 중복확인을 해주세요.");
            
            return;
         } else if (!email.readOnly) {
            alert("이메일 중복확인을 해주세요.");
            
            return;
         } else {
            document.getElementById("Address").value = Postcode.value + " " + RoadAddress.value + " " + DetailAddress.value;
            document.getElementById("JoinusForm").submit();
         }
      }

	
		//	취소 (Cancel)를 눌렀을때 로그인페이지로 되돌아감
		document.getElementById("btnCancel").onclick = function(e) {
			location.href = "${pageContext.request.contextPath}/";
		}
		
		// 프로필 사진 미리보기
		function setThumbnail(event) { 
			var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
			reader.onload = function(event) { // 파일 읽어들이기를 성공했을 때 호출되는 이벤트 핸들러
				let img = "<img src='"+event.target.result+"' width=110 height=110 />"; 
				$("#image_container").append(img); 
				}; 
			reader.readAsDataURL(event.target.files[0]); }
		
	    // 개인정보 수집 동의 클릭시 
        $(document).ready(function () {
            btnUserAgreement = $("#btnUserAgreement");
            agreementInfo = $("#agreementInfo");
            btnUserAgreement.click(function () {
                agreementInfo.toggle(
                    function () { agreementInfo.addClass("show") },
                    function () { agreementInfo.addClass("hide") }
                );
            });
        });
	
	
	</script>
</body>
</html>