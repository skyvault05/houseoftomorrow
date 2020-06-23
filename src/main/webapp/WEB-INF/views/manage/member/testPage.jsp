<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>인증 성공</h1>
<form action="/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<button>로그아웃</button>
</form>
</body>
</html>