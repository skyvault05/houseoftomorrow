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


</head>
<body>
커뮤니티 등록 페이지

<form name="insertForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/community/insert" >

제목: <input type="text" name="commTitle"  id="commTitle"/><p>

	
	<sec:authentication var="user" property="principal" />
	${user.memberNo}
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>
	이미지: <input type="file" name="file"  id="commImg" accept="image/gif, image/jpeg, image/png" ><p>
	
<!-- 	설명: <input type="text" name="commDescription" id="commDescription"/><p> -->
	
	
	<input type="hidden" name="commCategoryNo"  value="<%=request.getParameter("commCategoryNo")%>"/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<textarea id="summernote" name="commDescription"></textarea>
	<input type="submit" value="등록하기"> 
</form>

</body>
</html>