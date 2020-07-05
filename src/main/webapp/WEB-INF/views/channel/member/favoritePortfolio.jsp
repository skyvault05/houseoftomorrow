<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

<!-- bootstrap--> <link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="/css/channel/channel.css">

  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
</head>
<body>
<div class="container margin-top-100">
<br><br>
<div class="row justify-content-center">
<h2>관심 포트폴리오</h2>
</div>
<div class="row"><br><br></div>
<div class="row">
	<c:if test="empty ${requestScope.fport}">
		<p>관심 포트폴리오 목록이 없습니다.</p>
	</c:if>
</div>
<c:forEach items="${fport}" var="port">
 <section class="recommendation portfolio">
     <div class="container">
         <div class="row">
			<div class="col-xl-12 pt-3">
			<div class="card-wrap">
			 	<div class="main_recomm card">
				     <div class="card-img">
				     <a href="${pageContext.request.contextPath}/channel/channelDetail/${fvChannel.channel.chNo}">
				         <img src="${port.portfolio.portImg}" class="card-img-top rounded">
				     </a>
				     </div>
				     <div class="card-body">
				       <a href="${pageContext.request.contextPath}/수정하삼~~~~">
				       <p class="card-text title">${port.portfolio.portTitle}</p>
				       <div class="card-text title">${port.portfolio.channel.constructor.conName}</div>
				       </a>
				     </div>
				 </div>
			 </div>
			</div>
		</div>
	</div>
</section>
</c:forEach>
</div>
</body>
</html>