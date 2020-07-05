<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- bootstrap-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/bootstrap/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/plugins/jquery/jquery-3.4.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/common/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">

  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script >

</script>
  </head>
  
  <body>
  <sec:authentication property="principal" var="user"/>
    
    <!-- END header -->
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
						<a href="" class="nav-link" target="_self">내가 쓴 글</a>
					</li>
				</ul>
			</nav>
		</div>
	</div><!--end wrap-submenu-->

</div> 

<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="estimateDetail-main-wrap">
	<div class="container pt-5">
		<div class="estimateBoard"><!--start 견적게시판-->
			<div class="table-responsive req-detail" style="overflow:hidden;">
                <table class="table">
                    <thead>
                        <tr class="row">
                            <th class="text-center col-sm-2">#</th>
                  
                            <th class="text-center col-sm-6">내용</th>
                            <th class="text-center col-sm-2">작성일</th>
                            <th class="text-center col-sm-2">수정/삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${list}" var="item" varStatus="status">
                        <tr class="row">
                            <td class="text-center col-sm-2">${status.count}</td>
                            <td class="text-center col-sm-6"><a href="/viewEstimateDetail/${item.estNo}" class="est-title">견적 요청 내역</a></td>
                            <td class="text-center col-sm-2">${item.estRegdate}</td>
                            <td class="text-center col-sm-2">
                                <button type="button" rel="tooltip" class="btn btn-success btn-just-icon btn-sm" data-original-title="" title="">
                                    <i class="material-icons">edit</i>
                                </button>
                                <button type="button" rel="tooltip" class="btn btn-danger btn-just-icon btn-sm" data-original-title="" title="">
                                    <i class="material-icons">delete</i>
                                </button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
    
		</div><!--end 견적게시판-->

	</div>
	

</div><!--end main-wrap-->

<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>


    <!-- scripts -->
<!-- 	<script src="/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="/plugins/jquery/jquery-3.4.1.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>
    
	<!-- ICON -->
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  </body>
</html>