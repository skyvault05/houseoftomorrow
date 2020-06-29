<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 폼</title>
    <script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
    <meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content"); 
		$(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader(header, token);
		});
	</script>
    
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
	<script src="/plugins/bootstrap/bootstrap.min.js"></script>

	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/addr/addr.js"></script>
	
<style>
#addrrow{
	padding-left:15;
	padding-right:15;
}
</style>
<script>
		var pwdCheck = false;
		var idCheck = false;
		var phoneCheck = false;
		function isEmail(asValue) {
	
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
	
		}
		// 핸드폰 번호 체크 정규식
	
		function isCelluar(asValue) {
			var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
	
		}
		
		$(function(){
			$('#dupCheck').click(function(){//id체크
				if(!isEmail($('#memberId').val())){
					alert("올바르지 않은 이메일 형식입니다.");
					return false;
				}
				$.ajax({
					url: "/idCheck",
					type: "post",
					dataType: "text",
					data: {
						memberId : $('#memberId').val()
					},
					success: function(response){
						if(response == "possible"){
							idCheck=true;
						}else{
							alert("중복된 아이디 입니다.");
						}
					},
					error: function(e){
						alert(e);
					}
				});
			});
	
			$('#phoneCheck').click(function(){//폰 번호 체크
				if(!isCelluar($('#phone').val())){
					alert("올바르지 않은 핸드폰 번호입니다.");
					return false;
				}
				$.ajax({
					url: "/phoneCheck",
					type: "post",
					dataType: "text",
					data: {
						memberPhone : $('#phone').val()
					},
					success: function(response){
						alert(response);
						if(response == "possible"){
							phoneCheck=true;
						}
					},
					error: function(e){
						alert(e);
					}
				});
			});
	
			$('#passwordCheck').keyup(function(){//비밀번호 체크
				if($('#password').val() == $(this).val()){
					$('span.checkSpan').hide();
					pwdCheck = true;
				}else{
					$('span.checkSpan').show();
					pwdCheck = false;
				}
			});
			
			$('#memberId').keyup(function(){
				idCheck=false;
			});
			
			$('#password').keyup(function(){
				if($('#passwordCheck').val() == $(this).val()){
					$('span.checkSpan').hide();
					pwdCheck = true;
				}else{
					$('span.checkSpan').show();
					pwdCheck = false;
				}
			});
			
			$('#phone').keyup(function(){
				phoneCheck=false;
			})
			
			$('#signupBtn').click(function(){
				if(!(idCheck && phoneCheck && pwdCheck)){
					if(!idCheck){
						alert("id를 확인해 주세요.");
					}else if(!phoneCheck){
						alert("전화번호를 확인해 주세요.");
					}else if(!pwdCheck){
						alert("비밀번호를 확인해 주세요.");
					}
					return false;
				}
			});
			
		});
	</script>
   
</head>

<body>
	<div class="container">
		 <form class="row" enctype="multipart/form-data" action="/conSignup" method="POST">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<div class="form-group col-md-12">
				<h1>회원 정보</h1>
				</div>
				<div class="form-group col-md-6">
                    <label for="memberId">이메일</label> 
                    <input type="email" class="form-control" id="memberId" placeholder="이메일" value="" required name="memberId">
                    <input type="button" id="dupCheck" value="중복 체크">
                </div>
                <div class="w-100"></div>
                <div class="form-group col-md-6">
                    <label for="password">비밀번호</label> 
                    <input type="password" class="form-control" id="password" placeholder="비밀번호" value="" required name="memberPwd">
                </div>


                <div class="form-group col-md-6">
                    <label for="memberPwdChk">비밀번호 확인</label> 
                    <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인" value="" required name="memberPwdChk">
                </div>
                
                <div class="col-md-6">
					<label for="phone">회원 연락처</label> 
                    <input type="text" class="form-control" id="phone" placeholder="회원 연락처" name="memberPhone" required>
                    <input type="button" id="phoneCheck" value="인증하기">
				</div>
           

                <div class="form-group col-md-6">
                    <label for="memberName">이름</label> 
                    <input type="text" class="form-control" id="memberName" placeholder="이름" required name="memberName">
                </div>		
                	
				<div class="form-group col-md-12">
				<h1>시공사 정보 입력</h1>
				</div>
				<div class="form-group col-md-6">
					<label for="conName">시공사명</label> 
                    <input type="text" class="form-control" id="conName" placeholder="시공사명" name="conName" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for="conPhone">시공사 연락처</label> 
                    <input type="text" class="form-control" id="conPhone" placeholder="시공사 연락처" name="conPhone" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for="conCareer">경력사항</label> 
                    <input type="text" class="form-control" id="conCareer" placeholder="경력사항 !기간을 입력해주세요." name="conCareer" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for='company'>사업자 여부</label><br>
					<input type="radio" id="company" name="conIsCompany" value="1" checked>
					<label for="company">사업자</label>
					<input type="radio" id="freelancer" name="conIsCompany" value="0">
					<label for="freelancer">프리랜서</label>
				</div>
				
				<div class="form-group col-md-6">
					<label for="conCertification">사업자 등록번호</label> 
                    <input type="text" class="form-control" id="conCertification" placeholder="사업자 등록번호" name="conCertification" required>
				</div>					
				<div id='addr' class="form-group col-md-6">
					<div class='container'>
						<div class='row'>
							<label class="col-md-4" for="postcode">주소</label>
							<div class="w-100"></div>
							<input type="text" class="form-control col-md-5" id="postcode" name="postcode" placeholder="우편번호" readonly>
							&nbsp;&nbsp;
							<button class="btn btn-info signBtn col-md-4" id="userAddrBtn" type="button">우편번호 찾기</button>
							<input type="text" class="form-control col-md-12" id="roadAddress" name="reaodAddress" placeholder="도로명주소" readonly>
							<input class="form-control col-md-4" id="extraAddress" name="extraAddress" type="text" readonly>
							<input class="form-control col-md-12" id="detailAddress" name="detailAddress" placeholder="상세주소" type="text">
						</div>
					</div>
				</div>					
				<div class="form-group col-md-12">
				<h1>시공사 채널 정보 입력</h1>
				</div>
				<div class="form-group col-md-6">
					<label for="chDescription">채널 설명</label> 
                    <input type="text" class="form-control" id="chDescription" placeholder="채널 설명" name="chDescription" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for="chImgFile">채널 대표 이미지</label> <br>
                    <input type="file" class="" id="chImgFile" placeholder="채널 대표 이미지" name="chImgFile" required>
				</div>
				<button class="btn btn-primary btn-lg btn-block" id="signupBtn" type="submit">회원가입</button>
			</form>
			<br><br>
		</div>




    
				
				<!-- div class="mb-3">
					<label for="agree">약관동의</label>
					
					<table class="table table-border">
						<td>
							 <hr>	
							 <input type="checkbox" id="" value="option1"> 전체동의 <br>
							 <hr>	
							 <input type="checkbox" id="" value="option2"> 만 14세 이상입니다.(필수)) <br>
							 <input type="checkbox" id="" value="option3"> 이용약관(필수) <br>
							 <input type="checkbox" id="" value="option4"> 개인정보처리방침(필수) <br>
							 <input type="checkbox" id="" value="option5"> 이벤트, 프로모션 알림 메일 및 SMS 수신(선택) <br>
						</td>
					
					</table>
					
				</div>
				
				
				
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">회원가입 완료</button>
                <hr class="mb-4">

                <footer th:replace="/fragments/semantic :: footer"></footer> -->
            

</body>
</html>