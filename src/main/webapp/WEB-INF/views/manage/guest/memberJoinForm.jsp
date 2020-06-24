<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 폼</title>
    <script src="plugins/jquery/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  	
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
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
	
	function myFunction(){
		var obj = document.getElementById('mailselect');
		var obj2 = document.getElementById('aaa');
		idCheck=false;
		if(obj.value==='person'){
			obj2.style.display = 'inline-block';
		} else {
			obj.style.display = 'inline-block';
			obj2.value = "";
			obj2.style.display = 'none';
		}
	}
	
	$(function(){
		$('#dupCheck').click(function(){//id체크
			$.ajax({
				url: "/idCheck",
				type: "post",
				dataType: "text",
				data: {
					memberId : $('#memberId').val(),
					domain : $('#aaa').val(),
					domainAuto : $('#mailselect').val()
				},
				success: function(response){
					if(response == "possible"){
						idCheck=true;
					}
				},
				error: function(e){
					alert(e);
				}
			});
		});

		$('#phoneCheck').click(function(){//폰 번호 체크
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
		
		$('#aaa').keyup(function(){
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
			if($('#mailselect').val()=="선택"){
				alert('id를 확인하시오.');
				return false;
			}
			if($('#mailselect').val()=="직접입력"){
				if($('#aaa').val()==""){
					alert('id를 확인하시오.');
					return false;
				}
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
		});
		
		$('#idRemember').change(function(){
			if($(this).prop("checked")){
				sessionStorage.setItem("id",$('#memberId').val());
			}else{
				sessionStorage.removeItem("id");
			}
		});
		
		$('#memberId').val(sessionStorage.getItem("id"));
		
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
					<div class="input-group">
						<div class="input-group-prepend">
							<input type="text" id="memberId" name="memberId" class="form-control"> 
							&nbsp;@&nbsp;
							<input type="text" id="aaa" name="domain" class="form-control" style="display: none;">
							<select id="mailselect" onchange="myFunction()" name="domainAuto" style="display: inline-block;">
								<option>선택</option>
								<option>naver.com</option>
								<option>hanmail.com</option>
								<option>nate.com</option>
								<option>gmail.com</option>
								<option value="person">직접입력</option>
							</select>
							<!-- <span class="input-group-text"></span>
                            <span class="input-group-text">@</span> -->
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="button" id="dupCheck" value="중복체크">
						</div>
					</div>
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
					<input type="text" class="form-control" id="phone" placeholder="전화번호" value="" required name="memberPhone"> 
					<input type="button" id="phoneCheck" value="인증하기">
				</div>
				
				<div class="mb-3">
					<input type="checkbox" id="idRemember"> id기억하기
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