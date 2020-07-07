<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">
  <script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>

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

<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="estimateDetail-main-wrap">
	<div class="container pt-5">
		<div class="estimateDetail page-wrapper p-t-130 p-b-100"><!--start 견적상세-->
			<div class="estimate-detail-wrap wrapper wrapper--w680">
				<div class="card card-4">
				<div class="card-body">
				
<!------------------------- 견적 요청 사항 ---------------------------->
				<div class="estimate-part row"> 
				    <div class="est-detail-title">견적 요청 사항</div>
				    <div class="est-detail-contents">
				      <ul class="estimate-item">
				      <c:forEach items="${estimate.estDetails}" var="item" >
							<li>${item.key}${item.value}</li>
					  </c:forEach>
				      </ul>
			      	</div>
			    </div>
		      
			      
<!------------------------ 추가문의 ----------------------------------->
			      <div class="estimate-item-comment row">
				      <div class="name">추가문의사항</div>
				      <div class="input-group">
				     	 <textarea class="textarea est-comment" name="response" placeholder="${estimate.estDescription}" readonly>${estimate.estDescription}</textarea>
			          </div>
		          </div> <!-- end 추가문의--->
		          
 <!--------------------------시공사답변 by 효진------------------->
		   
		        <%--   <div class="name">시공사 답변</div>
		          <div class="col-md-12">
		          	<table class="table">
                    <thead>
                        <tr class="">
                            <th class="">시공사</th>
                            <th class="" colspan='2'>내용</th>
                            <th class="">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${responseList}" var="response" varStatus="status">
                        <tr class="">
                            <td class="">${response.channel.constructor.conName}</td>
                            <td class="" colspan='2'>${response.estRespDescription}</td>
                            <td class=""><a href="/channel/guest/channelDetail/${response.channel.chNo}" class="est-title">채널 방문</a></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
		          </div>
		          
		            <br>
		            <div class="name">답변하기</div>
	              <form class="col-md-12" action="/estimate/constructor/registerEstimateResponse" method="post">
		              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		              <input type="hidden" name="chNo" value="${user.chNo}">
		              <input type="hidden" name="estNo" value="${estimate.estNo}">
		              <textarea class="textarea est-comment" name="estRespDescription" placeholder="답변할 내용을 입력해 주세요"></textarea>
		              <input type="submit" class="btn btn-primary" value="답변쓰기">
	              </form>
		               --%>
		              
		              
			        <%-- <div class="name">추가문의사항</div>
			          <div class="value">
			            <div class="input-group">
			              <div>${estimate.estDescription}11</div>
			              <br>
			              <form class="col">
			              <textarea class="textarea est-comment" name="response" placeholder="${estimate.estDescription}">${estimate.estDescription}</textarea>
			              </form>
			            </div>
			          </div> --%>
			      
			      
		<!-- --------------시공사답변 by쟌 ---------------->	
		 
		<div class="card-detail-comment-section">
			<section class="comment-feed">
			<!-- 댓글 -->
			<sec:authorize access="hasRole('ROLE_CONSTRUCTOR')"> 
				<h5 class="comment-feed__header"> 댓글 &nbsp;
					<span class="comment-feed__header__count">${responseList.size()}</span>	
				</h5>
				<!-- 댓글창 -->
				<form class="comment-feed__form" action="/estimate/constructor/registerEstimateResponse" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		            <input type="hidden" name="chNo" value="${user.chNo}">
		            <input type="hidden" name="estNo" value="${estimate.estNo}">
					<div class="comment-feed__form__user">
						<img src="${pageContext.request.contextPath}/images/default/user_default.png" alt="" class="comm_img" />
					</div>
					<div class="comment-feed__form__input">
						<div class="comment-feed__form__content">
							<div class="comment-content-input">
								<input class="comment-content-input__text comment-feed__form__content__text" name="estRespDescription" type="text" placeholder="내용을 입력해주세요 :)" />
							</div>
						</div>
						<div class="comment-feed__form__actions">
							<button class="comment-feed__form__submit btn btn-outline-primary" aria-label="등록" type="submit">등록</button>
						</div>
					
					</div>
				</form>
				</sec:authorize>
				<!-- 댓글내용 -->
				<ul class="comment-feed__list">
			      <c:forEach items="${responseList}" var="response" varStatus="status">
					<li class="comment-feed__list__item">
						<article class="comment-feed__item">
							<p class="comment-feed__item__content">
								<a href="#" class="comment-feed__item__content__author">
									<img src="${pageContext.request.contextPath}/images/default/user_comment.png" alt="" class="comment-feed__item__content__author__image" />
									<span class="comment-feed__item__content__author__name">${response.channel.constructor.conName}</span>
								</a>
								<span class="comment-feed__item__content__content">${response.estRespDescription}</span>
							</p>
							
							<div class="comment-feed__item__footer">
								<a href="/member/consultingForm?chNo=${user.chNo}" class="comment-feed__item__footer_esti">상담하기</a>
								<a href="/channel/guest/channelDetail/${response.channel.chNo}" class="comment-feed__item__footer_esti">채널방문</a>
							</div>
						</article>
					
					</li>
			     </c:forEach>
				</ul>
			</section>
		</div>
		    
		    
		    
		    
		  <!-- --------------------end 시공사답변  -->  

 				</div><!-- card body --> 
			</div><!-- end card  -->
			
			
			
			
			    </div><!-- end estimate-detail-wrap  -->
			  </div><!-- end estimateDetail -->
    
		</div><!--end 견적상세-->

	</div>
	

</div><!--end main-wrap-->
<div class="empty-space"></div>
<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->

  </body>
</html>