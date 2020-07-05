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
							$('#consultingView').parents('form').attr("action", "consultingView")
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>계약서 보기 페이지</h1>
			</div>
			<div id="contractImg" class="col-md-12">
				
			</div>
			
			<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')">
				<div class="col-md-12">
					<form action="/constructor/contractRegist" id="contractDecideForm" method="post" encType="multipart/form-data">
						<table>
							<tr>
								<td style="width:60%">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<input type="hidden" name="consulNo" value="${param.consulNo}">
									<input type="file" name="file" required>
								</td>
								<td>
									<input type="submit" value="계약서 등록">
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
								<input id="decideBtn" type="submit" value="수락하기">
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
									<input type="submit" id="consultingView" value="상담하기">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>