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



  <style>
	a {color:#424242;}
  .nav-submenu_link {padding: 0px 10px; }
  /* .review_submenu_link, .review_link {color:#424242;}*/
  .nav-submenu_link:hover{color:#33f0c0; transition: 0.2s; font-weight:bold;} 

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
<!-- -------------------------------SUBMENU---------------------------------------------->

  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/manage/member/memberUpdateForm" class="nav-link" target="_self">회원정보수정</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/myEstimateList/${user.memberNo }" class="nav-link" target="_self">견적 요청 내역</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/member/consultingAllPage" class="nav-link" target="_self">내 상담 내역</a>
					</li>
					<li class="nav-item dropdown">
						<a href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" class="nav-link dropdown-toggle main-btn" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">
						내가 쓴 글</a>
						<!-- 좋은말로할때드롭따운해라 -->
						<div class="dd-wrap myWrite row">
			                <ul class="dropdown-menu " aria-labelledby="navbarDropdown">
			                  <li class="nav-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/review/myReview/${user.memberNo}" target="_self">리뷰</a>
							  </li>
			                  <li class="nav-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/community/myCommunity/${user.memberNo}" target="_self">커뮤니티</a>
							  </li>
							  
							  <li class="nav-item">
								<a class="review_submenu_link" href="${pageContext.request.contextPath}/qna/myQNA/${user.memberNo}" target="_self">Q&A</a>
							  </li>
			              	</ul>
			            </div>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->
	</div><!-- end container -->
	
<!-- ----------------------------------------END SUBMENU----------------------------------------------- -->
<div class="container" >
<div class="py-5 text-left">
   <div class="row">
   

	</div>
	
<div class="row">

<br></div>
<c:if test="${empty myQNA}">
	<p class="row justify-content-center">등록한 문의글이 없습니다.</p>
</c:if>
<div class="row">
<table id="table" class="table table-hover">

	<tr><th>제목</th><th>QNA Category</th><th>등록날짜</th></tr> 
	
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