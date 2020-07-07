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
		<sec:authorize access="isAuthenticated()">   
		<sec:authentication property="principal" var="user"/>
		<div class="wrap-submenu" style="text-align: center">
			<div class="mypage-nav">
				<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
					<ul class="navbar-nav mypage">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/channel/myFavoriteChannel/${user.memberNo}" class="nav-link" target="_self">관심 채널</a>
						</li>
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/channel/myFavoritePortfolio/${user.memberNo}" class="nav-link" target="_self">관심 포트폴리오</a>
						</li>
					</ul>
				</nav>
			</div>
		</div><!--end wrap-submenu-->
		</sec:authorize>
		<br><br>
<div class="row"><br><br></div>
<div class="container">
<br><br>
<div class="row justify-content-center">
<h2></h2>
&nbsp;
<h5 class="post__title"><strong></strong></h5>
</div> <!-- row -->
<div class="row" style="transform:translateX(-0px)"><br><br>
                <c:forEach items="${fport}" var="port" varStatus="status">
                   <div class="col-md-3">
                   <div style="relative">
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${port.portfolio.portNo}"><img src="${port.portfolio.portImg}" class="card-img-top rounded" alt="blog" width="255px" height="255px"></a>
                       
                          <p class="card-text title">${port.portfolio.portTitle}</p>
                          <div class="card-text content">${port.portfolio.channel.constructor.conName}</div>
                    </div>
                	 </div>
                 </c:forEach>
</div> 
</div>
</div>
</body>
</html>