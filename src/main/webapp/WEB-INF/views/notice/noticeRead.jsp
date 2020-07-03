<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>


<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>
<body>
<form>

<p>&nbsp; <p>&nbsp; <p>&nbsp;
<div class="container">
  
	<div class="row">
	
 	<div class="col-xs-12 col-sm-6 col-md-3">${notice.noticeNo}</div>
 	<div class="col-xs-12 col-sm-6 col-md-3">${notice.noticeTitle}</div>
	<div class="col-xs-12 col-sm-6 col-md-3">${notice.noticeDescription}</div>
	<div class="col-xs-12 col-sm-6 col-md-3">${notice.noticeRegdate} </div>
	</div>	
</div>
<p>&nbsp; <p>&nbsp;<p>
<div class="row">
<div class="col-xs-10" align=right><a href="${pageContext.request.contextPath}/notice/delete?noticeNo=${notice.noticeNo}">삭제하기</a>
 <div class="col-xs-11" align=right><a href="${pageContext.request.contextPath}/notice/noticeUpdate?noticeNo=${notice.noticeNo}">수정하기</a></div>
</div>
</div>
</form>
<hr>
<div class="row">
<div class="col-xs-11" align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/notice/noticeList">리스트로 돌아가기</a>&gt;</span></div>
</div>
</body>
</html>