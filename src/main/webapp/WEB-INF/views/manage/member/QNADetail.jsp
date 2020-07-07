<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

<style>
	body{
		margin-left: 10%;
	}
	p{
		font-size: 20px;
	}
	.click{
		font-size: 20px;
		font-weight: bold;
	}
	a{
		text-decoration: none;
	}
	.border {
	    display: inline-block;
		padding: 20px;
	  }
	  #line{
	  	border: 2px solid #33f0c0;
	  }
</style>

<script type="text/javascript">
	function delchk(){
	    return confirm("정말로 삭제하시겠습니까?");
	}
</script>

<!-- bootstrap-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  
  <!-- WebFont -->
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

</head>
<body>
<div  class="container margin-top-100">
<div class="row justify-content-center">
	<h2>${qna.qnaTitle}</h2>
</div>
<div class="rows">
<br><br>
</div>
<div class="rows">
<c:choose>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==14}">
		<h4>[ 결제 ]</h4>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==15}">
		<h4>[ 환불 ]</h4>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==16}">
		<h4>[ 회원정보 변경 ]</h4>
	</c:when>
	<c:when test="${qna.qnaCategory.qnaCategoryNo==17}">
		<h4>[ 서비스 / 기타 ]</h4>
	</c:when>
</c:choose>
</div>
<div class="rows">
<p>${qna.member.memberName}</p>&nbsp;&nbsp;&nbsp;&nbsp; 
<p><fmt:formatDate value="${qna.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></p>
</div>
<span class="row border">
${qna.qnaDescription}
</span><!-- span row end -->
<div class="rows"><br><br></div>
<div class="rows">
<a class="click" href="${pageContext.request.contextPath}/qna/list/${qna.qnaCategory.qnaCategoryNo}">목록으로</a>
</div><!-- row end -->
<div class="rows">
<sec:authentication var="user" property="principal" />
   <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<c:choose>
		<c:when test="${qna.member.memberNo == user.memberNo}">
			<a class="click" onclick="return delchk()" href="${pageContext.request.contextPath}/qna/delete?qnaNo=${qna.qnaNo}">게시글 삭제하기</a>
		</c:when>
	</c:choose><p>
</sec:authorize>
</div><!-- row end -->
<div class="rows">
<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
<a class="click"   href="${pageContext.request.contextPath}/qna/replyForm?qnaParentNo=${qna.qnaNo}">답글달기</a>
<c:choose>
<c:when test="${qna.member.memberNo == user.memberNo}">
	 | <a class="click" href="${pageContext.request.contextPath}/qna/updateForm?qnaNo=${qna.qnaNo}"}>게시글 수정하기</a>
</c:when>
</c:choose>
</sec:authorize>
</div>
<br><hr id="line"><br>
<div class="rows">
<c:if test="${not empty qnaParent}">
<h4 class="col-md-12">'${qna.qnaTitle}'에 대한 답글</h4>
<c:forEach items="${qnaParent}" var="qnaParent">
<h3 class="col-md-12">${qnaParent.qnaTitle}</h3>
<span class="row border col-md-12">
${qnaParent.qnaDescription}
</span>
</c:forEach>
</c:if>
</div>
<br><br>
</body>
</html>