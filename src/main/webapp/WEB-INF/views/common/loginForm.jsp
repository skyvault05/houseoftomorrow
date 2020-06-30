<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/common/common.css">

<script>
	$(function(){
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
<body>
<div class="container" style="margin-top:100px;">
<div class="row justify-content-center">
<h2>로그인</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>
</div>
<form class="row justify-content-center	" action="${pageContext.request.contextPath}/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div class="form-group col-md-6 align-self-center">
	<label for="email">ID</label>
	<input id="email" class="form-control" type="text" name="email">
	</div>
	<div class="w-100"></div>
	
	<div class="form-group col-md-6">
	<label for="password">Password</label>
	<input id="password" class="form-control" type=password name="password">
	</div>
	<div class="w-100"></div>
	
	<div class="form-group col-md-6">
	<label for="idRemember">id기억하기</label>
	<input id="idRemember" type="checkbox" id="idRemember"> 
	</div>
	<div class="w-100"></div>
	
	<div class="form-group col-md-6">
	<button>로그인</button>
	</div>
</form>
</div>
</body>
</html>