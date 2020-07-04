<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		document.querySelector("div#image_container").appendChild(img)}; 
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
		margin-left: 10%;
	}
	#image_container{
		margin-left: 10%;
	}
</style>

<script type="text/javascript">
  function check(){
	  window.open("${pageContext.request.contextPath}/channel/constructor/payment/importApi","win","width=800,height=700");
  }
</script>
</head>
<body>
<h2> 포트폴리오 등록 폼 </h2>

<c:choose>
	<c:when test="${param.commCategoryNo == 4}">
		<h1>사진 올리기</h1>
	</c:when>
	<c:when test="${param.commCategoryNo == 5}">
		<h1>노하우 올리기</h1>
	</c:when>
</c:choose>

<br><br>
<form name="portForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/channel/constructor/insertPort" >
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>
	<input type="hidden" name="chNo"  value="${user.chNo}"/>

 제목 : <input type="text" name="portTitle"  id="portTitle" placeholder="올릴 게시글의 제목을 입력해주세요"/><p>

	
 썸네일:	<input type="file" name="file"  id="portImg" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(event);"><p>
	<div id="image_container"></div>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<textarea id="summernote" name="portDescription"></textarea> <p>
	
  시작일 : 	<input type="date" name="portStartDate">
  마감일 : 	<input type="date" name="portEndDate"> <p>
	
	
	<!-- <input type="submit" value="등록하기">  -->
	
	<c:choose>
		
    	<c:when test="${fn:length(portList) >= 2}">
	
			<button type="button" onclick="check()"> 결제하기(등록)</button>
			
		</c:when>
		
		<c:otherwise>
		
			 <input type="submit" value="등록하기">등록하기
			
		</c:otherwise>
		
	</c:choose>
	
</form>

</body>
</html>