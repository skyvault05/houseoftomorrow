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
		$.ajax({
			url : "/member/consultingComplete",
			data : {
				memberNo : $('#myMemberNo').val()
			},
			type : "json",
			method : "post",
			success : function(obj){
				$(obj).each(function(index, element){
					var str = "<tr><td>";
					str += index + 1;
					str += "</td><td><a href='#'>" + element.constructorName + "시공사</a>";
					str += "<input type='hidden' name='consulNo' value='" + element.consulting.consulNo + "'></td><td>";
					var date = new Date(element.contractTime);
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
					$('#contractList').append(str);
				});
			},
			error : function(e){
				alert(e);	
			}
		})
	}else{	//시공사
		$.ajax({
			url : "/constructor/consultingComplete",
			data : {
				chNo : $("#myChNo").val()
			},
			type : "json",
			method : "post",
			success : function(obj){
				$(obj).each(function(index, element){
					var str = "<tr><td>";
					str += index + 1;
					str += "</td><td><a href='#'>" + element.memberName + "님</a>";
					str += "<input type='hidden' name='consulNo' value='" + element.consulting.consulNo + "'></td><td>";
					var date = new Date(element.contractTime);
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
					$('#contractList').append(str);
				});
			},
			error : function(e){
				alert(e);
			}
		})
	}
	
	$('table').on("click","a",function(){
		$('input[name=consulNo]').val($(this).siblings('input').val());
		$('form').submit();
	})
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
				<input type="hidden" name="consulNo" value="">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	<input type="hidden" id="myMemberNo" value="<sec:authentication property="principal.memberNo"/>">
	<input type="hidden" id="myChNo" value="<sec:authentication property="principal.chNo"/>">
</body>
</html>