<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내일의 집</title>
    <script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
    <meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content"); 
		$(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader(header, token);
		});
	</script>
    
    <link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
	<script src="/plugins/bootstrap/bootstrap.min.js"></script>

	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/addr/addr.js"></script>
	
	<link rel="stylesheet" href="/css/common/common.css">
	
<style>
#addrrow{
	padding-left:15;
	padding-right:15;
}
#signupBtn{
	font-size:20px;
}
#dupCheck, #phoneCheck{
	margin-top:39px;
}
</style>
</head>

<body>
	<div class="container">
	<br><br>
		 <form class="row" enctype="multipart/form-data" action="${pageConext.request.contextPath}/channel/update" method="POST">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<div class="form-group col-md-12">
				<h1>시공사 정보 입력</h1>${channel.constructor.member.memberNo}
				</div>
				<div class="form-group col-md-6">
					<label for="conName">시공사명</label> 
                    <input type="text" class="form-control" id="conName" value="${channel.constructor.conName}" name="conName" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for="conPhone">시공사 연락처</label> 
                    <input type="text" class="form-control" id="conPhone" value="${channel.constructor.conPhone }" name="conPhone" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for='company'>사업자 여부</label><br>
					<input type="radio" id="company"  name="conIsCompany" value="1" checked>
					<label for="company">사업자</label>
					<input type="radio" id="freelancer" name="conIsCompany" value="0">
					<label for="freelancer">프리랜서</label>
				</div>
				
				<div class="form-group col-md-6">
					<label for="conCareer">경력사항</label> 
                    <input type="text" class="form-control" id="conCareer"  value="${channel.constructor.conCareer}" name="conCareer" required>
				</div>
				<div class="w-100"></div>				
				
				<div class="form-group col-md-6">
					<label for="conCertification">사업자 등록번호</label> 
                    <input type="text" class="form-control" id="conCertification"  value="${channel.constructor.conCertification}" name="conCertification" required>
				</div>					
				<div id='addr' class="form-group col-md-6">
					<div class='container'>
						<div class='row'>
							<label class="col-md-4" for="postcode">주소</label>
							<div class="w-100"></div>
							<input type="text" class="form-control col-md-4" id="postcode" name="postcode" placeholder="우편번호" readonly>
							<input class="form-control col-md-4" id="extraAddress" name="extraAddress" type="text" readonly>
							<button class="btn btn-primary signBtn col-md-4" id="userAddrBtn" type="button">우편번호 찾기</button>
							<input type="text" class="form-control col-md-12" id="roadAddress" name="reaodAddress" placeholder="도로명주소" readonly>
							<input class="form-control col-md-12" id="detailAddress" name="detailAddress" placeholder="상세주소" type="text">
						</div>
					</div>
				</div>					
				<div class="form-group col-md-12">
				<h1>시공사 채널 정보 입력</h1>
				</div>
				<div class="form-group col-md-6">
					<label for="chDescription">채널 설명</label> 
                    <input type="text" class="form-control" id="chDescription" value="${channel.chDescription}" name="chDescription" required>
				</div>
				
				<div class="form-group col-md-6">
					<label for="chImgFile">채널 대표 이미지</label> <br>
                    <input type="file"  id="chImgFile" placeholder="채널 대표 이미지" name="file" required>
				</div>
				<input type="hidden" name="chaNo" value="${channel.chNo}">
				<input type="hidden" name="chRegdate" value="${channel.chRegdate}">
				<sec:authentication var="user" property="principal" />
				<input type="hidden" name="membNo"  value="${user.memberNo}"/>
				<button class="btn btn-primary btn-lg btn-block" id="signupBtn" type="submit">정보수정</button>
			</form>
			<br><br>
		</div>

</body>
</html>