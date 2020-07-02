<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="contractImg" class="col-md-12">
				
			</div>
			<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
				<div class="col-md-12">
					<form action="contractRegist" method="post" encType="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="consulNo" value="${param.consulNo}">
						<input type="file" name="file">
						<input type="submit" value="계약서 등록">
					</form>
				</div>
				<br>
				<br>
			</sec:authorize>
			<div class="col-md-12">
				<form action="contractUpdate" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="consulNo" value="${param.consulNo}">
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
							<input type="hidden" name="consulConDecide" value="2">
						</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_CONSTRUCTOR')">
							<input type="hidden" name="consulUserDecide" value="2">
						</sec:authorize>
					</sec:authorize>
					<input type="submit" value="수락하기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>