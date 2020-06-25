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
<h2>로그인</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage}</span>
</c:if>

<form action="${pageContext.request.contextPath}/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div class="mb-3">
		<table style="width: 350px">
			<tr>
				<td width="70px">ID</td>
				<td><input type="text" name="email" size="30"></td>
				<td>
					<input type="checkbox" id="idRemember"> id기억하기
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type=password name="password" size="31"></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</div>
</form>

</body>
</html>