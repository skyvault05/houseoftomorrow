<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- bootstrap-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

<!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">  
     <link rel="stylesheet" href="/css/review/star.css">
	<!-- WebFont -->
	 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

	<!-- <script src="/plugins/bootstrap/bootstrap.min.js"></script> -->
	<link href="/plugins/summernote/summernote-lite.min.css" rel="stylesheet">
	<script src="/plugins/summernote/summernote-lite.min.js"></script>
	<script src="/plugins/summernote/setsummernote.js"></script>
	
	<!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
  <style>
    .row {
      margin-bottom: 10px;
    }
    [class|="col"] {
      background-color: transparent;
      background-image: none;
      border: 1px solid #eaeaed;
      height: 50px;
      font-size: 1em;
      line-height: 50px;
      text-align: center;
      color: black;
      font-weight: 700;
    }
    p.bg-info {
      font-weight: bold;
      padding: 10px;
      margin-right: -15px;
      margin-left: -15px;
    }
    
    
      
  </style>
</head>
<body>
 <sec:authentication property="principal" var="user"/>
<!-- ----------------------------------------------------------------------------->

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
	
	<!-- ------------------------------------------- -->
	<div class="self_write-wrap">
	
		<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="nav-link" target="_self">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/review/myReview/${user.memberNo}" class="nav-link" target="_self">리뷰</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/qna/myQNA/${user.memberNo}" class="nav-link" target="_self">Q&A</a>
					</li>
				</ul>
			</nav>
	
	</div>

</div> 
<!-- ----------------------------------------------------------------------------->




<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="container pt-5" >
<div class="py-5 text-left">
   <div class="row">
   
   <div class="alert alert-danger alert-dismissible" role="alert" >
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>내가 쓴 리뷰!</strong> 인테리어 시공 전문가님의 서비스와 작업물 전반에 대하여 내가 쓴 리뷰 입니다.
  </div>
	
   
   </div>
   <p>
   <p>
   <div class="row">
  
   <div class="col-md-4">리뷰 채널</div>
   <div class="col-md-4">평점</div>
   <div class="col-md-4">날짜</div>
   </div>
   
   <c:forEach items="${requestScope.list}" var="review" >
   
   <div class="row">
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}">${review.channel.constructor.conName}</a></div>
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}">${review.reviewGrade}</a></div>
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}"><fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></div>
   </div>
   </c:forEach>
   

   </div>
   
   </div>
   
   <!-- ------------------ -->
   
  
   
   

<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>


    <!-- loader -->
   
   <!--  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div> -->

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.waypoints.min.js"></script>
    <script src="/js/jquery.fancybox.min.js"></script>
     <script src="/js/review/star.js"></script>
    </script>
<!-- ICON -->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  </body>
</html>