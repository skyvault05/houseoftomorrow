<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</style>

</head>
<body>
<table>
<c:forEach items="${myQNA}" var="list">
	<tr>
	<td style="width: 40%;"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">
	<c:choose>
	<c:when test="${list.qnaCategory.qnaCategoryNo==14}">
		결제
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==15}">
		환불
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==16}">
		회원정보 변경
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==17}">
		서비스 / 기타
	</c:when>
</c:choose>
	</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>