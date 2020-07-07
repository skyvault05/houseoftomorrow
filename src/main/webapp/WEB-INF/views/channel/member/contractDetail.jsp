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
		$.ajax({
			url : "/member/contractImg",
			data : {
				consulNo : $('input[name=consulNo]').val()
			},
			type : "json",
			method : "post",
			success : function(obj){
				var img = "<img src='";
				if(!obj){
					img += "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQLQLscCTbySIEjU3X1iDGJHcmlq7kDWCAlYA&usqp=CAU";
				}else{
					img += obj.contractImg;
					if(obj.consulConDecide == 2 && $('input[name=consulConDecide]').val() == 2)
						$('#decideBtn').val("취소하기");
					if(obj.consulUserDecide == 2){
						if($('input[name=consulUserDecide]').val() == 2){
							$('#decideBtn').val("취소하기");
						}
						if(obj.consulConDecide == 2){
							$('#decideBtn').hide();
							$('#contractDecideForm').hide();
							$('#consultingView').val("상담내용 보기");
							$('input[name=flag]').val(true);
						}
					}
					
					$('#chNo').val(obj.consulting.chNo);
					$('#consulNo').val(obj.consulNo);
				}
				img += "'>";
				$('#contractImg').append(img);
			},
			error : function(e){
				alert(e);
			}
		})
		
		$('#decideBtn').click(function(){
			$.ajax({
				url : "/member/contractImg",
				data : {
					consulNo : $('input[name=consulNo]').val()
				},
				type : "json",
				method : "post",
				success : function(obj){
					if(!obj){
						alert("먼저 계약서를 등록해야합니다.");
					}else if(obj.consulUserDecide == 1 && $('input[name=consulConDecide]').val() == 2){
						alert("고객의 승인을 기다려야합니다.");
					}else{
						$('#decideBtn').parent().submit();
					}
				},
				error : function(e){
					alert(e);
				}
			});

			return false;
		});
	});
</script>
<style>
	img{
		width: 100%;
	}
	table{
		width : 100%;
	}
</style>
<meta charset="UTF-8">
<title>내일의 집</title>
</head>
<body>
	<div class="container pt-5">
	<div class="py-5 text-left">
		<div class="expert-calculate__main-wrap container">
		<div class="expert-calculate__main row">
		<section class="expert-calculate__content" style="margin: 0 auto; width:85%">
			<div class="expert-calculate__content__header">
					<h3 class="expert-calculate__content__header__title">계약서 보기</h3>
					<div class="alert alert-danger alert-dismissible" role="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					  <strong>시공상담!</strong> 계약서를 확인할 수 있습니다.
					</div>
					
					<div class="alert alert-warning textaline" role="alert" id="description">
					
					</div>
				</div>
			<div id="contractImg" class="col-md-12">
				
			</div>
			<div class="row">
			<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
				<div class="col-md-12">
					<form action="/constructor/contractRegist" id="contractDecideForm" method="post" encType="multipart/form-data">
						<table>
							<tr>
								<td style="width:60%">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<input type="hidden" name="consulNo" value="${param.consulNo}">
									<input  type="file" name="file" required>
								</td>
								<td>
									<input class="btn btn-outline-primary" type="submit" value="계약서 등록">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<br>
				<br>
			</sec:authorize>
			<div class="col-md-12">
				<table>
					<tr>
						<td style="width:60%">
							<form action="/member/contractUpdate" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="consulNo" value="${param.consulNo}">
								<sec:authorize access="hasRole('ROLE_MEMBER')">
									<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
										<input type="hidden" name="consulConDecide" value="2">
									</sec:authorize>
									<sec:authorize access="!hasRole('ROLE_CONSTRUCTOR')">
										<input type="hidden" name="consulUserDecide" value="2">
									</sec:authorize>
								</sec:authorize>
								<input class="btn btn-outline-primary" id="decideBtn" type="submit" value="수락하기">
							</form>
						</td>
						<td>
							<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
								<form action="/constructor/consultingForm" method="post">
							</sec:authorize>
							<sec:authorize access="!hasRole('ROLE_CONSTRUCTOR')">
								<form action="/member/consultingForm" method="post">
							</sec:authorize>
									<input type="hidden" id="chNo" name="chNo" value="">
									<input type="hidden" id="consulNo" name="consulNo" value="${param.consulNo}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<input class="btn btn-outline-primary" type="submit" id="consultingView" value="상담하기">
									<input type="hidden" name="flag" value=""/>
							</form>
						</td>
					</tr>
				</table>
				</div>
			</div>
			</section>
			</div>
		</div>
		</div>
	</div>
</body>
</html>