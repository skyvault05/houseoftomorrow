<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>내일의 집</title>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
 
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>
 
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<script> 
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); } 
</script>


<style>
	h1{
		margin-left: 10%
	}
	#commTitle{
		margin-left: 10%;
		width: 20%;
		height: 10%
	}
	#commImg{
		margin-left: 0%;
	}
	#image_container{
		margin-left: 0%;
	}
	
	
</style>
</head>
<body>
<!-- --------------------------------------------------- -->
<div class="container pt" >
<div class="py-5 text-left">
<div class="row">
<section class="expert-calculate" style="margin: 0 auto;">

<h5>${param.commNo}번 게시글 수정하기</h5>

<br><br>
<form name="updateForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/community/update" >

<input type="text" style="margin-left: 0%" name="commTitle"  id="commTitle"  value="${community.commTitle}"/><p>
<br>
	
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>

	<input type="hidden" name="commNo" value="${param.commNo}"/>
	<input type='hidden' name="commReadnum" value="${community.commReadnum}">
	<input type="hidden" name="commCategoryNo"  value="${param.commCategoryNo}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<textarea id="summernote" name="commDescription">${community.commDescription}</textarea>
	
	
	<div class="container">
	<div class="row">
	
	<div class="col-md-10" style="margin-left:0px">
<!-- 여기 모르는거 -->	
	<input type="hidden" name="old_file" id="commImg" value="${community.commImg}">
<!-- 위에  -->	
	<input type="file" name="file"  id="commImg" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(event);"> 
	</div>
	<div class="row col-md-2">
	<button class="btn btn-outline-primary"  type="submit" value="수정하기">수정하기</button> 
	</div>
	</div>
	</div>
	<br>
	<div class="container">
	<div class="alert alert-warning alert-dismissible col-7" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>파일선택!</strong> 메인에 넣을 이미지를 선택하여 주세요.
</div>
	<div class="row col-center" >
	
	<div  id="image_container"></div>
	</div></div>
</form>


</section>
</div>
</div>
</div>
</body>
</html>