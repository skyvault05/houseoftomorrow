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



  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="/css/channel/channel.css">
<link rel="stylesheet" href="/css/review/star.css">

<link rel="stylesheet" href="/css/font/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/font/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

	
  <style>
  a {color:#424242;}
  .review_submenu_link {padding: 0px 10px; }
  /* .review_submenu_link, .review_link {color:#424242;}*/
  .review_submenu_link:hover{color:#33f0c0; transition: 0.2s; font-weight:bold;} 
  .row {
      margin-bottom: 10px;
    }
    [class|="col"] {
      background-color: transparent;
      background-image: none;
      border-top: 1px solid #eaeaed;
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
  .starrating > label:before {
    content: "\f005";
    margin: 1px;
    font-size: 1em;
    font-family: FontAwesome;
    display: inline-block;
    color: gold;
}
    
    
      
  </style>
</head>
<body>
 <sec:authentication property="principal" var="user"/>
<!-- ----------------------------------------------------------------------------->

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
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="nav-link" target="_self">내가 쓴 글</a>
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
						<a class="review_submenu_link" href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" target="_self">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a class="review_submenu_link" href="${pageContext.request.contextPath}/review/myReview/${user.memberNo}" target="_self">리뷰</a>
					</li>
					<li class="nav-item">
						<a class="review_submenu_link" href="${pageContext.request.contextPath}/qna/myQNA/${user.memberNo}" target="_self">Q&A</a>
					</li>
				</ul>
			</nav>
	
	</div>

</div> 
<!-- ----------------------------------------------------------------------------->




<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="container" >
<div class="py-4 text-left">
   <div class="row">
  
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
   <div class="col-xs-12 col-sm-4 "><a class="review_link" href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}">${review.channel.constructor.conName}</a></div>
   
   
   <div class="col-xs-12 col-sm-4 ">
   <div class="review_link">
   	<div class="starrating risingstar d-flex justify-content-center flex-row-reverse" >
            <c:choose>
            	<c:when test="${review.reviewGrade == 0}">
            		평점을 주지 않으셨습니다.. 0점
            		
            	</c:when>
            	<c:when test="${review.reviewGrade == 1}">
            		<label for="star1" title="1 star"></label>
            		
            	</c:when>
            	<c:when test="${review.reviewGrade == 2}">
            		<label for="star2" title="2 star"></label>
		            <label for="star1" title="1 star"></label>
		            
            	</c:when>
            	<c:when test="${review.reviewGrade == 3}">
            		<label for="star3" title="3 star"></label>
		            <label for="star2" title="2 star"></label>
		            <label for="star1" title="1 star"></label>
		            
            	</c:when>
            	<c:when test="${review.reviewGrade == 4}">
            		 <label for="star4" title="4 star"></label>
		            <label for="star3" title="3 star"></label>
		            <label for="star2" title="2 star"></label>
		            <label for="star1" title="1 star"></label>
		            
            	</c:when>
            	<c:when test="${review.reviewGrade == 5}">
            		<label for="star5" title="5 star"></label>
		            <label for="star4" title="4 star"></label>
		            <label for="star3" title="3 star"></label>
		            <label for="star2" title="2 star"></label>
		            <label for="star1" title="1 star"></label>
		            
            	</c:when>
            </c:choose>
        
   
   </div>
   </div>
   </div>
   
   
   
   <div class="col-xs-12 col-sm-4 "><a class="review_link" href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}"><fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></div>
   </div>
   </c:forEach>
   

   </div>
   
   </div>
   
   <!-- ------------------ -->
   
  
   
   

<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>



  </body>
</html>