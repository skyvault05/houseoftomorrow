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
<style>

</style>

  </head>
  <body>

    
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
<div class="container pt-5" >
<div class="py-5 text-left">


<form class="expert-calculate" novalidate action="${pageContext.request.contextPath}/review/updateReview" method="post">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 <input type="hidden" name="memberNo" value="${user.memberNo}">
 <input type="hidden" name="chaNo" value="1"><!-- 여기 꼭 value 값 바꿔야된다. -->
 <input type="hidden" name="reviewNo" value="${param.reviewNo}"/>
 <input type="hidden" name="reviewRegdate" value="${review.reviewRegdate}"/>
<div class="expert-calculate__main-wrap container">
	<div class="expert-calculate__main row">
		
		

		<!--start 견적폼-->
		<section class="expert-calculate">
				
				
			
			<div>
			<div class="expert-user-form__form-group">
			<div class="expert-user-form__form-group__label"><h3> [ ${review.channel.constructor.conName} ]  시공사 리뷰</h3></div>
			<div class="expert-user-form__form-group__input">
			<div class="input-group telephone-input expert-review-form__telephone-input">
			</div>
			</div>
			</div>
			</div>
<p>


<div class="expert-user-form__form-group">
<div class="expert-user-form__form-group__label"><h6>퀄리티</h6></div>
<div class="expert-user-form__form-group__description">전문가님이 진행해주신 인테리어 시공의 최종 퀄리티는 만족스러웠나요?</div>
<div class="expert-user-form__form-group__input">

<div class="container">
         <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
				<input type="radio" id="star5" name="reviewGrade" value="5" /><label for="star5" title="5 star"></label>
	            <input type="radio" id="star4" name="reviewGrade" value="4" /><label for="star4" title="4 star"></label>
	            <input type="radio" id="star3" name="reviewGrade" value="3" /><label for="star3" title="3 star"></label>
	            <input type="radio" id="star2" name="reviewGrade" value="2" /><label for="star2" title="2 star"></label>
	            <input type="radio" id="star1" name="reviewGrade" value="1" /><label for="star1" title="1 star"></label>
        </div>
  </div>

</div>
</div>

<div class="expert-user-form__form-group">
<div class="expert-user-form__form-group__label"><h6>총평</h6></div>
<div class="expert-user-form__form-group__description">인테리어 시공 전문가님의 서비스와 작업물 전반에 대하여 간단한 총평을 부탁드립니다.</div>
<div class="expert-user-form__form-group__input">
<textarea id="summernote" name="reviewDescription" >${review.reviewDescription}</textarea>
</div>
</div>
</div>

<br>
			
<button class="btn btn-outline-primary" type="submit"value="등록하기">수정완료</button>		
		</section><!--end section-->
	</div><!--end main row-->
</div>
</form><!--END form-->
<!--END papering 도배-->
</div>

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