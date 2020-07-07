
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>

</style>

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
<!-- ---------------------------------- -->
<div class="container pt-5">
	<div class="row">
		<div class="col-12 col-lg-8 card-detail__content">
			<header class="card-detail-header">
				<div class="card-detail-header__prop-list">
					<span class="card-detail-header__prop">평수 &nbsp;</span>
					<span class="card-detail-header__prop">주거형태 &nbsp;</span>
					<span class="card-detail-header__prop">스따일 &nbsp;</span>
				</div>
				<time class="card-detail-header__date" datetime="작성일"></time>
			</header>
			<article class="card-detail-card">
				<div class="card-detail-card-image-wrap card-detail-card__image">
					<div class="card-detail-card-image">
						<img src="마!! 사진느라!!!" alt="" class="card-detail-card-image__image" />
					
					</div>
				</div>
				<div class="card-detail-card-production-list-wrap card-detail-card__production-list">
					<p class="card-detail-card__description">설명느라</p>
				</div>
				
			</article>
			<footer class="card-detail-footer">
				<p class="card-detail-footer__metadata">
					<span class="card-detail-footer__prop">조회수쉬먀</span>
					<span class="card-detail-footer__prop">댓글쓰</span>
				</p>
			</footer>
			
			<!-- 댓글창쉬먀!! -->
			<div class="card-detail-comment-section">
			<section class="comment-feed">
				<sec:authorize access="hasRole('ROLE_MEMBER')"> 
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
			</div><!-- 댓글창 끝 -->
		</div><!-- 메인컨텐츠 끝 -->

		<!-- -------------사이드메뉴ㄱㄱ------------------ -->
		<div class="col-12 col-lg-4 card-detail__sidebar">
			<div class="card-detail-sidebar-wrap">
				<div class="sticky-container card-detail-sidebar" data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="131">
					<div class="sticky-child card-detail-sidebar__inner">
						<div class="card-detail-sidebar__content">
							<div class="card-detail-sidebar__title">제목느셈</div>
							<div class="created_at">regDate</div>
							<div class="card-detail-writer">
								<a href="/user" class="card-detail-writer__link">
									<img src="" alt="" class="card-detail-writer__image" />
								</a>
							</div>
						</div>
					
					
					</div>
				</div>
			
			</div>
		
		</div>
	
	
	
	</div>


</div>


</body>


</html>