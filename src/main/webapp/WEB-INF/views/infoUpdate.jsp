<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보수정 폼</title>
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
	
	
	
	/* 	$("button[name=delete]").click(function(){
		confirm("정말 탈퇴하시겠습니까 ?");
		var pwd = prompt("비밀번호를 입력하세요", "비밀번호입력란");
		var id = $("#id").val();
		location = "note?command=userWithdraw&password="+pwd+"&id="+id;
		
	}); */
	
}
   
</script>

   
</head>

<body>
    <div class="container">
        <div class="py-5 text-left">
           
            <h2>정보수정</h2>
            <button type="button" name="delete">탈퇴</button>
         
        </div>

        <div class="col-md-12 order-md-1">
            
            <form class="needs-validation" novalidate action="/signup" method="POST">


                <div class="mb-3">
                    <label for="email">이메일</label>

                    <div class="input-group">
                        <div class="input-group-prepend">
                        	<input type="text" class="form-control"> @
                        	
                        	<input type="text" id="aaa" class="form-control" style="display: none;">
                        	<select id="mailselect" onchange="myFunction()" style="display: inline-block;">
                        		<option>email</option>
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
                        <div class="invalid-feedback" style="width: 100%;"></div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="nickname">이름</label> 
                    <input type="text" class="form-control" id="nickname" placeholder="이름" required name="nickname">
                    
                </div>
                
                <div class="mb-3">
                    <label for="password">새비밀번호</label> 
                    <input type="password" class="form-control" id="password" placeholder="비밀번호 6자리 이상" value="" required name="user-password">
                </div>


                <div class="mb-3">
                    <label for="password">비밀번호 확인</label> 
                    <input type="password" class="form-control" id="real-name" placeholder="비밀번호 확인" value="" required name="user-password">
                </div>
                
                <div class="mb-3">
                    <label for="phone">폰번호</label>
                    <input type="text" class="form-control" id="phone" placeholder="010-0000-0000" required name="user-phone">
                </div> 	
		
               
                
		
				
				
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">회원정보 수정</button>
               	<button type="button" name="back">처음으로</button>
                <hr class="mb-4">
                
             

                <footer th:replace="/fragments/semantic :: footer"></footer>
            </form>
        </div>

    </div>

</body>

</html>