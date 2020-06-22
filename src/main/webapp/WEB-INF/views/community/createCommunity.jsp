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
커뮤니티 등록 페이지

<form name="insertForm" method="post" action="${pageContext.request.contextPath }/community/insert" >

<%-- 	제목: <input type="text" name="commTitle"  id="commTitle"/><p>

	<input type="hidden" name="memberNo"  value="${sessionScope.memberNo }}"/>

	<input type="file" name="commImg"  id="commImg" accept="image/gif, image/jpeg, image/png"  multiple="multiple"><p>
	
	<input type="text" name="commDescription" id="commDescription"/><p>
	
	<input type="hidden" name="commCategoryNo"  value="<%=request.getParameter("commCategoryNo")%>"/> --%>

	<input type="submit" value="등록하기"> 
</form>
</body>
</html>