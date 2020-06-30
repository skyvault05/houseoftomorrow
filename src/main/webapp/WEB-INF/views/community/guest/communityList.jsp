<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

	<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
	    
	<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
	<script src="/plugins/bootstrap/bootstrap.min.js"></script>

<style>
	h1{
		margin-left: 10%;
		font-weight: bold;
	}
	img{
 		width: 20%; 
 		height: 20%;
	}
	a{
		color: black;
		text-decoration: none;
	}
	a:hover{
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
	.list{
		text-align: center;
		float: left;
	}
	section{
		margin-left: 10%;
		margin-right: 10%
	}
	img{
		width: 500px;
		height:300px;
	}
</style>

</head>
<body>
<c:choose>
	<c:when test="${param.commCategoryNo == 4}">
		<h1>커뮤니티 - 사진</h1>
	</c:when>
	<c:when test="${param.commCategoryNo == 5}">
		<h1>커뮤니티 - 노하우</h1>
	</c:when>
</c:choose>
<h1>커뮤니티</h1>
<br><br>
<section>
	<c:forEach items="${requestScope.list}" var="list" >
	<div class="list col-md-4"><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
	<div class="scale"><img src="${list.commImg}"></div><!-- 이미지 크기 조정 --><br>
	<b>${list.commTitle}</b><p>
	${list.member.memberId}<p>
	조회수: ${list.commReadnum }<p>
	</a>
	</div>
	</c:forEach>
</section>
</body>
</html>