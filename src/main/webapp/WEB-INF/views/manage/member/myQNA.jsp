<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
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
<style>
	a{
		color: black;
		text-decoration: none;
	}
	/* Style the tab */
	.tab {
	margin-left: 15%;
	width: 70%;
	  overflow: hidden;
	  border: 1px solid #ccc;
	  background-color: #f1f1f1;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	  background-color: inherit;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  transition: 0.3s;
	  font-size: 20px;
	  width: 25%
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	  background-color: #ddd;

	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	  background-color: #ccc;
	}
	
	/* Style the tab content */
	.tabcontent {
	  display: none;
	  padding: 6px 12px;
	  border: 1px solid #ccc;
	  border-top: none;
	  }
	  
	  /* table hover 색깔 바꾸기 */
	  #table:hover tbody tr:hover td {
		    background: #33f0c0;
		    color: white;
		}
		
</style>

</head>
<body>
<sec:authentication property="principal" var="user"/>
<!-- ----------------------------------------------------------------------------->
<div class="empty-space"></div>
  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">회원정보수정</a>
					</li>
					<li class="nav-item">
						<a href="/myEstimateList/${user.memberNo }" class="nav-link" target="_self">견적 요청 내역</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">내 상담 내역</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="nav-link" target="_self">내가 쓴 글</a>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->
	
	<!-- ------------------------------------------- -->
	<div class="self_write-wrap">
	
		<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="nav-link" target="_self">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/review/myReview/${user.memberNo}" class="nav-link" target="_self">리뷰</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/qna/myQNA/${user.memberNo}" class="nav-link" target="_self">Q&A</a>
					</li>
				</ul>
			</nav>
	
	</div>

</div> 
<!-- ----------------------------------------------------------------------------->

<div class="container" >
<div class="py-5 text-left">
   <div class="row">
   
 <div class="alert alert-danger alert-dismissible" role="alert" >
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>내가 쓴 문의글!</strong> 내가 쓴 문의 글 입니다.
  </div>
  
	</div>
	
<div class="row"><br></div>
<c:if test="${empty myQNA}">
	<p class="row justify-content-center">등록한 문의글이 없습니다.</p>
</c:if>
<div class="row">
<table id="table" class="table table-hover">
<c:forEach items="${myQNA}" var="list">
	<tr>
	<td style="width: 40%;"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">
	<c:choose>
	<c:when test="${list.qnaCategory.qnaCategoryNo==14}">
		결제
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==15}">
		환불
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==16}">
		회원정보 변경
	</c:when>
	<c:when test="${list.qnaCategory.qnaCategoryNo==17}">
		서비스 / 기타
	</c:when>
</c:choose>
	</a></td>
	<td style="width: 15%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
	</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>