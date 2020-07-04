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

  
  <!-- WebFont -->
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

  </head>
  
  <body>

    <header role="banner">
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand " href="/common/index">HOT</a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    
    <!--------------------------------------main menu--------------------------------------------->
          <div class="collapse navbar-collapse btnCollapse" >
            <ul class="navbar-nav ">
              <li class="nav-item dropdown pl-md-5">
              <a href="/community/guest/communityMain" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">커뮤니티 </a>
             <div class="dd-wrap">
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="/community/guest/communityMain" >커뮤니티홈</a></li>
                <li><a class="dropdown-item" href="#">사진</a></li>
                <li><a class="dropdown-item" href="#">노하우</a></li>
                <li><a class="dropdown-item" href="#">질문과답변</a></li>
              </ul>
              </div>
            </li>

            <li class="nav-item dropdown ">
              <a href="/common/index" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">인테리어시공</a>
              <div class="dd-wrap">
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="/common/index">시공홈</a></li>
                  <li><a class="dropdown-item" href="/estimate">견적요청</a></li>
                  <li><a class="dropdown-item" href="#">전문가찾기</a></li>
                  <li><a class="dropdown-item" href="#">포트폴리오</a></li>
              	</ul>
              </div>
            </li>
           </ul>
    <!--------------------------------------sub menu--------------------------------------------->
            <div class="navbar-nav ml-auto">
              <form method="post" class="search-form" >
                <span class="icon ion ion-search pt-2"><ion-icon name="search-outline"></ion-icon></span>
                <input type="text" class="form-control col-sm-12" placeholder="Search">
              </form>
              <button type="button" class="btn btn-outline-primary">글쓰기</button>
              
   <!------------------------------ 로그인/회원가입 -------------------------------->
	<sec:authorize access="isAnonymous()">
   			  <div class="header_navigation-bar-login pl-1">
   			  	<a class="navigation-bar-login__item aftermenu" href="/member">로그인</a>
   			  	<a class="navigation-bar-login__item signup-margin-right" href="/memberSignup">회원가입</a>
   			  </div>
 	</sec:authorize>

   <!------------------------------로긴성공시 마이페이지메뉴  ---------------------->
  
   	<sec:authorize access="isAuthenticated()">
   	
   			<div class="iconmenu pl-1">
              <div class="header_social_icon d-flex">
              	
                <ion-icon name="bookmark-outline" class="icon ion"></ion-icon>
                <!-- <a href="#" class="dropdown-toggle menuicon" data-toggle="dropdown">
                  <ion-icon name="bookmark-outline" class="icon ion"></ion-icon>
                </a>
                <div class="dropdown-menu submenu">
                  <a href="#" class="dropdown-item favoriteChannel">관심채널</a>
                  <a href="#" class="dropdown-item favoritePortfolio">관심포트폴리오</a>
                </div> -->
                <ion-icon name="notifications-outline" class="icon ion"></ion-icon>
                <div class="dropdown submenu">  
                  <a href="#" class="dropdown-toggle menuicon" data-toggle="dropdown">
                    <ion-icon name="happy-outline" class="icon ion mypage"></ion-icon>
                  </a>
                  <div class="dropdown-menu submenu box shadow">
                    <a href="#" class="dropdown-item updateInfo">회원정보수정</a>
                    <a href="/myEstimateList/${user.memberNo}" class="dropdown-item myCounsel">견적요청내역</a>
                    <a href="#" class="dropdown-item writeList">내가쓴글</a>
                    <a href="/logout" class="dropdown-item logout">로그아웃</a>
                  </div>
                </div>
                </div>
              </div><!--end submenu header icon-->
	</sec:authorize>
            </div>
            <!--END submenu-->
          </div><!--collapse navbar-collapse btnCollapse-->
        </div><!--end container-->
      </nav>
  <!--END main menu--->
  </header>
  <!-- END header -->
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
  <!-- main slider -->
    <div class="container pt-5">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="https://dummyimage.com/1920x500/ededed/fff" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://dummyimage.com/1920x500/5c9c17/fff" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://dummyimage.com/1920x500/21169c/fff" alt="Third slide">
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
    </div>
    </div>
    <!--END main slider -->

<!-- main sub btns -->
    <div class="section">
      <div class="container">
        <div class="container expert-home__menu">
      <div class="expert-home__menu__list expert-home__menu__list--no--sticky">
            <a class="expert-home__menu__list__menu" href="#"><svg class="icon" width="36" height="36" viewBox="0 0 36 36" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path d="M0 0h36v36H0z"></path><g fill-rule="nonzero" transform="translate(4 2)"><rect fill="#FFF" id="a" width="22" height="32" rx="4"></rect><rect width="21" height="31" x=".5" y=".5" stroke="#000" stroke-linejoin="square" rx="4"></rect></g><path stroke="#000" stroke-linecap="round" d="M13 5.5h4"></path><g><g fill-rule="nonzero" transform="translate(12.2 8)"><path fill="#E4F2F6" id="c" d="M12 0c5.965 0 10.8 4.126 10.8 9.216 0 5.09-4.835 9.216-10.8 9.216-2.598 0-4.982-.783-6.845-2.087L.302 17.61l2.365-3.753C1.734 12.493 1.2 10.908 1.2 9.216 1.2 4.126 6.035 0 12 0z"></path></g><path fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M24.2 8C30.165 8 35 12.2 35 17.383c0 5.182-4.835 9.383-10.8 9.383-2.512 0-4.824-.745-6.659-1.995l-5.83 1.434 2.909-4.486a8.376 8.376 0 0 1-1.22-4.336C13.4 12.201 18.235 8 24.2 8z"></path><path stroke="#000" stroke-linecap="round" d="M19.4 14.6H29M19.4 17.6H29M19.4 20.6h4.8"></path></g></g></svg><span class="expert-home__menu__list__menu__name">맞춤업체추천</span></a>
            <a class="expert-home__menu__list__menu" href="#"><svg class="icon" width="36" height="36" viewBox="0 0 36 36" preserveAspectRatio="xMidYMid meet"><defs></defs><g fill="none" fill-rule="evenodd"><path fill="#FFF" d="M7.9 9.8h25.5L31 22.9a3.4 3.4 0 01-3.2 2.7h-14c-1.5 0-3-1.2-3.3-2.7L8 9.8z"></path><path fill="#EDEDED" d="M33.4 9.8L31 22.9a3.4 3.4 0 01-3.2 2.7h-14c-1.4 0-2.7-1-3.1-2.2l1 .2h15c1 0 1.9-.8 2-1.7L31 9.8h2.4z"></path><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M7.9 9.8h25.5L31 22.9a3.4 3.4 0 01-3.2 2.7h-14c-1.5 0-3-1.2-3.3-2.7L8 9.8zM2.3 7.2c.2-.9 1-1.6 2-1.8h.1c1.4-.3 2.7.6 3 2L8 9.8"></path><path fill="#B1C0CB" d="M14 28.5a2.5 2.5 0 115 0 2.5 2.5 0 11-5 0zm9 0a2.5 2.5 0 115 0 2.5 2.5 0 11-5 0z"></path><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M14 28.5c0-1.4 1.1-2.5 2.5-2.5h0c1.4 0 2.5 1.1 2.5 2.5h0c0 1.4-1.1 2.5-2.5 2.5h0a2.5 2.5 0 01-2.5-2.5h0zm9 0c0-1.4 1.1-2.5 2.5-2.5h0c1.4 0 2.5 1.1 2.5 2.5h0c0 1.4-1.1 2.5-2.5 2.5h0a2.5 2.5 0 01-2.5-2.5h0zM9.6 15.1H32m-18-4.8L15.4 25M26.8 10.3L25.4 25M20.4 10V25m-10.2-4.7h20.6"></path><path d="M0 0h36v36H0z"></path></g></svg><span class="expert-home__menu__list__menu__name">시공스토어</span></a>
            <a class="expert-home__menu__list__menu" href="#"><svg class="icon" width="36" height="36" viewBox="0 0 36 36" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><g><path d="M0 0h36v36H0z"></path><path fill="#FFF" d="M15.2 24.918h5.4a7.2 7.2 0 0 1 7.2 7.2v1.8H8v-1.8a7.2 7.2 0 0 1 7.2-7.2z"></path><path fill="#EDEDED" fill-opacity=".14" d="M20.6 24.918c1.199 0 2.33.293 3.324.811-1.687 1.166-3.843 1.772-6.191 1.772-2.28 0-4.378-.571-6.042-1.67a7.152 7.152 0 0 1 3.509-.913h5.4z"></path><path fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M8 33.587v-1.672c0-3.153 2.35-5.781 5.469-6.377m8.496-.006c3.134.584 5.5 3.22 5.5 6.383v1.672"></path><g fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round"><path d="M13.645 25.606v3.18M21.82 25.606v3.18"></path></g><path fill="#B1C0CB" fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M11.893 33.918l1.062-5.003h9.555l1.062 5.003"></path><path fill="#FFF6E6" fill-rule="nonzero" d="M25.04 15.29c.31.907.479 2.291.479 3.314 0 4.642-3.486 7.197-7.786 7.197-4.3 0-7.786-2.555-7.786-7.197 0-1.023.169-2.407.479-3.314"></path><path fill="#EDE2CD" fill-rule="nonzero" d="M10.426 15.29h14.613c.164.478.288 1.09.37 1.71H10.056c.081-.62.205-1.232.369-1.71z"></path><path fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M25.04 15.29c.31.907.479 2.291.479 3.314 0 4.642-3.486 7.197-7.786 7.197-4.3 0-7.786-2.555-7.786-7.197 0-1.023.169-2.407.479-3.314"></path><path fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M19.29 21.908c-.227.454-.839.779-1.557.779-.72 0-1.331-.325-1.558-.78"></path><g fill-rule="nonzero" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.3"><path d="M15.007 18.547v-.545M20.458 18.547v-.545"></path></g><path fill="#FFDB92" d="M16.753 4.518h1.9a8.1 8.1 0 0 1 8.1 8.1v1.9h-18.1v-1.9a8.1 8.1 0 0 1 8.1-8.1z"></path><path fill="#FFDB92" d="M15 4h5v2h-5z"></path><path fill="#EFC570" d="M12.5 6l2.884 4.723V4.82zM22.937 6l-2.884 4.723V4.82z"></path><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" d="M8.753 12.76c0-4.08 2.893-7.446 6.631-7.939v-.303c0-.553.424-1 .948-1h2.842c.523 0 .947.447.947 1v.303c3.739.493 6.632 3.859 6.632 7.939"></path><path stroke="#000" stroke-linecap="round" d="M15.384 6.518v-2c0-.553.424-1 .948-1h2.842c.523 0 .947.447.947 1v2"></path><path fill="#F5F5F5" fill-rule="nonzero" stroke="#000" stroke-linecap="round" d="M7.208 15.018h20.686"></path></g></g></svg><span class="expert-home__menu__list__menu__name">우리지역업체</span></a>
          </div><!-- End expert-home__menu -->
          <a class="expert-home__info" href="/experts/trust_points">
            <div class="expert-home__info__wrap">
              <span class="expert-home__info__title">오늘의집 인테리어시공 서비스는</span>
              <div class="expert-home__info__margin"></div>
              <span class="expert-home__info__explain">업체의 전문성을 직접 검증합니다.</span>
            </div>
            <svg class="icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><g fill="#1778BA" fill-rule="evenodd"><path d="M12 .429c6.39 0 11.571 5.18 11.571 11.571 0 6.39-5.18 11.571-11.571 11.571C5.61 23.571.429 18.391.429 12 .429 5.61 5.609.429 12 .429zm.214 15.428a1.071 1.071 0 1 0 0 2.143 1.071 1.071 0 0 0 0-2.143zm0-9.214a3.19 3.19 0 0 0-3.209 3.03L9 9.856h1.286c0-1.086.85-1.928 1.928-1.928 1.067 0 1.91.823 1.929 1.892-.056.423-.249.833-.592 1.239-.082.097-.17.186-.272.275-.063.055-.13.11-.213.175l-.234.18c-.852.659-1.22 1.306-1.257 2.639l-.004.242h1.286c0-1.088.165-1.403.761-1.864l.24-.184c.1-.079.186-.149.27-.223.147-.13.28-.262.404-.41.455-.536.744-1.115.858-1.73l.035-.231.004-.072c0-1.799-1.429-3.214-3.215-3.214z"></path></g></svg>
          </a><!-- END expert-home__info -->
      </div>
     </div><!--container end-->
    </div><!-- section end -->
<!--End main sub btns-->

<!-- recommendation portfolio -->

    <section class="recommendation portfolio">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                  <h2 class="portfolio-title mb-4">추천 포트폴리오 </h2>
                  <!-- 포트폴리오 등록버튼 -->
                  
           
                  
                	<button type="button" onclick="location.href='${pageContext.request.contextPath}/channel/constructor/myChannel'"> 마이 채널 </button>
                  
                  
                
                  
                  <!-- 웅희 편집 부분 -->
                  
                  
                  <div class="card-wrap">
                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                   

                </div><!--end card -->
    
            </div>

            <div class="col-xl-12 pt-5">
                  <div class="card-wrap">
                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">감성충만, 홈카페를 품은 한강뷰 목조주택</p>
                          <div class="card-text content">코원하우스</div>
                        </div>
                    </div>

                   

                </div><!--end card -->
    
            </div>



            </div><!--end row-->
        </div><!--end container-->
    </section>
    <!-- END recommendation portfolio -->

<div class="empty-space"></div>
<!-- join constructor btn-->
 <section class="join-constructor-btn">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 pt-5"> 
          <a href="#"><img src="${pageContext.request.contextPath}/images/default/main_company_btn.jpg" class="img-fluid rounded" alt="시공사 회원가입 바로가기"></a>
                </div>
            </div>
        </div>
</section>
<!-- END  join constructor btn-->

<div class="empty-space"></div>

<!-- recomm constructor -->
 <section class="recomm-constructor">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 pt-5">
                  <h2 class="portfolio-title mb-4">추천 시공사</h2>
                  <div class="card-wrap">
                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <div class="card-text-profile"></div>
                          <div class="card-text-summary">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <div class="card-text-profile"></div>
                          <div class="card-text-summary">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <div class="card-text-profile"></div>
                          <div class="card-text-summary">코원하우스</div>
                        </div>
                    </div>

                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${pageContext.request.contextPath}/images/default/thumbnail.png" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <div class="card-text-profile"></div>
                          <div class="card-text-summary">코원하우스</div>
                        </div>
                    </div>
                </div><!--end card -->
               </div>
              </div><!--row-->
             </div><!--container-->
         </section>
<!-- END recomm constructor  -->
<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->

<div class="empty-space"></div>
<!-- start footer -->
    <footer class="site-footer" role="contentinfo">
      <div class="container">
    <footer class="layout-footer">
      <div class="layout-footer__content">
        <div class="layout-footer__top row">
          <address class="layout-footer__cs col-8">
            <div class="layout-footer__cs__row ">
              <a class="layout-footer__cs__link" href="/customer_center">고객센터<svg class="icon" aria-hidden="true" width="1em" height="1em" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="nonzero" d="M6 19.692L8.25 22 18 12 8.25 2 6 4.308 13.5 12z"></path></svg></a>
            </div>
            <div class="layout-footer__cs__row">
              <a class="layout-footer__cs__tel" href="tel:1670-0876">1670-0876</a>
            </div>
            <span class="layout-footer__cs__time">평일 10:00~17:00 (점심시간 12:00~13:00 / 주말&amp;공휴일 제외)</span>
          </address>
          <div class="layout-footer__outbound col-4 right">
            <a class="layout-footer__outbound__item" href="https://itunes.apple.com/" target="_blank" rel="noreferrer noopener" title="앱스토어" aria-label="앱스토어"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M22.34 15.57a5.6 5.6 0 0 0 3.42 5.15c-.02.1-.53 1.84-1.78 3.62-1.05 1.57-2.15 3.1-3.9 3.13-1.69.04-2.26-1-4.2-1-1.96 0-2.57.97-4.2 1.04-1.65.06-2.92-1.67-4-3.23-2.18-3.17-3.87-8.93-1.6-12.85a6.23 6.23 0 0 1 5.24-3.2c1.66-.03 3.2 1.12 4.22 1.12 1 0 2.91-1.38 4.88-1.17.82.02 3.17.32 4.68 2.52-.13.08-2.8 1.64-2.76 4.87zm-3.2-9.48a4.8 4.8 0 0 1-3.8 1.8c-.18-1.46.54-3 1.34-3.95A5.81 5.81 0 0 1 20.44 2c.17 1.5-.43 3-1.3 4.09z"></path></svg></a>
            <a class="layout-footer__outbound__item" href="https://play.google.com/" target="_blank" rel="noreferrer noopener" title="플레이스토어" aria-label="플레이스토어"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M4.22 26.95A2.35 2.35 0 0 1 4 25.9V3.8c0-.42.08-.77.22-1.05l12.1 12.1-12.1 12.1zm.74.68l12.07-12.07 3.7 3.7-14.2 8.1c-.6.34-1.14.42-1.57.27zm15.78-17.2l-3.71 3.71L4.96 2.07c.14-.04.3-.07.45-.07.34 0 .72.1 1.12.34l14.2 8.1zm.9.52l4.32 2.46c1.39.8 1.39 2.09 0 2.88l-4.32 2.46-3.9-3.9 3.9-3.9z"></path></svg></a>
            <a class="layout-footer__outbound__item" href="https://story.kakao.com/ch/" target="_blank" rel="noreferrer noopener" title="카카오스토리" aria-label="카카오스토리"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M19.02 6h-8.04a.96.96 0 0 0-.98.93v8.16c0 .51.44.93.98.93h3.7c-.02.9-.4 1.9-.99 2.77a10.3 10.3 0 0 1-2 2.06l-.03.03c-.11.1-.2.22-.2.38 0 .12.07.21.14.31l.02.02 2.57 2.76s.13.12.23.15c.12.02.25.03.34-.04A12.25 12.25 0 0 0 20 14.79V6.93a.96.96 0 0 0-.98-.93"></path></svg></a>
            <a class="layout-footer__outbound__item" href="https://www.facebook.com/" target="_blank" rel="noreferrer noopener" title="페이스북" aria-label="페이스북"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M16.67 26V15H20v-3.38h-3.33V9.07c-.02-.76.08-1.29 1.66-1.7H20V4h-3.33c-3.2 0-4.46 1.84-4.17 5.08v2.53H10V15h2.5v11h4.17z"></path></svg></a>
            <a class="layout-footer__outbound__item" href="https://www.instagram.com/" target="_blank" rel="noreferrer noopener" title="인스타그램" aria-label="인스타그램"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M15 3c3.26 0 3.67.02 4.95.08 1.27.05 2.14.26 2.9.55a5.88 5.88 0 0 1 2.13 1.39 5.88 5.88 0 0 1 1.39 2.12c.3.77.5 1.64.55 2.91.06 1.28.08 1.7.08 4.95s-.02 3.67-.08 4.95a8.78 8.78 0 0 1-.55 2.9 5.88 5.88 0 0 1-1.39 2.13 5.88 5.88 0 0 1-2.12 1.39c-.77.3-1.64.5-2.91.55-1.28.06-1.7.08-4.95.08s-3.67-.02-4.95-.08a8.78 8.78 0 0 1-2.9-.55 5.88 5.88 0 0 1-2.13-1.39 5.88 5.88 0 0 1-1.39-2.12c-..3-.77-.5-1.64-.55-2.91C3.02 18.67 3 18.25 3 15s.02-3.67.08-4.95c.05-1.27.26-2.15.55-2.9a5.88 5.88 0 0 1 1.39-2.13 5.88 5.88 0 0 1 2.12-1.39c.76-.3 1.64-.5 2.91-.55C11.33 3.02 11.75 3 15 3zm0 2.17c-3.2 0-3.58 0-4.85.07-1.17.05-1.8.24-2.22.4-.56.23-.96.49-1.38.9a3.7 3.7 0 0 0-.9 1.39 6.64 6.64 0 0 0-.41 2.22A82.92 82.92 0 0 0 5.17 15c0 3.2 0 3.58.07 4.85.05 1.17.24 1.8.4 2.22.23.56.49.96.9 1.38.43.42.83.68 1.39.9.42.17 1.05.36 2.22.41 1.27.06 1.65.07 4.85.07 3.2 0 3.58 0 4.85-.07a6.67 6.67 0 0 0 2.23-.4c.56-.23.96-.49 1.38-.9.42-.43.68-.83.9-1.39.16-.42.35-1.05.4-2.22.06-1.27.07-1.65.07-4.85 0-3.2 0-3.58-.06-4.85a6.66 6.66 0 0 0-.42-2.23 3.72 3.72 0 0 0-.9-1.38 3.7 3.7 0 0 0-1.37-.9 6.64 6.64 0 0 0-2.23-.4A82.92 82.92 0 0 0 15 5.15zm0 3.67a6.16 6.16 0 1 1 0 12.32 6.16 6.16 0 0 1 0-12.32zM15 19a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm7.84-10.4a1.44 1.44 0 1 1-2.88 0 1.44 1.44 0 0 1 2.88 0z"></path></svg></a>
            <a class="layout-footer__outbound__item" href="http://naver.me/" target="_blank" rel="noreferrer noopener" title="네이버 포스트" aria-label="네이버 포스트"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M8.5 5h13v13h-13V5zm7.45 4v2.52L14.05 9H12v5h2.05v-2.52l1.9 2.52H18V9h-2.05zm3.11 13h-8.12L8.5 19h13l-2.44 3zm-.81 1L15 27l-3.25-4h6.5z"></path></svg></a>
          </div>
        </div>
        <ul class="layout-footer__shortcut">
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="#" target="_blank">브랜드 스토리</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="#" target="_blank">회사소개</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="#" target="_blank">채용정보</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="/usepolicy" target="_blank">이용약관</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="/privacy" target="_blank">개인정보처리방침</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="/customer_center" target="_blank">고객센터</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new" target="_blank">고객의 소리</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="#" target="_blank">전문가 등록</a></li>
          <li><a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new?type=request" target="_blank">제휴/광고 문의</a></li>
        </ul>
        <address class="layout-footer__info-wrap">
          <dl class="layout-footer__info">
            <a class="layout-footer__info__item" href="#" target="_blank"><dt>상호명</dt><dd>(주)내일의집</dd>
            </a>
            <span class="layout-footer__info__item"><dt>이메일</dt><dd>(고객문의)<a href="mailto:help@houseoftomorrow.com"> help@houseoftomorrow.com </a>(제휴문의)<a href="mailto:contact@houseoftomorrow.com"> contact@houseoftomorrow.com</a></dd></span><span class="layout-footer__info__item"><dt>대표이사</dt><dd>김효진 김민호 김지안 배지혜 이효정 최형림 한웅희</dd></span><span class="layout-footer__info__item"><dt>사업자등록번호</dt><dd>615-12-34567</dd></span><span class="layout-footer__info__item"><dt>통신판매업신고번호</dt><dd>제2020-경기성남-0601호</dd></span><span class="layout-footer__info__item"><dt>주소</dt><dd>경기도 성남시 분당구 삼평동 대왕판교로 670</dd></span>
          </dl>
          <dl class="layout-footer__info"><span class="layout-footer__info__item"><dt>NICEPAY 안전거래 서비스</dt><dd>고객님의 안전거래를 위해 현금 결제 시, 저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다. <a class="layout-footer__info__item__link" href="https://pg.nicepay.co.kr/issue/IssueEscrow.jsp?Mid=bucketplam&amp;CoNo=1198691245" target="_blank" rel="noopener noreferrer">가입 확인</a></dd></span>
          </dl>
          <span class="layout-footer__info">
            <span class="layout-footer__info__item">(주)내일의집은 통신판매중개자로서 통신판매의 당사자가 아니며, 입점업체가 등록한 상품, 상품정보 및 거래에 대하여 (주)내일의집은 일체 책임을 지지 않습니다.</span>
          </span>
        </address>
        <p class="layout-footer__copyright">Copyright &copy;
                  <script>document.write(new Date().getFullYear());</script> 
                  by 내일의집, All Rights Reserved
              </p>
            </div>
        
        <div class="toast-message-root"></div>
   


      </div><!-- container end -->
    </footer>
    <!-- END footer -->

    <!-- scripts -->
<!-- 	<script src="/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="/plugins/jquery/jquery-3.4.1.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/common/main.js"></script>
    
	<!-- ICON -->
	<!-- <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script> -->
	<script type="module" src="https://unpkg.com/ionicons@5.0.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule="" src="https://unpkg.com/ionicons@5.0.0/dist/ionicons/ionicons.js"></script>

  </body>
</html>