<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		margin-left: 10%
	}
	img{
 		width: 20%; 
 		height: 20%;
	}
	a{
		color: black;
		text-decoration: none;
	}
	.scale  img {
		-webkit-transform:scale(1);
		-moz-transform:scale(1);
		-ms-transform:scale(1);	
		-o-transform:scale(1);	
		transform:scale(1);
		-webkit-transition:.3s;
		-moz-transition:.3s;
		-ms-transition:.3s;
		-o-transition:.3s;
		transition:.3s;
	}
	.scale:hover  img {
		-webkit-transform:scale(1.2);
		-moz-transform:scale(1.2);
		-ms-transform:scale(1.2);	
		-o-transform:scale(1.2);
		transform:scale(1.2);
	}
	.scale{
		overflow: hidden;
	}
</style>

</head>
<body>
<h1>커뮤니티 리스트</h1>
<br><br>
	<c:forEach items="${requestScope.list}" var="list" >
	<div class=".col-md-3"><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
	<div class="scale"><img src="${list.commImg}"></div><!-- 이미지 크기 조정 -->
	<b>${list.commTitle}</b><p>
	${list.member.memberId}<p>
	조회수: ${list.commReadnum }<p>
	</a>
	</div>
	</c:forEach>
</body>
</html>