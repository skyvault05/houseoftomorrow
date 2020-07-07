<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

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

<script>
$(function(){
	if($('#myChNo').val() == "null"){ //유저
		alert($('#myMemberNo').val());
		alert("유저");
// 		$.ajax({
// 			url : "/member/consultingAll",
// 			data : {
// 				memberNo : $('#myMemberNo').val()
// 			},
// 			type : "json",
// 			method : "post",
// 			success : function(obj){
// 				$(obj).each
// 			},
// 			error : funtion(e){
// 				alert(e);	
// 			}
// 		})
	}else{	//시공사
		alert($('#myChNo').val());
		alert("시공사");
// 		$.ajax({
// 			url : "",
// 			data : {
// 				chNo : $("#myChNo").val()
// 			},
// 			type : "json",
// 			method : "post",
// 			success : function(obj){
				
// 			},
// 			error : function(e){
// 				alert(e);
// 			}
// 		})
	}
});
</script>
<style>
	table{
		width: 100%;
	}
	table, tr, td{
		border : 1px solid;
		border-collapse: collapse;
	}
</style>
<meta charset="UTF-8">
<title>내일의 집</title>
</head>
<body>
	<div class="container pt-2">
		<div class="py-5 text-left">
		
		<div class="wrap-submenu" style="text-align: center">
			<div class="mypage-nav">
				<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
					<ul class="navbar-nav mypage">
						<li class="nav-item">
							<a href="/member/consultingAllPage" class="nav-link" target="_self">내 상담 내역</a>
						</li>
						<li class="nav-item">
							<a href="/member/contractAll" class="nav-link" target="_self">내 계약 내역</a>
						</li>
					</ul>
				</nav>
			</div>
		</div><!--end wrap-submenu-->
		
			<div class="col-md-12">
				<h3 class="expert-calculate__content__header__title">계약 목록</h3>
			</div>
			<div class="col-md-12">
				<table id="contractList">
					
				</table>
			</div>
			<form action="/member/contractView" method="post">
				<input type="hidden" name="consulNo" value="${param.consulNo}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	<input type="hidden" id="myMemberNo" value="<sec:authentication property="principal.memberNo"/>">
	<input type="hidden" id="myChNo" value="<sec:authentication property="principal.chNo"/>">
</body>
</html>