<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
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
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link href="/plugins/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="/plugins/summernote/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<style>
	h2{
		font-weight: bold;
		margin-left: 10%;
	}
	#qnaTitle{
		margin-left: 10%;
		width: 30%;
		height: 40px;
		font-size: 20px;
	}
	h3{
		font-weight: bold;
		margin-left: 10%;
	}
	select{
		margin-left: 10%;
		font-weight: bold;
		width: 20%;
		height: 40px;
		font-size: 20px;
	}
	input[type=submit]{
		margin-left: 10%;
	}
</style>

</head>
<body>
<h2>문의하기</h2>
<br><br>
<form action="${pageContext.request.contextPath}/qna/insert" method ="post">
	<input type="text" name="qnaTitle"  id="qnaTitle" placeholder="  올릴 문의글의 제목을 입력해주세요"/><p>
	<br>
	<h3>문의 카테고리 설정</h3>
	<select name="qnaCateNo">
		<option value="14">결제</option>
		<option value="15">환불</option>
		<option value="16">회원정보 변경</option>
		<option value="17">서비스 / 기타</option>
	</select><p>
	<br><br>
	<textarea id="summernote" name="qnaDescription"></textarea>
	<input type="hidden" name="parentNo" value=""/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>
	<br>
	<input type="submit"  value="등록하기"/>
</form>
<form method="post" action="${pageContext.request.contextPath}/">
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<input type="membNo" value="${user.memberNo}"/>
	<input type="chaNo" value=""/>
</form>
</body>
</html>