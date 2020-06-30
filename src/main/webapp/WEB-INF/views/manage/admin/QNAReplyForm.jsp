<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

<style>
	h2{
		margin-left: 10%;
	}
	#qnaTitle{
		margin-left: 10%;
		width: 30%;
		height: 40px;
		font-size: 20px;
	}
	input[type=submit]{
		margin-left: 10%;
	}
</style>
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
</head>
<body>
<h2>QNA 답글 입력</h2>
<br>
<form method="post" action="${pageContext.request.contextPath}/qna/insertReply">

<input type="hidden"  name="parentNo" value="${param.qnaParentNo}"/>
<input type="hidden" name="qnaCateNo" value="18"/>
<input type="text" name="qnaTitle"  id="qnaTitle" placeholder="  올릴 문의 답글의 제목을 입력해주세요"/><p>
<br><br>
<textarea id="summernote" name="qnaDescription"></textarea>
<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
<sec:authentication var="user" property="principal" />
<input type="hidden" name="membNo"  value="${user.memberNo}"/>
<br>
<input type="submit"  value="등록하기"/>
	
</form>

</body>
</html>