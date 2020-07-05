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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>계약 목록</h1>
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