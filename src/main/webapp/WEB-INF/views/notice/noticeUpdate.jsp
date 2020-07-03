<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<p>&nbsp; <p>&nbsp;

<div class="container">
<div class="row">
<form name="insertForm"  method="post" action="${pageContext.request.contextPath }/notice/update" >
	<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-xs-2"><h1>제목</h1></div>
<div class="expert-user-form__form-group__input">
<input type="text" style="min-height: 10px; height: 40px;" placeholder="${notice.noticeTitle}" class="form-control text-area-input" name="noticeTitle" id="noticeTitle">
</div>
</div>

<div class="row">
<div class="col-xs-2"><h1>내용</h1></div>
<div class="expert-user-form__form-group__input">
<textarea style="min-height: 120px; height: 135.4px;" placeholder="${notice.noticeDescription}" class="form-control text-area-input" name="noticeDescription" id="noticeDescription">
</textarea>	
</div>
</div>
<div class="row">
<div width="450" height="20" align="center"><b><span style="font-size:9pt;">
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></div>
</div>
</div>	
</form>
<hr>
<div class="row">
<div class="col-xs-11" align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/notice/noticeList">리스트로 돌아가기</a>&gt;</span></div>
</div>
</body>
</html>