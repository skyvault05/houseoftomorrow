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
<script>

function myFunction(){
	var obj = document.getElementById('mailselect');
	var obj2 = document.getElementById('aaa');
	if(obj.value==='person'){
		obj2.style.display = 'inline-block';
	} else {
		obj.style.display = 'inline-block';
		obj2.style.display = 'none';
	}
	
	
	
}
   
</script>
   
</head>

<body>
    <div class="container">
        <div class="py-5 text-left">
           
            <h2>회원가입</h2>
         <!--  <p class="lead">회원가입하세요. 가입하면 게시판을 열람할 수 있습니다.</p> -->
        </div>

        <div class="col-md-12 order-md-1">
            
            <form class="needs-validation" novalidate action="/signup" method="POST">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            	<input type="hidden" name="memberRoleNo" value="1">
                <div class="mb-3">
                    <label for="email">이메일</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                        	<input type="text" name="memberId" class="form-control"> @
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
                    <input type="password" class="form-control" id="real-name" placeholder="비밀번호 확인" value="" required name="memberPwdCheck">
                </div>
                
                <div class="mb-3">
                    <label for="phone">전화번호</label> 
                    <input type="text" class="form-control" id="phone" placeholder="전화번호" value="" required name="memberPhone">
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
                <button class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
                <hr class="mb-4">
            </form>
        </div>
    </div>
</body>

</html>