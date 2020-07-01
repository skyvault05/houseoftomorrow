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
<title>Insert title here</title>
<script>
	$(function(){
		$.ajax({
			url : "preConsulting",
			method : "post",
			type : "json",
			data : {	//#수정 바람
				memberNo : $('input[name="memberNo"]').val(),
				chNo : $('input[name="chNo"]').val()
			},
			success : function(jsonObj){
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
			},
			error : function(e){
				alert(e);
			}
		});
	})
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>시공 상담, 이미 끝난 상담 조회</h1>
			</div>
			<div class="col-md-12" id="description">
			</div>
			<div class="col-md-12">
				<form action="consulting" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<!-- #no값들 변경해야함 -->
					
					<input type="hidden" name="memberNo" value='<sec:authentication property="principal.memberNo" />'>
					<input type="hidden" name="chNo" value="${param.chNo}">
					
					<input type="hidden" name="consulParentNo" value="">
					
					<textarea id="summernote" name="consulDescription"></textarea>
					<div class="col-md-1" style="float: right;">
						<input type="submit" value="작성">
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<form action="contractView" method="post">
					<input type="hidden" name="consulNo" value="${param.consulNo}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="submit" value="계약서 등록">
				</form>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>	
</body>
</html>