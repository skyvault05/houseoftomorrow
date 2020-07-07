<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 폼</title>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
<script src="/plugins/bootstrap/bootstrap.min.js"></script>

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content"); 
		$(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader(header, token);
		});
	</script>
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
							alert("사용 가능한 아이디 입니다.");
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
						if(response == "possible"){
							phoneCheck=true;
							alert("사용 가능한 핸드폰 번호 입니다.");
						}else{
							alert("이미 사용중인 핸드폰 번호 입니다.");
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
				if($('#memberId').val()==""){
					alert('id를 확인하시오.');
					return false;
				}
				if($('#username').val()==""){
					alert('이름을 확인하시오.');
					return false;
				}
				if($('#password').val()==""){
					alert('비밀번호를 확인하시오.');
					return false;
				}
				if($('#passwordCheck').val()==""){
					alert('비밀번호를 확인하시오.');
					return false;
				}
				if($('#phone').val()==""){
					alert('전화번호를 확인하시오.');
					return false;
				}
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
<style>
	.checkSpan{
		color : red;
		display : none;
	}
</style>
</head>

<body>
	<div class="container">
		<div class="py-5 text-left">
			<h2>회원가입</h2>
		</div>
		<div class="col-md-12 order-md-1">
			<form class="needs-validation" novalidate action="/signup" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<input type="hidden" name="memberRoleNo" value="1">
				<div class="mb-3">
					<label for="email">이메일</label>
					<input type="text" id="memberId" name="memberId" class="form-control" placeholder="email (id@domain)">
					<input type="button" id="dupCheck" value="중복 체크">
				</div>
				<input type="hidden">
				<div class="mb-3">
					<label for="username">이름</label> 
					<input type="text" class="form-control" id="username" placeholder="Username" required name="memberName">
				</div>

				<div class="mb-3">
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" id="password" placeholder="비밀번호" value="" required name="memberPwd">
				</div>


				<div class="mb-3">
					<label for="password">비밀번호 확인</label> 
					<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인" value="" required name="memberPwdCheck"> 
					<span class="checkSpan">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div class="mb-3">
					<label for="phone">전화번호</label> 
					<input type="text" class="form-control" id="phone" placeholder="전화번호 (010-0000-0000)" value="" required name="memberPhone"> 
					<input type="button" id="phoneCheck" value="인증하기">
				</div>
				

				<!-- 				<div class="mb-3"> -->
				<!-- 					<label for="agree">약관동의</label> -->
				<!-- 					<table class="table table-border"> -->
				<!-- 						<td> -->
				<!-- 							 <hr>	 -->
				<!-- 							 <input type="checkbox" id="" value="option1"> 전체동의 <br> -->
				<!-- 							 <hr>	 -->
				<!-- 							 <input type="checkbox" id="" value="option2"> 만 14세 이상입니다.(필수)) <br> -->
				<!-- 							 <input type="checkbox" id="" value="option3"> 이용약관(필수) <br> -->
				<!-- 							 <input type="checkbox" id="" value="option4"> 개인정보처리방침(필수) <br> -->
				<!-- 							 <input type="checkbox" id="" value="option5"> 이벤트, 프로모션 알림 메일 및 SMS 수신(선택) <br> -->
				<!-- 						</td> -->
				<!-- 					</table> -->
				<!-- 				</div> -->

				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" id="signupBtn" type="submit">회원가입</button>
				<hr class="mb-4">
			</form>
		</div>
	</div>
</body>

</html>