
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
<style>
/* * { margin: 0; padding: 0; } */
/* body { width: 1000px; margin: 0 auto;} */
/* body { background: #fff;padding: 0; } */
img { border: 0; }
ul, ol { list-style: none; }
.header { position: relative; height: 200px; background-color: #ffccec;}
/* contents */
.section-01,.section-02,.section-03 { position: relative; height: 600px; }
.section-01 { background-color: #ffc8a2;}

/* floating menu */
.floating-menu { position: fixed; right: 0px; /* top: 50%; *//*  z-index: 100; */ width: 30%; /*  margin: -500px */ 0 0 0; /*background: url("") 0 0 no-repeat;*/ }
.floating-menu li { margin: 0; *float: left; }
.floating-menu a { display: block; width: 123px; padding: 10px 0;color: #fff; text-align: center; border: 1px solid #464646; text-decoration: none;}
.floating-menu a.menu-04 { height: 20px; background: none; }
.floating-menu li.on a { background-color: #333; color: #fff;/*background: url("") 0 0 no-repeat;*/ }
.floating-menu li.on a.menu-01 {/* background-position: -131px 0;*/ }
.floating-menu li.on a.menu-02 {/* background-position: -131px -104px;*/ }
.floating-menu li.on a.menu-03 { /*background-position: -131px -219px;*/ }

.footer { height: 100px; background-color: #707070;}

#title{
	font-size: 30px;
}

img{
	
	width: 100%;
	height: 500px;
}
#topTitle{
	font-size: 20px;
}
#commentList{
	font-size: 20px;
}
a{
	color: black;
	text-decoration: none;
}
.click{
	font-size: 20px;
	color: #33f0c0;
	font-weight: bold;
}
#content{
	width:80%;
	height: 50px;
	font-size:20px;
}
#btn{
	height: 50px;
	font-size: 20px;
	cursor: pointer;
}
.border {
	    display: inline-block;
		padding: 20px;
	  }

 }
 .delComment{
 	color: #33f0c0;
	font-weight: bold;
 	
 }
 
.btn.btn-outline-primary {
    color: #33f0c0;
    background-color: transparent;
    background-image: none;
    border-color: #33f0c0;
    
}

 
 .input-group{
  margin-left: -30px
 }
 
 .btn-center{
 	margin-left: 400px;
 }
 #btn2{
 	
	font-size: 15px;
	cursor: pointer;
	
 }
 .ch_btn_style:hover {background-color:#33f0c0!important;}
 
</style>
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
  
  <!-- WebFont -->
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
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
<%-- <div class="container pt-5">
<div class="row">
<div class="row col-md-9" >
	<img src="${community.commImg}">
</div><br><br>

<div class="commu col-md-8">
<p>${community.commDescription}
</div><!-- span row end -->
	
    
    <div class="floating-menu">
        <ul>
            <li class="m col-md-4">
            <c:choose>
				<c:when test="${community.commCategory.commCategoryNo == 5}">
					<p id="topTitle"><b>온라인 집들이</b></p>
				</c:when>
			</c:choose>
            <span id="title"><b>${community.commTitle}</b></span><p>

            <span><fmt:formatDate value="${community.commRegdate}" pattern="yyyy년 MM월 dd일 "/></span><p>
            

            <span>글쓴이: ${community.member.memberName}</span><p>
            <span>조회수: ${community.commReadnum}</span><p>
            </li>
        </ul>
    </div>
    
 </div>   
  
 <br><br>
    
	
	
    <sec:authentication var="user" property="principal" />
    <div class="w" style="margin-left: 0%; color: gray">글쓴이: ${community.member.memberNo}<p></div>
    로그인한사람: ${user.memberNo}
    <div class="rows col-md-9">
    <div class="btn-center">
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose >
			<c:when test="${community.member.memberNo == user.memberNo}">
			<a class="btn btn-outline-primary ch_btn_style" id="btn2" href="${pageContext.request.contextPath}/community/list/${community.commCategory.commCategoryNo}">목록으로</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a class="btn btn-outline-primary ch_btn_style" id="btn2" href="${pageContext.request.contextPath}/community/updateCommunity?commNo=${community.commNo}">게시글 수정하기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a class="btn btn-outline-primary ch_btn_style" id="btn2" onclick="return delchk()" href="${pageContext.request.contextPath}/community/delete?commNo=${community.commNo}&commCategoryNo=${community.commCategory.commCategoryNo}">게시글 삭제하기</a>
			</c:when>
  <c:when test="${community.member.memberNo != user.memberNo}">
			달라용
			</c:when>
		</c:choose>
	</sec:authorize>
	</div>
	</div>
	
	<br><br>
    
	
	<br>
	<div class="rows col-md-12">
	<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<div class="container ">
        <form id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/community/insertComment">
            <div class="input-group col-md-9 ">
               <input type="hidden" name="comNo" value="${community.commNo}"/>
               <input type="hidden" name="membNo"  value="${user.memberNo}"/>
               <input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
               <input type="text" class="form-control" id="content" name="commCommentDescription" placeholder="  덧글을 입력하세요.">
               <span class="input-group-btn">
                 &nbsp;<button id="btn" class="btn btn-outline-primary" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    </sec:authorize>
    </div>
    <br><br>
    <div class="rows col-md-9" style="display: inline; margin-left:10px;">
    	<h3>comment</h3> [ ${fn:length(comment)} ] 개 	
    </div>
   	<br>  
    <div class="rows col-md-9">
	<table id="table" class="table">
	<c:forEach items="${comment}" var="comment" varStatus="status">  	
		<tr>
		<td style="width: 30%">${comment.commCommentDescription}</td>
		<td style="width: 10%">${comment.member.memberName}</td>
		<td style="width: 20%"><fmt:formatDate value="${comment.commCommentRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
		<td style="width:10%">
			<sec:authentication var="user" property="principal" />
		    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">				
				<c:if test="${comment.member.memberNo == user.memberNo}">
					<a class ="delComment" href="${pageContext.request.contextPath}/community/deleteComment?commentNo=${comment.commCommentNo}&commNo=${comment.community.commNo}">덧글 삭제</a></p>
				</c:if>
			</sec:authorize>
		</td>
		</tr>
	</c:forEach>
	</table><!-- table end -->
	</div>
</div> --%>


<!-- -----------------쟈니수정쓰----------------- -->
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
						<img src="${community.commImg}" alt="마!! 사진느라!!" class="card-detail-card-image__image" />
					
					</div>
				</div>
				<div class="card-detail-card-production-list-wrap card-detail-card__production-list">
					<p class="card-detail-card__description">${community.commDescription}</p>
				</div>
				
			</article>
			<footer class="card-detail-footer">
				<p class="card-detail-footer__metadata">
					<span class="card-detail-footer__prop">조회수 &nbsp; ${community.commReadnum}</span>
					<span class="card-detail-footer__prop">댓글 &nbsp; ${fn:length(comment)}</span>
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
					<form class="comment-feed__form" id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/community/insertComment">
						<input type="hidden" name="comNo" value="${community.commNo}"/>
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

		<!-- -------------사이드메뉴ㄱㄱ------------------ -->
		<div class="col-12 col-lg-4 card-detail__sidebar">
			<div class="card-detail-sidebar-wrap">
				<div class="sticky-container card-detail-sidebar" data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="131" style="position: sticky; top: 131px;">
					<div class="sticky-child card-detail-sidebar__inner">
						<div class="card-detail-sidebar__content">
							<div class="card-detail-sidebar__title">${community.commTitle}</div>
							<div class="created_at"><fmt:formatDate value="${community.commRegdate}" pattern="yyyy년 MM월 dd일 "/></div>
							<div class="card-detail-writer">
								<a href="/user" class="card-detail-writer__link">
									<img src="${pageContext.request.contextPath}/images/default/user_default.png" alt="작성자이미지" class="card-detail-writer__image" />
									<span class="card-detail-writer__name">${community.member.memberName}</span>
								</a>
								<button class="btn btn-primary card-detail-writer__follow" type="button">팔로우</button>
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