<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>내일의 집</title>

<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<link rel="stylesheet" href="/plugins/summernote/summernote-lite.min.css">
<script src="/plugins/summernote/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<!-- WebFont -->
<link rel="stylesheet" href="/css/font/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/font/font-awesome.min.css">



<style type="text/css">
	table{
		width:100%;
	}
	img{
		max-width:100%;
	}
</style>

<script>
	$(function(){
		$.ajax({
			url : "/constructor/preConsulting",
			method : "post",
			type : "json",
			data : {	//#수정 바람
				consulNo : $('input[name="consulParentNo"]').val()
			},
			success : function(jsonObj){
				if(!jsonObj){
					$('#description').append("<div><p>상담 중인 내역이 없습니다.</p></div>");
				}else{
					$('input[name=chNo]').val(jsonObj.chNo);
					$('#description').append("<div>" + jsonObj.consulDescription + "</div>");
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
				alert(e.message);
			}
		});
		
		$('#noteBtn').click(function(){
			$("#noteForm").submit();
		})
	})
</script>

</head>
<body>

<div class="container pt-5" >
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
				<form action="/constructor/consulting" id="noteForm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<!-- #no값들 변경해야함 -->
					
					<input type="hidden" name="memberNo" value='<sec:authentication property="principal.memberNo" />'>
					<input type="hidden" name="chNo">
					
					<input type="hidden" name="consulParentNo" value="${param.consulNo}">
					
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
							<form action="/constructor/contractView" method="post">
								<input type="hidden" name="consulNo" value="${param.consulNo}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input class="btn btn-outline-primary" type="submit" value="계약서 보기">
							</form>
						</td>
						<td style="float:right;">
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
<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 
	$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader(header, token);
	});
</script>
</body>
</html>