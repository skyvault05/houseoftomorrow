<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" href="/css/font/fontawesome/css/font-awesome.min.css">
    
	<link rel="stylesheet" href="/css/font/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">



<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 
	$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader(header, token);
	});
</script>
<link href="/plugins/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="/plugins/summernote/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<meta charset="UTF-8">
<title>내일의 집</title>
<script>
	$(function(){
		$.ajax({
			url : "/member/preConsulting",
			method : "post",
			type : "json",
			data : {	//#수정 바람
				memberNo : $('input[name="memberNo"]').val(),
				chNo : $('input[name="chNo"]').val()
			},
			success : function(jsonObj){
				if(!jsonObj){
					
				}else{
					$('input[name="consulParentNo"]').val(jsonObj.consulNo);
					$('input[name="consulNo"]').val(jsonObj.consulNo);
					$('#description').append("<div style='text-align:right; margin-left:30%; width: 70%'>" + jsonObj.consulDescription + "</div>");
					$(jsonObj.consultChild).each(function(item, element){
						if(element.memberNo == $('input[name=memberNo]').val()){
							$('#description').append("<div style='text-align:right; margin-left:30%; width: 70%'>" + element.consulDescription + "</div>");
						}else{
							$('#description').append("<div>" + element.consulDescription + "</div>");
						}
					})
				}
			},
			error : function(e){
				alert(e);
			}
		});
		
		$('#noteBtn').click(function(){
			$("#noteForm").submit();
		})
	})
</script>

<style>
	table{
		width:100%;
	}
	
	.textaline {
    text-align: center!important;
    /* margin-left: 1%;
    /* width: 70%; */ */
}

</style>
</head>
<body>
<!-- ------------------------------------ -->

<div class="container pt-2" >
<div class="py-5 text-left">

<div class="expert-calculate__main-wrap container">
	<div class="expert-calculate__main row">
		
		

		<!--start 견적폼-->
		<section class="expert-calculate__content" style="margin: 0 auto;">
				<div class="expert-calculate__content__header">
					<h3 class="expert-calculate__content__header__title">시공 상담 / 이미 끝난 상담 조회</h3>
					<div class="alert alert-danger alert-dismissible" role="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					  <strong>시공상담!</strong> 시공상담내용 | 상담할 내용 작성해 주세요.
					</div>
					
					<div class="alert alert-warning textaline" role="alert" id="description">
					
					</div>
				</div>
				
			
		
<p>

<div class="row">

			<div class="col-md-12">
				<form action="/member/consulting" id="noteForm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<!-- #no값들 변경해야함 -->
					
					<input type="hidden" name="memberNo" value='<sec:authentication property="principal.memberNo" />'>
					<input type="hidden" name="chNo" value="${param.chNo}">
					
					<input type="hidden" name="consulParentNo" value="">
					
					<textarea id="summernote" name="consulDescription"></textarea>
				</form>
			</div>
			
			<div class="rows">
			<br>
			</div>
			
			<div class="col-md-12">
				<table>
					<tr>
						<td>
							<form action="/member/contractView" method="post">
								<input type="hidden" name="consulNo" value="${param.consulNo}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input class="btn btn-outline-primary" type="submit" value="계약서 보기">
							</form>
						</td>
						<td style="float:right;">
							<a class="btn btn-outline-primary"  href="/channel/guest/channelDetail/${param.chNo}" value="채널가기">채널가기</a>
							<input class="btn btn-outline-primary" type="button" id="noteBtn" value="작성">
						</td>
					</tr>
				</table>
			</div>
	
</div>	
	
	
</section>	
</div>	
</div>
</div></div>


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
   
<!-- ICON -->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  </body>
</html>