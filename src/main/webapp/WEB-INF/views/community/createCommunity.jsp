<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src=“/plugins/jquery/jquery-3.4.1.min.js”></script><script src=“/plugins/bootstrap/bootstrap.min.js”></script>
<link href=“https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css” rel=“stylesheet”>
<script src=“https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js”></script>
<script src=“/plugins/summernote/summernote.js”></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
커뮤니티 등록 페이지

<form name="insertForm" method="post" action="${pageContext.request.contextPath }/community/insert" >

제목: <input type="text" name="commTitle"  id="commTitle"/><p>

	<input type="hidden" name="memberNo"  value=""/>

	이미지: <input type="file" name="commImg"  id="commImg" accept="image/gif, image/jpeg, image/png"  multiple="multiple"><p>
	
<!-- 	설명: <input type="text" name="commDescription" id="commDescription"/><p> -->
	<textarea id=“summernote” name="commDescription"></textarea>
	
	<input type="hidden" name="commCategoryNo"  value="<%=request.getParameter("commCategoryNo")%>"/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>

	<input type="submit" value="등록하기"> 
</form>
</body>
</html>