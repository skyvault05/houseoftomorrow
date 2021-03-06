<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri ="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html> <html lang="ko"> <head> <title>내일의 집</title>
<meta charset="utf-8"> <meta name="viewport" content="width=device-width,
initial-scale=1, shrink-to-fit=no">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<sec:authentication var="user" property="principal" />
<script >
   var token = $("meta[name='_csrf']").attr("content");
   var header = $("meta[name='_csrf_header']").attr("content"); 
   $(document).ajaxSend(function(e, xhr, options) {
     xhr.setRequestHeader(header, token);
   });

   $(document).ready(function() {
         $('.user-profile_actions__etc').click(function() {
         
         $('.drop-down__list').toggleClass('open');
         //$('.drop-down__list').removeClass('open');
      });
   <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">

   function pageLoad(){
      $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/channel/favoriteChannel/checkHeart",
         data: "membNo="+${user.memberNo}+"&&chaNo="+${chNo},
         dataType:"json",
         success:function(result){
            var icon = $('#favoriteChannel');
              if (result==1) {            	  
            	  $('#favoriteChannel').css('color', '#424242');
              } else if(result==2) {
            	  $('#favoriteChannel').css('color', 'red');            	  
              }
         }
      });
    };
    
    window.onload = pageLoad;
    
    function changeImage(){
      $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/channel/favoriteChannel/check",
         data: "membNo="+${user.memberNo}+"&&chaNo="+${chNo},
         dataType:"json",
         success:function(result){
              if ($('#favoriteChannel').css('color')=='rgb(255, 0, 0)') {
            	  $('#favoriteChannel').css('color', '#424242');
            	  $('#favNo').text(parseInt($('#favNo').text())-1);
              }else {
            	  $('#favoriteChannel').css('color', 'red');
            	  $('#favNo').text(parseInt($('#favNo').text())+1);
              }
         }
      });}

      $('#favoriteChannel').on('click', changeImage);
      
      function insertReview(){
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/channel/check/impossibleReview",
            data: "memberNo="+${user.memberNo}+"&&chNo="+${chNo},
            dataType:"json",
            success:function(result){
            }
            
         });}

         $('#insertReview').on('click', insertReview);
         
         </sec:authorize>
});
</script>
  </head>
  
  <body>
  <div class="container-flude submenu_borderbottom">

   <div class="wrap-submenu">
      <div class="mypage-nav">
         <nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
            <ul class="navbar-nav mypage">
               <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${chNo}" class="nav-link ch_detail" target="_self">모두보기</a>
               </li>
               <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/review/reviewList/${chNo}" class="nav-link ch_detail" target="_self">리뷰</a>
               </li>
               <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/channel/guest/channelPortfolio/${channel.chNo}" class="nav-link ch_detail" target="_self">포트폴리오</a>
               </li>
            </ul>
         </nav>
      </div>
   </div><!--end wrap-submenu-->
</div>


<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
<div class="channel-main-wrap">
   
   <div class="channel-profile container">   
      <div class="channel-profile row">
      <div class="col-12 col-lg-3 wrap-profile"><!--start aside menu-->
         <div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="0" class="sticky-container">
         <!-- <div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="80" class="sticky-container profile"> -->
            <div class="sticky-child channel" style="position:relative">
               <div class="user_profile">
                  <div class="user_profile__conatiner"><!--업체사진, 이름, 별점-->
                     <div class="user_proifle__image">
                        <img src="${channel.chImg}" alt="시공사프로필사진"/>
                     </div>
                     <div class="user_profile__info">
                        <div class="profile_name">
                           <span>${channel.constructor.conName}</span>
                        </div>
                        <div class="profile_info_reviews">
                           <a class="profile_info_reviews__link" href="#/users/2112978/reviews"><span class="profile_info_reviews_stars" aria-label="별점 5.0점">
                              <span class="profile-info_reviews__count">${channel.chGrades}</span>
                              <c:forEach begin="1" end="${channel.chGrades}">
                              <svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
                              </c:forEach>
                           </a>
                      
                        </div><!-- end profile_info_reviews-->
                     </div><!--user_proifle__info-->
                  </div><!--user_proifle__conatiner-->
                 
                  <div class="user_profile__consultation pb-4" ><!--상담하기-->
                     <div class="user_profile__btn-actions">
                     	<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()"> 
                     	<c:choose>
                     	<c:when test="${user.memberNo==channel.constructor.memberNo}">
                          <a class="btn btn-primary user-profile_actions_action" href="${pageContext.request.contextPath}/channel/constructor/portfolioForm">포트폴리오등록</a>
                        </c:when>
                        <c:otherwise>
                        	<c:choose>
                        		<c:when test="${isNotConstructor}">
                          			<a class="btn btn-primary user-profile_actions_action" href="${pageContext.request.contextPath}/member/consultingForm?chNo=${channel.chNo}">상담신청</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a class="btn btn-primary user-profile_actions_action" href="#">상담불가</a>
                        		</c:otherwise>
                        	</c:choose>
                        </c:otherwise>
                        </c:choose>
                        </sec:authorize>
                        <div class="drop-down user-profile_actions_etc-wrap">
                           <button class="btn user-profile_actions__etc" type="button">
                              <ion-icon id="favoriteChannel" name="heart"></ion-icon>
                              <span id="favNo">${fn:length(favCh)}</span>
                           </button>
                           
                           <!-- ----------팔로우 dropdown------------ -->
                          <%--  <ul class="drop-down__list">
                              <li>
                              <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
                                 <a href="${pageContext.request.contextPath}/channel/check/impossibleReview?memberNo=${user.memberNo}&chNo=${chNo}" id="insertReview">리뷰쓰기</a>
                                 <a href="${pageContext.request.contextPath}/review/reviewList/${chNo}">전체보기</a></span>
                              </sec:authorize>
                              <button type="button">팔로우</button></li>
                           </ul> --%>
                           
                        </div>
                     </div>      
                     <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">            

                 

                    <!--  <img style="cursor: pointer; width: 15%; height: 15%;" id="favoriteChannel"  src="/plugins/images/heart_off.png"/> -->
                     <%-- <strong>${fn:length(favCh)}</strong> --%>

                     </sec:authorize>
                  </div><!--end 상담하기-->
                  
                  <div class="profile_info_about"><!--업체정보-->
                     <div class="expandable-text user-profile_about">
                        <c:set var="addrSplit" value="${fn:split(channel.constructor.conAddr, ' ')}" />
                        <table class="user-profile_about_table">
                              <tr>
                                 <th class="row">위치</th>
                                 <td class="row">${addrSplit[1]} ${addrSplit[2]}</td>
                              </tr>
                              <tr>
                                 <th class="row">경력</th>
                                 <td class="row">${channel.constructor.conCareer}</td>
                              </tr>
                              <tr>
                                 <th class="row">소개</th>
                                 <td class="user-profile_about_about row">${channel.chDescription}</td>                                 
                              </tr>
                           </table>
                        </div>
                        
                  </div><!--end 업체정보-->


                </div><!--end user_proifle -->
            </div><!-- end sticky-child channel -->
         </div><!-- sticky-container profile -->
      </div><!--END aside-->


      <!--start contents-->
      <div class="profile__content col-12 offset-lg-1 col-lg-8 pt-5"> <!--start contents-->
         <div class="channel_review">
            <!--고객리뷰-->
            <section class="post post--reviews">
               <h5 class="post__title">고객들의 리뷰 <strong>${fn:length(realReviewList)}</strong>
                  <span class="post__title__show-all">
                  <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
                  	<c:if test="${reviewRight}">
                     <a href="${pageContext.request.contextPath}/channel/check/impossibleReview?memberNo=${user.memberNo}&chNo=${chNo}" id="insertReview">리뷰등록</a>
                  	</c:if>
                  </sec:authorize>
                  <a href="${pageContext.request.contextPath}/review/reviewList/${chNo}">전체보기</a></span>
               </h5>
               <div class="row post--reviews__list">
               <c:forEach items="${list}" var="list">
                  <a style="text-decoration: none" class="col-12 col-md-6 post--reviews__item-wrap" href="${pageContext.request.contextPath}/review/readReview/${list.reviewNo}">
                     <div class="post--reviews__item">
                        <div class="post--reviews__contents">
                           <div class="post--reviews__contents__text">
                              <p>${list.reviewDescription}</p>
                              <div class="post--reviews__writer">
                                 <img class="post--reviews__writer__profile" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 3x"/>
                                 <span class="post--reviews__writer__name">${list.member.memberName} 고객님</span>
                                 <span class="post--reviews__writer__rating" aria-label="별점 ${list.reviewGrade}점">
                                 <c:forEach begin="1" end="${list.reviewGrade}">
	                             	 <svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
	                              </c:forEach>
                                 </span>
                              </div>
                           </div>
                           <img class="post--reviews__contents__img" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=72" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=80 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=144 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=160 3x"/></div>
                        </div>
                     </a>
                     </c:forEach>
                  </div><!--row post--reviews__list-->
            </section><!--end 고객리뷰-->

            <!--포트폴리오-->
            <section class="post post--projects">
               <h5 class="post__title">포트폴리오 <strong>${realPortList.size()}</strong>
                  <span class="post__title__show-all">
                  <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	                  <c:if test="${user.memberNo == channel.constructor.member.memberNo}">
	                  	<a class="" href="/channel/constructor/portfolioForm">포트폴리오 쓰기</a>
	                  </c:if>
                  </sec:authorize>
                  <a class="" href="${pageContext.request.contextPath}/channel/guest/channelPortfolio/${channel.chNo}">전체보기</a>
                  </span>
               </h5>
               <div class="post--contents__list-wrap">
                  <div class="row post--contents__list" style="transform:translateX(-0px)">
                     <c:forEach items="${portList}" var="port">
                        <div class="col-6 col-md-3 post--contents__item-wrap">
                           <a href="/channel/guest/portfolioDetail/${port.portNo}">
                              <div class="post--contents__item">
                                 <div style="position:relative">
                                    <img class="post--contents__item__img" src="${port.portImg}" style="width: 100%; height: 170px;"/>
                                 </div>
                                 <p class="card-text title" style="color: black">${port.portTitle}</p>
                              </div>
                           </a>
                        </div>
                     </c:forEach>
                  </div>
               </div>
         </section>
         </div>

      </div><!--END contents-->

                  
   </div><!--end channel-profile row-->   
   </div><!--end channel-profile container-->
</div><!--end main-wrap-->

<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>
<!-- start footer -->
    
   

  </body>
</html>