<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <!-- estimate style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">
  <script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>

  </head>
  
  <body>
  


<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
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

</div> 

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


  </body>
</html>