<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
<style>
 a {color:#424242;}
  .nav-submenu_link {padding: 0px 10px; }
 .review_submenu_link, .review_link {color:#424242;}
  .nav-submenu_link:hover{color:#33f0c0; transition: 0.2s; font-weight:bold;} 

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
	a:hover{
		color: black;
		text-decoration: none;
	}
	.scale img {
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
 <sec:authentication property="principal" var="user"/>
<!-- -------------------------------SUBMENU---------------------------------------------->

  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/manage/member/memberUpdateForm" class="nav-link my_write" target="_self">회원정보수정</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/myEstimateList/${user.memberNo }" class="nav-link my_write" target="_self">견적 요청 내역</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/member/consultingAllPage" class="nav-link my_write" target="_self">내 상담 내역</a>
					</li>
					<li class="dropright">
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="dropdown-toggle nav-link my_write" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						내가 쓴 글</a>
						<!-- 좋은말로할때드롭따운해라 -->
						<div class="dropdown-menu my__write box shadow">
			                <ul class="" aria-labelledby="navbarDropdown">
			                  <li class="dropdown-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/review/myReview/${user.memberNo}" target="_self">리뷰</a>
							  </li>
			                  <li class="dropdown-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" target="_self">커뮤니티</a>
							  </li>
							  
							  <li class="dropdown-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/qna/myQNA/${user.memberNo}" target="_self">Q&A</a>
							  </li>
			              	</ul>
			            </div>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->
	</div>
	
<!-- ----------------------------------------END SUBMENU----------------------------------------------- -->
<div class="row">
<%-- ${community.member.memberNo} --%>




<c:forEach items="${community}" var="list" >

			<c:choose>
				<c:when test="${list.commCategory.commCategoryNo == 4}">
					<div class="list col-md-4"><a href="${pageContext.request.contextPath}/community/guest/detail/${list.commNo}">
					<div class="scale"><img src="${list.commImg}"></div><br>
					<b>${list.commTitle}</b><p>
					  <span><fmt:formatDate value="${list.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></span><p>
					</a>
					</div>
				</c:when>
				<c:when test="${list.commCategory.commCategoryNo == 5}">
					<div class="list col-md-4"><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
					<div class="scale">
						<img src="${list.commImg}">
					</div><br>
					<b>${list.commTitle}</b><p>
					  <span><fmt:formatDate value="${list.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></span><p>
					</a>
					</div>
				</c:when>
			</c:choose>
</c:forEach>
</div>
</div>
</body>
</html>