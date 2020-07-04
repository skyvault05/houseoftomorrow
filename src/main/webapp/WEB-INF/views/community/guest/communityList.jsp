<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

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

<style>

	img{
 		width: 500px;
		height:300px;
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
<br><br>
<div class="container margin-top-100">
<div class="row justify-content-center">
<h2>
커뮤니티
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