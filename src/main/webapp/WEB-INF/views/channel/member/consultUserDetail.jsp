<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		
	})
</script>

</head>
<body>
	<h1>시공 상담, 이미 끝난 상담 조회</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				상담내용 주르르르르
			</div>
			<form action="consulting" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="memberNo" value="18">
				<input type="hidden" name="chNo" value="2">
				<input type="hidden" name="consulParentNo" value="1">
				<div class="col-md-12">
					<textarea id="summernote" name="consulDescription"></textarea>
				</div>
				<div class="col-md-2">
					<input type="submit" value="작성">
				</div>
			</form>
		</div>
	</div>	
</body>
</html>