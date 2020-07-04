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
<br><br>
<div class="container margin-top-100">
<div class="row justify-content-center">
<h2>
커뮤니티픽쳐사진사진
</h2>
</div>
<div class="row justify-content-center">
<c:choose>
	<c:when test="${commCategoryNo==4}"><h3>사진</h3></c:when>
</c:choose>
<c:choose>
	<c:when test="${commCategoryNo==5}"><h3>노하우</h3></c:when>
</c:choose>
</div>
<div class="row"><br><br></div>
<section class="rows">
	<c:forEach items="${requestScope.list}" var="list" >
	<div class="col-md-4">
	<a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
	<div class="scale"><img class="card-img-top rounded" src="${list.commImg}"></div><!-- 이미지 크기 조정 --><br>
	<b>${list.commTitle}</b><p>
	${list.member.memberId}<p>
	조회수: ${list.commReadnum }<p>
	</a>
	</div>
	</c:forEach>
</section>
</div>
</body>
</html>