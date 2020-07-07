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
<!-- bootstrap-->
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link href="/plugins/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="/plugins/summernote/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  
  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
  
<style>
	h2{
		font-weight: bold;
	}
	#qnaTitle{
		height: 50px;
		font-size: 20px;
	}
	h3{
		font-weight: bold;
	}
	select{
		font-weight: bold;
		width: 20%;
		height: 40px;
		font-size: 20px;
	}
	.btn{
		width: 20%;
		height: 20%
	}
</style>

</head>
<body>
<div class="container">
<br><br>
<div class="row justify-content-center">
<h2>QNA 답글 수정</h2>
</div>
<div class="row"><br></div>
<form method="post" action="${pageContext.request.contextPath}/qna/update">
<input type="hidden"  name="qnaNo" value="${param.qnaNo}"/>
<input type="hidden"  name="parentNo" value="${qna.qnaParentNo}"/>
<input type="hidden" name="qnaCateNo" value="${qna.qnaCategory.qnaCategoryNo}"/>
	<input class="col-md-6" type="text" name="qnaTitle"  id="qnaTitle" value="${qna.qnaTitle}"/><p>
	<br><br>
	<textarea id="summernote" name="qnaDescription">${qna.qnaDescription}</textarea>
	<input type="hidden" name="parentNo" value=""/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>
	<br>
	<input class="btn btn-outline-primary" style="font-size:18px;" type="submit"  value="수정하기"/>
</form>
</div>

</body>
</html>