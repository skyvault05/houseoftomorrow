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
커뮤니티 리스트

	<c:forEach items="${requestScope.list}" var="list" >
	글번호: ${list.commNo}<p>
	제목: ${list.commTitle}<p>
<%-- 	작성자: ${list.memberNo}<p> --%>
	<img src='{pageContet.request.contextPath}/resources/${commImg}'/><p>
	날짜: ${list.commRegdate }
	</c:forEach>
</body>
</html>