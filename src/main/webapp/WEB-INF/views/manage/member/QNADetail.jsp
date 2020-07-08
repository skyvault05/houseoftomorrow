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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qna/qna.css"> 
<style>
/* 	body{
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
	  } */
</style>

<script type="text/javascript">
	function delchk(){
	    return confirm("정말로 삭제하시겠습니까?");
	}
</script>

</head>
<body>
<!-- -------------------------기존코드--------------------------- -->
<%-- <div  class="container margin-top-100">
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
<br><br> --%>


<!-- ----------------쟈니수정----------------------- -->
<div class="container pt-5">
	<div class="row"></div>
	<div class="table_qna">
		<table class="main_table">
			<tr>
				<th colspan="2" scope="row">
					<p class="qna_title">
						<span class="">${qna.qnaTitle}</span>
					</p>
					<p class="qna_date">등록일 &nbsp;: &nbsp;
						<em><fmt:formatDate value="${qna.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></em>
					</p>
				</th>
				
			</tr>
			<tr>
				<td colspan="2" class="info">
					<dl class="qna">
						<dt>문의 유형</dt>
						<dd>
							<strong>
								<c:choose>
									<c:when test="${qna.qnaCategory.qnaCategoryNo==14}">
										<span> 결제 </span>
									</c:when>
									<c:when test="${qna.qnaCategory.qnaCategoryNo==15}">
										<span> 환불 </span>
									</c:when>
									<c:when test="${qna.qnaCategory.qnaCategoryNo==16}">
										<span> 회원정보 변경 </span>
									</c:when>
									<c:when test="${qna.qnaCategory.qnaCategoryNo==17}">
										<span> 서비스 / 기타 </span>
									</c:when>
								</c:choose>
							</strong>
						</dd>
					</dl>
				
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="txt-conts">
						<span>
							${qna.qnaDescription}
						</span>
					
					</div>
					<div class="reply">
						<strong> 답변 </strong>
					</div>
					<div class="box-polaroid">
						<c:if test="${not empty qnaParent}">
						<div class="box-inner">
							<c:forEach items="${qnaParent}" var="qnaParent">
								<p class="reply_title">${qnaParent.qnaTitle}</p>
								${qnaParent.qnaDescription}
							</c:forEach>
						</div>
						</c:if>
					</div>
				
				</td>
			</tr>

		</table><!-- --end table----- -->

	</div><!-- end QNA -->
	<div class="set-btn">
		<div class="rows justify-content-center" style="margin-left:67%;">
		<a class="click btn btn-primary" href="${pageContext.request.contextPath}/qna/list/${qna.qnaCategory.qnaCategoryNo}">목록으로</a>

<sec:authentication var="user" property="principal" />
   <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<c:choose>
		<c:when test="${qna.member.memberNo == user.memberNo}">
			<a class="click btn btn-primary" onclick="return delchk()" href="${pageContext.request.contextPath}/qna/delete?qnaNo=${qna.qnaNo}">게시글 삭제하기</a>
		</c:when>
	</c:choose><p>
</sec:authorize>
</div><!-- row end -->
<div class="rows">
<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
<a class="click btn btn-primary"   href="${pageContext.request.contextPath}/qna/replyForm?qnaParentNo=${qna.qnaNo}">답글달기</a>
<c:choose>
<c:when test="${qna.member.memberNo == user.memberNo}">
	 | <a class="click btn btn-primary" href="${pageContext.request.contextPath}/qna/updateForm?qnaNo=${qna.qnaNo}"}>게시글 수정하기</a>
</c:when>
</c:choose>
</sec:authorize>
</div>
	</div>

</div>

</body>


</html>