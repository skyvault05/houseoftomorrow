<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

<style>
	a{
		color: black;
		text-decoration: none;
	}
	table{
		width: 80%;
		margin-left: 15%;
		font-size: 20px;
	}
	h2{
		font-weight: bold;
		margin-left: 10%;
	}
</style>

</head>
<body>
<sec:authentication var="user" property="principal" />
<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<c:choose>
		<c:when test="${param.memberNo==23}">
			답글 목록	
		</c:when>
		<c:otherwise>
			<h2>내가 쓴 글 문의글 목록</h2>
		</c:otherwise>
	</c:choose><p>
</sec:authorize>
<Br>
<table>
<c:forEach items="${myQNA}" var="list">
	<tr>
	<td style="width: 40%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.member.memberName}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>	
	</tr>
	</c:forEach>
</table>

</body>
</html>