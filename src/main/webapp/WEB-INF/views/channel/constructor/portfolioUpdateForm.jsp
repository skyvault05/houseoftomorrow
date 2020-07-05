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

  <!-- bootstrap-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/bootstrap/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/plugins/jquery/jquery-3.4.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/common/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">

  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script >

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
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); } 
</script>
<script type="text/javascript">
  function check(){
	  
	  window.open("${pageContext.request.contextPath}/channel/constructor/payment/importApi","win","width=800,height=700");
  }
</script>
<style>
	h1{
		margin-left: 10%
	}
	#commTitle{
		margin-left: 10%;
		width: 20%;
		height: 10%
	}
	#commImg{
		margin-left: 10%;
	}
	#image_container{
		margin-left: 10%;
	}
</style>
  </head>
  
 
    <!-- END header -->
  <div class="empty-space"></div>
  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">회원정보수정</a>
					</li>
					<li class="nav-item">
						<a href="/myEstimateList/${user.memberNo }" class="nav-link" target="_self">견적 요청 내역</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">내 상담 내역</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">내가 쓴 글</a>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->

</div> 

<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->






<body>

<p>&nbsp; <p>&nbsp;
<div class="container">
<div class="row">
<form action="/notice/insert" method="post">
<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<div class="col-xs-12"><h1>제목</h1></div>

<div class="col-xs-12"><input type="text" style="min-height: 10px; height: 40px;" placeholder="${notice.noticeTitle}" class="form-control text-area-input" name="noticeTitle" id="noticeTitle"></div>

</div>
<p><br>

<div class="row"></div>
<div class="col-sm-2"><h1>내용</h1></div>
<div>
<div class="col-xs-12"><textarea style="min-height: 120px; height: 135.4px;" placeholder="${notice.noticeDescription}" class="form-control text-area-input" name="noticeDescription" id="noticeDescription">
</textarea></div>
</div>


<br>

<div class="row">
<div width="450" height="20" align="center"><b><span style="font-size:9pt;">
		<input type="submit" class="btn btn-outline-primary" value="수정하기"> <input type="reset" class="btn btn-outline-primary" value="다시쓰기"></span></b></div>
</div>
</div>
</form>


    
    
    

<hr>
<div class="container">

<div class="col-xs-11" align=right><span style="font-size:11pt;">&lt;<a href="${pageContext.request.contextPath}/notice/noticeList">리스트로 돌아가기</a>&gt;</span></div>

</div>
</body>


<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>


    <!-- scripts -->
<!-- 	<script src="/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="/plugins/jquery/jquery-3.4.1.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>
    
	<!-- ICON -->
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  </body>
</html>



















