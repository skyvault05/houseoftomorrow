<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> inputForm </title>
<style>
span {
	width: 60px;
	display: inline-block;
}

textarea {
	width: 40%;
	height: 280px;
}
</style>
</head>
<body>
<h2> 결제페이지 </h2>

 	<form action="${pageContext.request.contextPath}/channel/constructor/payment/importApi" method="POST">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<p>
			<span>name:</span> <input name="name">

		
			값 가져오기
		</p>
		<p>
			<span>이메일:</span> <input name="email">
		</p>
		<span>폰넘버:</span>
		<p>
			<input type="text" name="phone">
		</p>
		<span>주소:</span>
		<p>
			<input name="address">
		</p>
		<span style="width:300px">결제금액 : 20000원 (예시)</span>
		<p>
			<input type="hidden" name="totalPrice" value="20000">
		</p>
		<input type="submit" value="결제하기"> <input type="reset"
			value="취소하기">
	</form>
 

</body>
</html>