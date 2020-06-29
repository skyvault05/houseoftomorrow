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
<c:choose>
	<c:when test="${param.qnaCategoryNo==14}">
		<h2>결제</h2>
	</c:when>
	<c:when test="${param.qnaCategoryNo==15}">
		<h2>환불</h2>
	</c:when>
	<c:when test="${param.qnaCategoryNo==16}">
		<h2>회원정보 변경</h2>
	</c:when>
	<c:when test="${param.qnaCategoryNo==17}">
		<h2>서비스 / 기타</h2>
	</c:when>
</c:choose>
<table>
<c:forEach items="${list}" var="list">
	<tr>
	<td style="width: 40%;"><b>Q</b>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.member.memberName}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>