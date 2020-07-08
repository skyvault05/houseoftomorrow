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
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content"); 
$(document).ajaxSend(function(e, xhr, options) {
  xhr.setRequestHeader(header, token);
});

$(document).ready(function() {
	   
	   <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">

	   function pageLoad(){
	      $.ajax({
	         type:"POST",
	         url:"${pageContext.request.contextPath}/channel/favoritePortfolio/checkHeart",
	         data: "membNo="+${user.memberNo}+"&&portfNo="+${portNo},
	         dataType:"json",
	         success:function(result){
	            var image = document.getElementById("favoritePortfolio");
	              if (result==1) {
	            	  $('#favoritePortfolio').css('color', '#424242');
	              } else {
	            	  $('#favoritePortfolio').css('color', 'red');          
	              }
	         }
	      });
	    };
	    
	    window.onload = pageLoad;
	    
	    function changeImage(){
	      $.ajax({
	         type:"POST",
	         url:"${pageContext.request.contextPath}/channel/favoritePortfolio/check",
	         data: "membNo="+${user.memberNo}+"&&portfNo="+${portNo},
	         dataType:"json",
	         success:function(result){
	            var image = document.getElementById("favoritePortfolio");
	            if ($('#favoritePortfolio').css('color')=='rgb(255, 0, 0)') {
	            	  $('#favoritePortfolio').css('color', '#424242');
	            	  $('#favPort').text(parseInt($('#favPort').text())-1);
	              }else {
	            	  $('#favoritePortfolio').css('color', 'red');
	            	  $('#favPort').text(parseInt($('#favPort').text())+1);
	              }
	         }
	      });}

	      $('#favoritePortfolio').on('click', changeImage);
     
	         </sec:authorize>
	});
</script>
<script>
(function (global, $) {

    var $menu     = $('.floating-menu li.m'),
        $contents = $('.scroll'),
        $doc      = $('html, body');
    $(function () {

        $menu.on('click','a', function(e){
            var $target = $(this).parent(),
                idx     = $target.index(),
                section = $contents.eq(idx),
                offsetTop = section.offset().top;
            $doc.stop()
                    .animate({
                        scrollTop :offsetTop
                    }, 800);
            return false;
        });
    });

    $(window).scroll(function(){

        var scltop = $(window).scrollTop();

        $.each($contents, function(idx, item){
            var $target   = $contents.eq(idx),
                i         = $target.index(),
                targetTop = $target.offset().top;

            if (targetTop <= scltop) {
                $menu.removeClass('on');
                $menu.eq(idx).addClass('on');
            }
            if (!(200 <= scltop)) {
                $menu.removeClass('on');
            }
        })

    });

    var btnTop = $('.btn-top');
    btnTop.on('click','a', function(e){
        e.preventDefault();
        $doc.stop()
                .animate({
                    scrollTop : 0
                },800)
    });
    
}(window, window.jQuery));

function delchk(){
    return confirm("정말로 삭제하시겠습니까?");
}

</script>

</head>
<body>
<!-- --------기존코드------------ -->
 <%-- <div class="container">
<div class="row">
<div class="col-md-8">

<img src="${port.portImg}">
<br><br>
<span class="row border col-md-12">
${port.portDescription}
</span><!-- span row end -->	
	
 <div class="rows">
    <hr id = "line" class="col-md-12"><br>
    </div>
    <div class="user_profile__conatiner">
     <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${port.channel.chNo}"><img class="user_proifle__image" src="${port.channel.chImg}"/></a><p>
     <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${port.channel.chNo}">${port.channel.constructor.conName}</a><p>
     <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${port.channel.chNo}">${port.channel.chDescription}</a>
     </div>
	<div class="rows">
	<br>
	</div>
	<div class="rows">
    <hr id = "line" class="col-md-12"><br>
    </div>
	<div class="rows">
	<a class="click" href="${pageContext.request.contextPath}/channel/guest/portfolioAll">목록으로</a><p>
	</div>
	<div class="rows">
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose>
			<c:when test="${port.channel.constructor.member.memberNo == user.memberNo}">
				<a class="click" onclick="return delchk()" href="${pageContext.request.contextPath}/channel/constructor/deletePortfolio?portNo=${port.portNo}">게시글 삭제하기</a>
			</c:when>
		</c:choose>
	</sec:authorize>
	</div>
	<br><br>	
	
</div>

</div>

</div>

<div class="col-md-4">

   <div class="rows floating-menu" style="margin-right: 130px;">
        <ul>
            <li class="m" style="margin-left: 100px;">
			<p id="topTitle"><b>포트폴리오 상세보기</b></p>
			<span id="title"><b>${port.portTitle}</b></span><p>
            <span><fmt:formatDate value="${port.portRegdate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></span><p>
            <span>시공사: ${port.channel.constructor.conName}</span><p>
            <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">            
                     <button class="btn user-profile_actions__etc" type="button">
                              <ion-icon id="favoritePortfolio" name="heart"></ion-icon>
                              <span id="favPort">${fn:length(favPort)}</span>
                     </button>
            </sec:authorize>
            </li>
        </ul>
    </div>

</div>
 --%>

 
 
 
 
 
 <!-- ------------------쟈니수정-------------------------> 
 
 <div class="container pt-5">
 	<div class="row">
		<div class="col-12 col-lg-8 card-detail__content">
			<header class="card-detail-header">
				<div class="card-detail-header__prop-list">
					<!-- <span class="card-detail-header__prop">평수 &nbsp;</span>
					<span class="card-detail-header__prop">주거형태 &nbsp;</span>
					<span class="card-detail-header__prop">스따일 &nbsp;</span> -->
				</div>
				<time class="card-detail-header__date" datetime="작성일"><fmt:formatDate value="${community.commRegdate}" pattern="yyyy년 MM월 dd일 "/></time>
			</header>
			<article class="card-detail-card">
				<div class="card-detail-card-image-wrap card-detail-card__image">
					<div class="card-detail-card-image">
						<img src="${port.portImg}" alt="마!! 사진느라!!" class="card-detail-card-image__image" />
					
					</div>
				</div>
				<div class="card-detail-card-production-list-wrap card-detail-card__production-list">
					<p class="card-detail-card__description">${port.portDescription}</p>
				</div>
				
			</article>
			<footer class="card-detail-footer">
				<p class="card-detail-footer__metadata">
					<%-- <span class="card-detail-footer__prop">조회수 &nbsp; ${community.commReadnum}</span>
					<span class="card-detail-footer__prop">댓글 &nbsp; ${fn:length(comment)}</span> --%>
				</p>
			</footer>
			
			<!-- 댓글창쉬먀!! -->
			<div class="card-detail-comment-section">
			<section class="comment-feed">
				<sec:authentication var="user" property="principal" />
				<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
					<h5 class="comment-feed__header"> 댓글 &nbsp;
						<span class="comment-feed__header__count">${fn:length(comment)}</span>	
					</h5>
					<!-- 댓글창 -->
					<form class="comment-feed__form" id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/portfolio/insertComment">
						<input type="hidden" name="portNo" value="${port.channel.chNo}"/>
		                <input type="hidden" name="membNo"  value="${user.memberNo}"/>
		                <input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
		                
						<div class="comment-feed__form__user">
							<img src="${pageContext.request.contextPath}/images/default/user_default.png" alt="" class="comm_img" />
						</div>
						<div class="comment-feed__form__input">
							<div class="comment-feed__form__content">
								<div class="comment-content-input">
									<input class="comment-content-input__text comment-feed__form__content__text" name="commCommentDescription" type="text" placeholder="내용을 입력해주세요 :)" />
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
				      <c:forEach items="${comment}" var="comment" varStatus="status">
						<li class="comment-feed__list__item">
							<article class="comment-feed__item">
								<p class="comment-feed__item__content">
									<a href="#" class="comment-feed__item__content__author">
										<img src="${pageContext.request.contextPath}/images/default/user_comment.png" alt="" class="comment-feed__item__content__author__image" />
										<span class="comment-feed__item__content__author__name">${comment.member.memberName}</span>
									</a>
									<span class="comment-feed__item__content__content">${comment.commCommentDescription}</span>
									<span class="comment-feed__item__content__date"><fmt:formatDate value="${comment.commCommentRegdate}" pattern="yyyy-MM-dd HH:mm"/></span>
									&nbsp;&nbsp;&nbsp;
									<sec:authentication var="user" property="principal" />
								    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">				
										<c:if test="${comment.member.memberNo == user.memberNo}">
											<a class ="delComment" href="${pageContext.request.contextPath}/community/deleteComment?commentNo=${comment.commCommentNo}&commNo=${comment.community.commNo}">덧글 삭제</a></p>
										</c:if>
									</sec:authorize>
								</p>
								
							</article>
						
						</li>
				     </c:forEach>
					</ul>
				</section>
			</div><!-- 댓글창 끝 -->
		</div><!-- 메인컨텐츠 끝 -->
		
		<!-- ------사이드메뉴--------- -->
 	<div class="col-12 col-lg-4 card-detail__sidebar">
 		<div class="card-detail-sidebar-wrap">
			<div class="sticky-container card-detail-sidebar" data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="131" style="position: sticky; top: 131px;">
				<div class="sticky-child card-detail-sidebar__inner">
					<div class="card-detail-sidebar__content">
						<div class="card-detail-sidebar__title">${port.portTitle}</div>
						<div class="created_at"><fmt:formatDate value="${port.portRegdate}" pattern="yyyy년 MM월 dd일 "/></div>
						<!-- 관심채널등록 -->
						<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">            
		                     <button class="btn user-profile_actions__etc" type="button" style="width:100%;">
		                              <ion-icon id="favoritePortfolio" name="heart"></ion-icon>
		                              <span id="favPort">${fn:length(favPort)}</span>
		                     </button>
		            	</sec:authorize>
						<div class="sharing_info" >
			 				<div class="label">공유하기</div>
			 				<div id="share_method" class="ui-content-share">
			 					<div class="icon share_facebook" style="width: calc(20% - 2px);"></div>
			 					<div class="icon share_kakaoStory" style="width: calc(20% - 2px);"></div>
			 					<div class="icon share_naver" style="width: calc(20% - 2px);"></div>
			 					<div class="icon share_link" style="width: calc(20% - 2px);"></div>
			 				
			 				</div>
			 			</div>	
						<div class="card-detail-writer">
							<div class="card-detail-writer__user">
								<a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${port.channel.chNo}" class="card-detail-writer__link">
									<img src="${port.channel.chImg}" alt="작성자이미지" class="card-detail-writer__image" />
									<span class="card-detail-writer__name">
										<a class="port__link" href="${pageContext.request.contextPath}/channel/guest/channelDetail/${port.channel.chNo}">${port.channel.constructor.conName}
										</a>
									</span>
								</a>
								<p class="card-detail-writer__introduction">${port.channel.chDescription}</p>
							</div>
							<button class="btn btn-primary card-detail-writer__follow" type="button">팔로우</button>
						</div>	
						<a href="/member/consultingForm?chNo=${port.channel.chNo}" class="btn btn-primary user-action__new-consultation-link"> 시공상담</a>
											
					</div>
				</div>
			</div>			
		</div>
	</div><!-- end 사이드메뉴 -->

  </div><!-- end row -->

 </div><!-- end container -->
 

 
 
</body>
</html>