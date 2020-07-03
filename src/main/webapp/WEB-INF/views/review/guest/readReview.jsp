<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html>
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

<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 
	$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader(header, token);
	});

	$(document).ready(function() {
		$('.dropdown').hover(function() {
  		$(this).find('.dd-wrap').css("display","block");
  		$(this).find('.dropdown-menu').css("display","block");
		}, function() {
  		$(this).find('.dd-wrap').css("display","none");
  		$(this).find('.dropdown-menu').css("display", "none");
		});//end

	}); //end
	
	

</script> 


  </head>
 <body>

    
  
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->


<div class="container pt-5" >
<div class="py-5 text-left">


<div class="expert-calculate__main-wrap container">
	<div class="expert-calculate__main row">
 
		
		

		<!--start 견적폼-->
		<div class="expert-calculate__content">
		<p>
				
				
			<div>
			<div class="expert-user-form__form-group">
			<div class="expert-user-form__form-group__label" ><h3 >시공사 : ${review.channel.constructor.conName} </h3></div>
			<div class="expert-user-form__form-group__input">
			<div class="input-group telephone-input expert-review-form__telephone-input">
			</div>
			</div>
			</div>
			</div>
				
			
<p>


<div class="expert-user-form__form-group">
<div class="expert-user-form__form-group__label"><h5>평점</h5></div>
<div class="expert-user-form__form-group__description">인테리어 시공의 최종 퀄리티 평점</div>
<div class="expert-user-form__form-group__input">

<div class="container">
         <div class="starrating risingstar d-flex justify-content-center flex-row-reverse" >
            <c:choose>
            	<c:when test="${review.reviewGrade == 0}">
            		<label for="star1" title="1 star"></label>
            		
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
</div>

<div class="expert-user-form__form-group">
<div class="expert-user-form__form-group__label"><h5>총평</h5></div>
<div class="expert-user-form__form-group__description">인테리어 시공 전문가님의 서비스와 작업물 전반에 대하여 간단한 총평</div>
<br><h6>${review.reviewDescription}</h6>

</div>
</div>
</div>

<sec:authentication var="user" property="principal" />
<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose>
			<c:when test="${review.member.memberNo == user.memberNo}">
				<button class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/review/updateReviewform?reviewNo=${review.reviewNo}'" value="수정하기">수정하기</button>
				<button class="btn btn-outline-primary" type="button"  onclick="location.href='${pageContext.request.contextPath}/review/deleteReview?reviewNo=${review.reviewNo}'"  name="delete">삭제</button>
			</c:when>
		</c:choose>
	</sec:authorize>

</div>
</div>

</div>
<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>
<!-- start footer -->
    

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