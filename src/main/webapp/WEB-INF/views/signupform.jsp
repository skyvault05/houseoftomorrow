<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 폼</title>
    <link rel="stylesheet" type="text/css" href="/plugins/css/bootstrap.css">
   <!--  <link rel="stylesheet" type="text/css" href="/board.css"> -->
   
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


                <div class="mb-3">
                    <label for="email">이메일 (email)</label>
                    <p>8자 이상 입력해주세요.</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                        	<input type="text" class="form-control"> @
                        	
                        	<input type="text" id="aaa" class="form-control" style="display: none;">
                        	<select id="mailselect" onchange="myFunction()" style="display: inline-block;">
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
                    <!--     <input type="text" class="form-control" id="username" placeholder="Username" required name="user-id"> -->
                        <div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="password">비밀번호</label> 
                    <input type="password" class="form-control" id="password" placeholder="비밀번호" value="" required name="user-password">
                    <div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
                </div>


                <div class="mb-3">
                    <label for="password">비밀번호 확인</label> 
                    <input type="password" class="form-control" id="real-name" placeholder="비밀번호 확인" value="" required name="user-password">
                    <div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
                </div>
           

                <div class="mb-3">
                    <label for="nickname">별명</label> 
                    <input type="text" class="form-control" id="nickname" placeholder="별명(2자-15자)" required name="nickname">
                    <div class="invalid-feedback">좋아하는 별명을 입력하세요.</div>
                </div>
				
				
				<div class="mb-3">
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

                <footer th:replace="/fragments/semantic :: footer"></footer>
            </form>
        </div>

    </div>

</body>

</html>