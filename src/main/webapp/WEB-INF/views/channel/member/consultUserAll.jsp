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

<script>
	$(function(){
		if($('#myChNo').val() == "null"){
			$.ajax({
				url : "/member/consultingAll",
				data : {
					memberNo : $('#myMemberNo').val()
				},
				type : "json",
				method : "post",
				success : function(obj){
					$(obj).each(function(index, element){
						$.ajax({
							url : "/channel/member/contrcutorName",
							data : {
								chNo : element.chNo
							},	
							type : "text",
							method : "post",
							success : function(text){
								var str = "<tr><td>";
								str += index + 1;
								str += "</td><td><a href='#'>";
								str += text;
								str += "님과의 상담</a><input type='hidden' name='chNo' value='" + element.chNo + "'>";
								str += "<input type='hidden' name='memberNo' value='" + element.memberNo + "'></td><td>";
								var date = new Date(element.consulRegDate);
								var year = date.getFullYear();
								var month = date.getMonth()+1;
								var day = date.getDay();
								var hour = date.getHours();
								var min = date.getMinutes();
								var sec = date.getSeconds();
								var retVal = year + "/" + (month < 10 ? "0" + month : month) + "/" 
									+ (day < 10 ? "0" + day : day) + " " 
									+ (hour < 10 ? "0" + hour : hour) + ":"
									+ (min < 10 ? "0" + min : min) + ":" 
									+ (sec < 10 ? "0" + sec : sec);
								str += retVal;
								str += "</td></tr>";
								$('#consultingList').html($('#consultingList').html() + str);
							},
							error : function(err){
								
							}
						})
					})
				},
				error : function(e){
					alert(e);
				}
			})
			$('form').attr("action","/member/consultingForm");
		}else{
			$.ajax({
				url : "/constructor/consultingAll",
				data : {
					chNo : $('#myChNo').val()
				},
				type : "json",
				method : "post",
				success : function(obj){
					$(obj).each(function(index, element){
						$.ajax({
							url : "/constructor/memberId",
							data : {
								memberNo : element.memberNo
							},	
							type : "text",
							method : "post",
							success : function(text){
								var str = "<tr><td>";
								str += index + 1;
								str += "</td><td><a href='#'>";
								str += text;
								str += "님과의 상담</a><input type='hidden' name='chNo' value='" + element.chNo + "'>";
								str += "<input type='hidden' name='memberNo' value='" + element.memberNo + "'></td><td>";
								var date = new Date(element.consulRegDate);
								var year = date.getFullYear();
								var month = date.getMonth()+1;
								var day = date.getDay();
								var hour = date.getHours();
								var min = date.getMinutes();
								var sec = date.getSeconds();
								var retVal = year + "/" + (month < 10 ? "0" + month : month) + "/" 
									+ (day < 10 ? "0" + day : day) + " " 
									+ (hour < 10 ? "0" + hour : hour) + ":"
									+ (min < 10 ? "0" + min : min) + ":" 
									+ (sec < 10 ? "0" + sec : sec);
								str += retVal;
								str += "</td></tr>";
								$('#consultingList').html($('#consultingList').html() + str);
							},
							error : function(err){
								
							}
						})
					})
				},
				error : function(e){
					alert(e);
				}
			})
			
			$('form').attr("action","/constructor/consultingForm");
		}
		
		$('table').on('click',"a",function(){
			$('#chNo').val($(this).siblings('input[name=chNo]').val());
			$('#memberNo').val($(this).siblings('input[name=memberNo]').val());
			$('#consulNo').val($(this).siblings('input[name=consulNo]').val());
			$('form').submit();
			return false;
		})
	})
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
<title>Insert title here</title>
</head>
<body>

<!-- --------------------------------------------------------------------------------- -->


	<input type="hidden" id="myChNo" value='<sec:authentication property="principal.chNo"/>'>
	<input type="hidden" id="myMemberNo" value='<sec:authentication property="principal.memberNo"/>'>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>상담 내역</h1>
			</div>
			<div class="col-md-12">
				<table id="consultingList">
					
				</table>
			</div>
			<form method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="memberNo" name="memberNo" value="">
				<input type="hidden" id="chNo" name="chNo" value="">
				<input type="hidden" id="consulNo" name="consulNo" value="">
			</form>
		</div>
	</div>
</body>
</html>