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
  <div class="container pt-5">
    <div class="community-main row">
<!-------------------- main img ------------------------->
      <div class="col-12 col-md-9 community_main_img">
        <article class="comm-main-image">
          <a href="#" class="main-img-link">
            <!--image-->
            <div class="main-img-wrap hover_effect hover_effect_card">
              <img src="${pageContext.request.contextPath}/images/community/main_img.jpg" alt="커뮤니티 메인 이미지" class="main-image"/>
            </div>
            <!--contents-->
            <div class="main-img-content-wrap">
              <div class="main-img-content-info">
                <div class="main-img-content__title">타이틀이라고여 팍씨ㅡㅡ</div>
                <div class="main-img-content__profile">
                  <img class="content__profile__image" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="사용자프로필사진">
                  <span class="content__profile__name">곽두팔</span>
                </div>
              </div>
              <div class="main-img-content-viewmore">보러가기</div>
            </div>
            <!--end content-->
          </a>
        </article>
      </div> <!--end main img-->
<!-------------------- main slider ------------------------->
      <div class="col-12 col-md-3 community_main_sideslider">
    <!-------------------carousel--------------------->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active hover_effect">
              <img class="h-100" src="${pageContext.request.contextPath}/images/community/slide01.png" alt="First slide" height="550px">
            </div>
            <div class="carousel-item hover_effect">
              <img class="h-100" src="${pageContext.request.contextPath}/images/community/slide02.png" alt="Second slide">
            </div>
            <div class="carousel-item hover_effect">
              <img class="h-100" src="${pageContext.request.contextPath}/images/community/slide03.png" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div><!--end carousel-->


      </div><!--end slider-->
    </div><!--end row-->
  </div><!--end container-->



<!-- 오늘의스토리 -->
    <section class="container comm-todays-stories">
      <header class="row home-section__header">
        <h2 class="col home-section__header__content mb-4"> 오늘의 스토리 </h2>
      </header>
      <ul class="row home-stories__content">
      <c:forEach items="${knowHowList}" var="item">
        <li class="col-6 col-md-3 home-stories__content__item">
          <article class="story-entry story-story-item">
            <a class="story-entry-link" href="/community/guest/detail/${item.commNo}">
              <div class="story-entry__image-wrap hover_effect_card">
                <img class="story-entry__image" alt="" src="${item.commImg}">
              </div>
              <div class="story-entry__content-wrap">
                <div class="story-entry__content">
                  <div class="story-entry__content__title">${item.commTitle}<br> </div>
                  <div class="story-entry__content__profile">
                    <img class="story-entry__content__profile__image " src="./images/default/user_default.png">
                    <span class="story-entry__content__profile__name">${item.member.memberName}</span>
                  </div>
                </div>
              </div>
            </a>
          </article>
        </li>
	   </c:forEach>
  <!--------------우측메뉴-------------->
    <div class="col-6 col-md-3 home-stories__content__menu-wrap">
      <div class="home-stories__content__menu">
        <a href="" class="home-stories__content__menu__entry">
          <div class="description">예쁜 집 구경하기</div>
          <div class="title">
            <span class="text">사진</span>
              <div class="arrow"></div>
            </div>
        </a>
        <a href="" class="home-stories__content__menu__entry">
          <div class="description">인테리어 꿀팁 총 집합</div>
          <div class="title">
            <span class="text">노하우</span>
            <div class="arrow"></div>
          </div>
        </a>
                  
      </div>
    </ul>
  </div><!--우측메뉴 end-->
</section>

<!-------- 오늘의 인기사진 ------------>
 <section class="container home-section home-cards pt-5">
  <div class="row home-section__header"> 
    <h2 class="col home-section__header__content"> 오늘의 인기 사진</h2>
    <a class="home-section__header__more home-hide-sm" href="#">더보기</a>
  </div>

    <ul class="row home-cards__content">
      <c:forEach items="${commPicList}" var="item">
      <li class="col-6 col-md-3 home-cards__content__item">
        <articel class="story-entry story-card-item">
          <a class="story-entry-link" href="/community/guest/detail/${item.commNo}" >
            <div class="story-entry__image-wrap hover_effect_card">
              <img src="${item.commImg}" alt="" class="story-entry__image">
            </div>
            <div class="story-entry__content-wrap">
              <div class="story-entry__content">
                <div class="story-entry__content__profile">
                  <img class="story-entry__content__profile__image" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="">
                </div>
                <span class="story-entry__content__profile__name">${item.member.memberName}</span>
              </div>
            </div>  
          </a>
        </articel>
      </li>
      </c:forEach>   
    </ul>

    </div><!--row-->

  </section>

<!----------------유저들의인테리어시공리뷰-------------------------->
<%-- <div class="empty-space"></div>
  <section class="container home-section home-experts pt-5">
    <div class="row home-section__header"> 
    <h2 class="col home-section__header__content">유저들의 인테리어 시공리뷰</h2>
    <a class="home-section__header__more home-hide-sm" href="#">인테리어 전문가 더 찾기</a>
  </div>
  <div class="row home-experts__content">
    <div class="col-12 col-md-4 home-expert-review">
      <a class="home-expert-review__link" href="">
        <div class="home-expert-review__wrapper hover_effect_card">
          <img class="home-expert-review__wrapper__img" src="${pageContext.request.contextPath}/images/default/thumbnail.png" alt="">
        </div>
        <div class="home-expert-review__content-wrapper">
          <span class="home-expert-review__content-wrapper__star">
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
      
          </span>
          <div class="home-expert-review__content-wrapper__descript">
            리뷰리뷰설명설명웅앵웅
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus justo leo, non sollicitudin enim tincidunt in. Nam ac mattis ligula. Pellentesque id erat nec leo congue eleifend. Nunc porta odio ipsum, id dictum leo posuere in. 
          </div>
          <div class="home-expert-review__content-wrapper__expert-user">
            <img class="home-expert-review__content-wrapper__expert-user__img" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="" >
            <span class="home-expert-review__content-wrapper__expert-user__name">시공업체</span>
          </div>
        </div>
      </a>
    </div>
    <div class="col-12 col-md-4 home-expert-review">
      <a class="home-expert-review__link" href="">
        <div class="home-expert-review__wrapper hover_effect_card">
          <img class="home-expert-review__wrapper__img" src="${pageContext.request.contextPath}/images/default/thumbnail.png" alt="">
        </div>
        <div class="home-expert-review__content-wrapper">
          <span class="home-expert-review__content-wrapper__star">
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
      
          </span>
          <div class="home-expert-review__content-wrapper__descript">
            리뷰리뷰설명설명웅앵웅
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus justo leo, non sollicitudin enim tincidunt in. Nam ac mattis ligula. Pellentesque id erat nec leo congue eleifend. Nunc porta odio ipsum, id dictum leo posuere in. 
          </div>
          <div class="home-expert-review__content-wrapper__expert-user">
            <img class="home-expert-review__content-wrapper__expert-user__img" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="" >
            <span class="home-expert-review__content-wrapper__expert-user__name">시공업체명☆</span>
          </div>
        </div>
      </a>
    </div>
    <div class="col-12 col-md-4 home-expert-review">
      <a class="home-expert-review__link" href="">
        <div class="home-expert-review__wrapper hover_effect_card">
          <img class="home-expert-review__wrapper__img" src="./images/default/thumbnail.png" alt="">
        </div>
        <div class="home-expert-review__content-wrapper">
          <span class="home-expert-review__content-wrapper__star">
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
            <svg fill="#35C5F0" width="15px" height="15px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
      
          </span>
          <div class="home-expert-review__content-wrapper__descript">
            리뷰리뷰설명설명웅앵웅
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus justo leo, non sollicitudin enim tincidunt in. Nam ac mattis ligula. Pellentesque id erat nec leo congue eleifend. Nunc porta odio ipsum, id dictum leo posuere in. 
          </div>
          <div class="home-expert-review__content-wrapper__expert-user">
            <img class="home-expert-review__content-wrapper__expert-user__img" src="${pageContext.request.contextPath}/images/default/user_default.png" alt="" >
            <span class="home-expert-review__content-wrapper__expert-user__name">시공업체</span>
          </div>
        </div>
      </a>
    </div>




  </div><!--end row-->
  </section> --%>
  </body>
</html>