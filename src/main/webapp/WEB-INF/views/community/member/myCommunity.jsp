<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		margin-left: 10%;
	}
	table{
		text-align: center;
	}
	a{
		color: black;
		text-decoration: none;
	}
	p{
		color: orange;
		font-weight: bold;
	}
</style>
</head>
<body>
<h1>내가 쓴 community 글</h1>
<p>이미지도 띄울까여 어케 표시할까용
이미지 띄우려면 c: 태그 안에 "$ {community.commImg}" 사용</p>
<br><br>
<table>
	<thead>
		<td>제목</td>
		<td>카테고리</td>
		<td>날짜</td>
		<td>상태</td>
	</thead>
	<tbody>
	<c:forEach items="${community}" var="list" >
		<tr>
		<td><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">${list.commTitle}</a></td>
		<td>
		<a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
			<c:choose>
			<c:when test="${list.commCategory.commCategoryNo == 4}">사진</c:when>
			<c:when test="${list.commCategory.commCategoryNo == 5}">노하우</c:when>
			</c:choose>
		</a>
		</td>
		<td><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}"><fmt:formatDate value="${list.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
		<td>
			<c:choose>
				<c:when test=" ${list.commStatus == 0}">삭제됨</c:when>
			</c:choose>
		</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>