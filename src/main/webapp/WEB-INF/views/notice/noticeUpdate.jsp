<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
공지사항 수정 페이지

<form name="insertForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/notice/noticeUpdate" >

제목: <input type="text" name="commTitle"  id="commTitle"/><p>

	
	<sec:authentication var="user" property="principal" />
	${user.memberNo}
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>

	
<!-- 	설명: <input type="text" name="commDescription" id="commDescription"/><p> -->
	
	
	<input type="hidden" name="commCategoryNo"  value="<%=request.getParameter("commCategoryNo")%>"/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<textarea id="summernote" name="commDescription"></textarea>
	<input type="submit" value="등록하기"> 
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/notice/noticeList">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>