<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 집</title>

<style>
	body{
		margin-left: 10%;
	}
	.click{
		font-size: 20px;
		color: orange;
		font-weight: bold;
	}
	a{
		text-decoration: none;
	}
</style>

<script type="text/javascript">
	function delchk(){
	    return confirm("정말로 삭제하시겠습니까?");
	}
</script>

</head>
<body>
<h1>${qna.qnaTitle}</h1>
<c:choose>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==14}">
		<h2>결제</h2>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==15}">
		<h2>환불</h2>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==16}">
		<h2>회원정보 변경</h2>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==17}">
		<h2>서비스 / 기타</h2>
	</c:when>
</c:choose>
${qna.member.memberName}<p>
<fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/><p>
${qna.qnaDescription}<p>
<sec:authentication var="user" property="principal" />
   <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<c:choose>
		<c:when test="${qna.member.memberNo == user.memberNo}">
			<a class="click" onclick="return delchk()" href="${pageContext.request.contextPath}/qna/delete?qnaNo=${qna.qnaNo}">게시글 삭제하기</a>
		</c:when>
	</c:choose><p>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
<a class="click"   href="${pageContext.request.contextPath}/qna/replyForm?qnaParentNo=${qna.qnaNo}">답글달기</a>
<c:choose>
<c:when test="${qna.member.memberNo == user.memberNo}">
	 | <a class="click" href="${pageContext.request.contextPath}/qna/updateForm?qnaNo=${qna.qnaNo}"}>게시글 수정하기</a>
</c:when>
</c:choose>
</sec:authorize>
${qna.qnaNo}
</body>
</html>