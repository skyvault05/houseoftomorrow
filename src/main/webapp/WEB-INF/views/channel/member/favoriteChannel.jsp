<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

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
							<a style="color:#33f0c0" href="${pageContext.request.contextPath}/channel/myFavoriteChannel/${user.memberNo}" class="nav-link my_write" target="_self">관심 채널</a>
						</li>
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/channel/myFavoritePortfolio/${user.memberNo}" class="nav-link my_write" target="_self">관심 포트폴리오</a>
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
                <c:forEach items="${fvChannel}" var="fvChannel" varStatus="status">
                   <div class="col-md-3">
                   <div style="relative">
                        <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${fvChannel.channel.chNo}"><img src="${fvChannel.channel.chImg}" class="card-img-top rounded" alt="blog" width="255px" height="255px"></a>
                        
                          <p class="card-text title">${fvChannel.channel.constructor.conName}</p>
                          <div class="card-text content">★ ${fvChannel.channel.chGrades}</div>
                    </div>
                	 </div>
                 </c:forEach>
</div> 
</div>
</div>
</body>
</html>