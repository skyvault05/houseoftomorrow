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
	
	
	
}
   
</script>
<script>
 	
 /* 	$("button[name=delete]").click(function(){
 		confirm("정말 탈퇴하시겠습니까 ?");
 		var pwd = prompt("비밀번호를 입력하세요", "비밀번호입력란");
 		var id = $("#id").val();
 		location = "note?command=userWithdraw&password="+pwd+"&id="+id;
 		
 	}); */
 	
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
                    <label for="email">이메일 (email)</label>

                    <div class="input-group">
                        <div class="input-group-prepend">
                        	<input type="text" class="form-control"> @
                        	
                        	<input type="text" id="aaa" class="form-control" style="display: none;">
                        	<select id="mailselect" onchange="myFunction()" style="display: inline-block;">
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
				
				
				
				
				
				
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">회원정보 수정</button>
                <hr class="mb-4">
                
                <hr class="mb-5">
                <button type="button" name="back">처음으로</button>
                <hr class="mb-5">

                <footer th:replace="/fragments/semantic :: footer"></footer>
            </form>
        </div>

    </div>

</body>

</html>