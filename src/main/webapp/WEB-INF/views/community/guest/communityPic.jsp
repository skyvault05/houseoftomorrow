<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 

<!doctype html>
<html lang="ko">
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- bootstrap-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/community/community.css">
  <!-- WebFont -->
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

  </head>
  
  <body>

  
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="empty-space"> </div>
  <!----------------------------------------- TEST ----------------------------------------->

  <div class="container">
  <div class="virtualized-list card-feed__content row">
<c:forEach items="${requestScope.list}" var="list" >
 <!-------------------- START communityPic ------------------------->
     <div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
       <div class="card-feed__item">
         <article class="card-item">
    <!-------------작성자정보------------->      
           <div class="card-item-writer">
             <address class="card-item-writer__content">
               <div class="card-item-writer__header">
                 <a href="${pageContext.request.contextPath}/community/detail/${list.commNo}" class="card-item-writer__link">
                  <!----작성자사진쓰----->
                   <img class="card-item-writer__image" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="작성자사진">
                   	<!-- 작성자이름 -->
                   <span class="card-item-writer__name">${list.member.memberId}</span>
                 </a>
                 <span class="card-item-writer__separator">
                   
                 </span>
                 <button class="card-item-writer__follow">팔로우</button>
               </div>
               <!--  -->
               <p class="card-item-writer__introduction" style="display:none;">발망치주겨버려</p>
             </address>
           </div>

<!--------사진들어가는부분☆------------->
		 <!-------사진들어가는부분쓰------->
          <div class="card-item__image">
	          <div class="card-item-image">
	            <img class="image"src="${list.commImg}" alt="등록사진">
	          </div>
	      </div>
          <!---아이콘ㄱㄱ--->
          <aside class="card-item-action-list">
            <!--좋아요-->
            <button class="card-item-action-list__action" type="button">
              <svg class="icon icon--stroke" aria-label="좋아요" fill="#fff" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path stroke="#424242" d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
              <span class="count">0</span>
            </button>
            <!--스크랩-->
            <button class="card-item-action-list__action" type="button">
              <svg class="icon icon--stroke" aria-label="스크랩" width="24" height="24" fill="#fff" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path stroke="#424242" d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
              <span class="count">0</span>
            </button>
            <!--댓글-->
            <a href="" class="card-item-action-list__action">
              <svg class="icon" aria-label="댓글 달기" fill="#fff" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="nonzero" d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z"></path></svg>

            </a>

          </aside>
          <!------사용자 정보가져오긔----->
          <div class="card-item__content" id="">
            <a href="${pageContext.request.contextPath}/community/detail/${list.commNo}" class="card-item__content__link"></a>
            <div class="expandable-text card-item-description card-item__description expandable">${fn:substring(list.commTitle, 0, 10)}</div>
            
          </div>

<!---------------------댓글보여주긔☆-------------------->
          <div class="card-item-comment-wrap">
            <article class="card-item-comment">
              <address class="card-item-comment__writer">
                <a href="" class="card-item-comment__writer__link">
                  <img class="card-item-comment__writer__image" src="${pageContext.request.contextPath}/images/default/user_comment.png" alt="댓글단사람사진">
                  <span class="card-item-comment__writer__name">${list.commentList[list.commentList.size() - 1].member.memberName}</span>
                </a>
                <span class="card-item-comment__writer__separator">:</span>
              </address>
              <a href="" class="card-item-comment__link">
                <p class="card-item-comment__content">${list.commentList[list.commentList.size() - 1].commCommentDescription}</p>
              </a>
            </article>
          </div>
  <!-----end comment------>

         </article><!----end card-item----->
       </div><!--end card-feed__item-->
       
     </div><!-- END community Pic-->
</c:forEach>
    </div><!--end row-->
    </div>
 




<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->



  </body>

</html>