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
	<!--     
     <button type="button" onclick="location.href='${pageContext.request.contextPath}/channel/constructor/myChannel'"> 마이 채널 </button>
 	-->
    <section class="recommendation portfolio">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                  <h2 class="portfolio-title mb-4">추천 포트폴리오 </h2>
                  </div>
             </div>     
             <div class="row">     
<%--                    <div class="card-wrap">
                   
                 <c:forEach items="${portList}" var="port" begin="0" end="3">
                    <div class="main_recomm card">
                        <div class="card-img">
                            <img src="${port.portImg}" class="card-img-top rounded" alt="blog">
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                          <p class="card-text title">${port.portTitle}</p>
                          <div class="card-text content"></div>
                        </div>
                    </div>
				    </c:forEach>       --%>      
				    
				   <c:forEach items="${portList}" var="port" varStatus="status" begin="0" end="7">   
                
                   <div class="col-md-3">     
                    
                   <div style="relative">       
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${port.portNo}"><img src="${port.portImg}" class="card-img-top rounded" alt="blog" style="width:200px; height:200px;"></a>
                         
                                               
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${port.portNo}">
                       	<p class="title">${port.portTitle}</p>
                        <div class="content">${port.channel.constructor.conName}${status.count}</div>
                         <%-- <c:if test="${ status.count%4 == 0 }" ><div class="rows"></div></c:if> --%>
                       
                        </a>
                   
                 		
                    	</div>
                	</div>
                   
                 </c:forEach>
             

                </div><!--end card --> <!-- 포트폴리오 한줄 -->
    
            </div>

          <%--   <div class="col-xl-12 pt-5">
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
    
            </div> --%>



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
                <div>
            <div> 
            <div class="row">   
                   <c:forEach items="${channelList}" var="ch" varStatus="status" begin="0" end="3">   
                
                   <div class="col-md-3">     
                    
                  		<div style="relative">       
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${ch.chNo}"><img src="${ch.chImg}" class="card-img-top rounded" alt="blog" style="width:200px; height:200px;"></a>
                         
                                               
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${ch.chNo}">
                       	<p class="name">${ch.constructor.conName}</p>
                     <%--    <div class="content">${ch.constructor.conName}${status.count}</div> --%>
                     <%--     <c:if test="${ status.count%4 == 0 }" >★<div class="rows"></div></c:if> --%>
                       	<p class="grades">${ch.chGrades}</p>
                        </a>
                   
                 
                    	</div>
                	</div>
                   
                 </c:forEach>
              
            </div>
            </div><!--row-->
            </div><!--container-->
         </section>
<!-- END recomm constructor  -->
<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->

<div class="empty-space"></div>

  </body>
</html>