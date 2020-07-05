<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>내일의 집</title>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
 
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>
 
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<script> 
function check(){
	  
	  window.open("${pageContext.request.contextPath}/channel/constructor/payment/importApi","win","width=800,height=700");
}

function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); } 
		
$(document).ready(function() {
		
document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);});
</script>
<style>
	#portTitle{
		height: 50px;
		font-size: 20px;
	}
</style>
  </head>
  
  <body>
  <sec:authentication property="principal" var="user"/>
    <header role="banner">
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand " href="/common/index">HOT</a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    
    <!--------------------------------------main menu--------------------------------------------->
          <div class="collapse navbar-collapse btnCollapse" >
            <ul class="navbar-nav ">
              <li class="nav-item dropdown pl-md-5">
              <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">커뮤니티 </a>
             <div class="dd-wrap">
              <ul class="dropdown-menu"  aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#" >커뮤니티홈</a></li>
                <li><a class="dropdown-item" href="#">사진</a></li>
                <li><a class="dropdown-item" href="#">집들이</a></li>
                <li><a class="dropdown-item" href="#">노하우</a></li>
              </ul>
              </div>
            </li>
</ul></div>

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
  
</head>
<body>
<div class="container">
<br><br>
<div class="row justify-content-center">
<h2>포트폴리오 등록</h2>
</div>
<br><br>
<div class="container">
<form name="portForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/channel/constructor/insertPort" >
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>
	<input type="hidden" name="chNo"  value="${user.chNo}"/>
	<input class="col-md-8" type="text" name="portTitle"  id="portTitle" placeholder="올릴 포트폴리오의 제목을 입력해주세요"/><p>
	<br>
	 <div class="rows" >
	 <p style="font-size: 18px;">
	 시작일 :&nbsp;&nbsp;<input  class="col-md-3"  type="date" id='currentDate'  min='currentDate' name="portStartDate">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	 마감일 :&nbsp;&nbsp;<input  class="col-md-3" type="date" name="portEndDate">
  	 </p>
  	 </div>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<textarea id="summernote" name="portDescription"></textarea> <p>
	<div class="rows col-md-6">
		<p style="font-size: 18px;">썸네일:	<input type="file" name="file"  id="portImg" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(event);">
		<div class="col-md-4" id="image_container"></div></p>
	</div>
	<br>
	<!-- <input type="submit" value="등록하기">  -->
	
	<c:choose>		
    	<c:when test="${fn:length(portList) >= 2}">	
			<button class="btn btn-outline-primary"  type="button" onclick="check()"> 결제하기(등록)</button>
		</c:when>
		<c:otherwise>
			 <input class="btn btn-outline-primary col-md-3" style="font-size: 18px"  type="submit"  value="등록하기"/>
		</c:otherwise>
	</c:choose>
</form>
</div>
</body>
</html>
