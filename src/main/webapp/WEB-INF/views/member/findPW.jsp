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
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<title>비밀번호 찾기</title>
<style type="text/css">
label {
   font-size: 10px;
}
</style>
</head>
<body>
   <div class="container">
      <form action="" method="post">
         <div class="row mb-5 justify-content-center">
            <div class="col d-flex justify-content-center">
               <h4>비밀번호 찾기</h4>
            </div>
         </div>

         <div class="row mb-2">
            <label for="아이디" class="form-label">아이디</label>
            <div class="col-8">
               <input type="text" class="form-control" id="id" name="id"
                  placeholder="아이디를 입력하세요." required="required">
            </div>

            <div class="col-4">
               <button type="button" class="btn btn-primary w-100" id="btnNext">다음</button>
            </div>
         </div>
         
         <div class="row mb-2 justify-content-center" style="display: none;" id="submit_area">
            <div class="col-6 d-flex justify-content-center">
               <button type="button" class="btn btn-primary" id="btnSubmit">임시비밀번호 발송</button>
            </div>
         </div>
         
         <div class="row mb-2 justify-content-center" style="display: none;" id="confirm">
            <div class="col-4 d-flex justify-content-center">
               <button type="button" class="btn btn-success" id="btnConfirm">확인</button>
            </div>
         </div>
      </form>
   </div>

   <script type="text/javascript">
      let id = document.getElementById("id");
      //   let email = document.getElementById("email");

      //   아이디 입력후 확인버튼을 눌렀을 때 이벤트 핸들러
      document.getElementById("btnNext").onclick = function(e) {
         if (id.value == "") {   //   아이디 입력창이 비어있으면
            alert("아이디를 입력하세요");
         
         } else if (id.value != "") {   //   비어있지 않으면, 입력한 아이디의 존재 유.무를 ajax로 처리 
            $.ajax({
               url: "${pageContext.request.contextPath}/member/ExistID.do", 
               type: "post", 
               data: {id : id.value}
            }).done(function(res) {
               if (res == "Exist") {
                  
                  //   임시비밀번호 창 활성화
                  $("#submit_area").fadeIn(1000);
                  
                  //   입력한 아이디 막기
                  id.disabled = true;
                  
                  console.log(id.value);   //   db에 존재하는 id만 나옴
                  
                  //   임시비밀번호 발송 창을 눌렀을때 이벤트 핸들러
                  document.getElementById("btnSubmit").onclick = function(e) {
                     $.ajax({
                        url: "${pageContext.request.contextPath}/member/temporaryPW.do", 
                        post: "post", 
                        data: {id : id.value}
                     }).done(function(data) {
                        console.log(data);   //   임시비밀번호를 확인
                        
                        alert("발송되었습니다.");
                        
                        $("#confirm").fadeIn(1000);
                        
                     }).fail(function(e) {
                        console.log(e);
                     });
                     
                  }
               } else if (res == "Nope") {
                  $("#submit_area").css("display", "none");
                  
                  alert("입력하신 아이디를 찾을 수 없습니다.");
                  id.value = "";
               }
            }).fail(function(e) {
               console.log(e);
            });
         
         }
      }
      
      $("#confirm").click(function(e) {
         window.close();
      })
   </script>
</body>
</html>