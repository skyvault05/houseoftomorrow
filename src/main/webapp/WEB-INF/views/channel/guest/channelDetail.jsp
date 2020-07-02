<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri ="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!doctype html> <html lang="ko"> <head> <title>내일의 집</title>
<meta charset="utf-8"> <meta name="viewport" content="width=device-width,
initial-scale=1, shrink-to-fit=no">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
 <!-- bootstrap--> <link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="/css/main/jquery.fancybox.min.css">

  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="/css/main/main.css">
  <link rel="stylesheet" type="text/css" href="/css/channel/channel.css">

  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
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
	
	function pageLoad(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/favoriteChannel/checkHeart",
			data: "membNo="+${user.memberNo}+"&&chaNo="+1,
			dataType:"json",
			success:function(result){
				var image = document.getElementById("favoriteChannel");
				  if (result==1) {
				    image.src = "/plugins/images/heart_off.png";
				  } else {
				    image.src = "/plugins/images/heart_on.png";
				  }
			}
		});
    };
    
    window.onload = pageLoad;
    
    function changeImage(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/favoriteChannel/check",
			data: "membNo="+${user.memberNo}+"&&chaNo="+1,
			dataType:"json",
			success:function(result){
				var image = document.getElementById("favoriteChannel");
				  if (image.src.match("off")) {
				    image.src = "/plugins/images/heart_on.png";
				  } else {
				    image.src = "/plugins/images/heart_off.png";
				  }
			}
		});}

		$('#favoriteChannel').on('click', changeImage);
		
});

</script>
  </head>
  
  <body>
    <header role="banner">
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand " href="/index">HOT</a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    
    <!--------------------------------------main menu--------------------------------------------->
          <div class="collapse navbar-collapse btnCollapse" >
            <ul class="navbar-nav ">
              <li class="nav-item dropdown pl-md-5">
              <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">커뮤니티 </a>
             <div class="dd-wrap">
              <ul class="dropdown-menu"  aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#" >커뮤니티홈</a></li>
                <li><a class="dropdown-item" href="#">사진</a></li>
                <li><a class="dropdown-item" href="#">집들이</a></li>
                <li><a class="dropdown-item" href="#">노하우</a></li>
              </ul>
              </div>
            </li>

            <li class="nav-item dropdown ">
              <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">인테리어시공</a>
              <div class="dd-wrap">
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">시공홈</a></li>
                  <li><a class="dropdown-item" href="#">견적요청</a></li>
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
                    <a href="#" class="dropdown-item updateInfo">가입정보수정</a>
                    <a href="#" class="dropdown-item myCounsel">내상담내역</a>
                    <a href="#" class="dropdown-item writeList">내가쓴글</a>
                    <a href="#" class="dropdown-item logout">로그아웃</a>
                  </div>
                </div>
              </div><!--header icon-->
            </div>
            <!--END submenu-->
          </div><!--collapse navbar-collapse btnCollapse-->
        </div><!--end container-->
      </nav>
  <!--END main menu--->
  </header>
  <!-- END header -->
  <div class="empty-space"></div>
  <div class="container-flude submenu_borderbottom">
	<div class="wrap-submenu">
		<div class="mypage-nav">
			<nav class="navbar justify-content-center navbar-expand-lg submenu_nav">
				<ul class="navbar-nav mypage">
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">모두보기</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">리뷰</a>
					</li>
					<li class="nav-item">
						<a href="" class="nav-link" target="_self">포트폴리오</a>
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
								<img src="./images/default/channel_defult.png" alt="시공사프로필사진"/>
							</div>
							<div class="user_profile__info">
								<div class="profile_name">
									<span>The_dana_design</span>
								</div>
								<div class="profile_info_reviews">
									<a class="profile_info_reviews__link" href="#/users/2112978/reviews"><span class="profile_info_reviews_stars" aria-label="별점 5.0점">
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg></span> 
										<span class="profile-info_reviews__count">n개</span>
									</a>
									<span class="expert-review-popup-button">
										<a class="profile-info_reviews_write" href="/expert_reviews/new?expert_id=2732&amp;source=4">리뷰쓰기</a>
									</span>
								</div><!-- end profile_info_reviews-->
							</div><!--user_proifle__info-->
						</div><!--user_proifle__conatiner-->

						<div class="user_profile__consultation pb-4"><!--상담하기-->
							<div class="user_profile__btn-actions">
								<a class="btn btn-primary user-profile_actions_action" href="/consultations/new?id=2112978&amp;request_code=1">상담신청</a>
								<div class="drop-down user-profile_actions_etc-wrap">
									<button class="btn user-profile_actions__etc" type="button">
										<svg class="icon" width="24" height="24" preserveAspectRatio="xMidYMid meet"><path d="M6 13.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm12 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm-6 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" fill="#000" fill-opacity=".7" fill-rule="evenodd"></path></svg>
									</button>
									<ul class="drop-down__list">
										<li><a href="/expert_reviews/new?expert_id=2732&amp;source=4">리뷰쓰기</a><button type="button">팔로우</button></li>
									</ul>
								</div>
							</div>		
											
							<img style="cursor: pointer; width: 15%; height: 15%;" id="favoriteChannel"  src="/plugins/images/heart_off.png"/>
							
						</div><!--end 상담하기-->
						
						<div class="profile_info_about"><!--업체정보-->
							<div class="expandable-text user-profile_about">
								<table class="user-profile_about_table">
										<tr>
											<th>위치</th>
											<td>경기 용인시 기흥구</td>
										</tr>
										<tr>
											<th>경력</th>
											<td>5-10년</td>
										</tr>
										<tr>
											<th>A/S</th>
											<td>12<!-- -->개월</td>
										</tr>
									</table>
									<div class="user-profile_about_about">life  is  story 공감가득한 삶의 이야기</div>
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
					<h5 class="post__title">고객들의 리뷰 <strong>5</strong>
						<span class="post__title__show-all">
							<a href="/expert_reviews/new?expert_id=5134&amp;source=5">리뷰쓰기</a><a href="/users/5007120/reviews">전체보기</a></span>
					</h5>
					<div class="row post--reviews__list">
						<a class="col-12 col-md-6 post--reviews__item-wrap" href="/users/5007120/reviews">
							<div class="post--reviews__item">
								<div class="post--reviews__contents">
									<div class="post--reviews__contents__text">
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </p>
										<div class="post--reviews__writer">
											<img class="post--reviews__writer__profile" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 3x"/>
											<span class="post--reviews__writer__name">0**4 고객님</span>
											<span class="post--reviews__writer__rating" aria-label="별점 4.8점">
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-0.800" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-0.800"><rect x="0" y="0" width="12.799999999999997" height="16"></rect></clipPath></defs><use xlink:href="#star-path-0.800" fill="#DBDBDB"></use><use clip-path="url(#star-clip-0.800)" xlink:href="#star-path-0.800"></use></svg>
											</span>
										</div>
									</div>
									<img class="post--reviews__contents__img" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=72" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=80 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=144 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=160 3x"/></div>
								</div>
							</a>
							<a class="col-12 col-md-6 post--reviews__item-wrap" href="/users/5007120/reviews">
							<div class="post--reviews__item">
								<div class="post--reviews__contents">
									<div class="post--reviews__contents__text">
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </p>
										<div class="post--reviews__writer">
											<img class="post--reviews__writer__profile" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=36 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1538013509935_tT9Yvz9ao.jpg?gif=1&amp;w=72 3x"/>
											<span class="post--reviews__writer__name">0**4 고객님</span>
											<span class="post--reviews__writer__rating" aria-label="별점 4.8점">
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="16" height="16"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
												<svg fill="#35C5F0" width="16" height="16" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16"><defs><path id="star-path-0.800" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path><clipPath id="star-clip-0.800"><rect x="0" y="0" width="12.799999999999997" height="16"></rect></clipPath></defs><use xlink:href="#star-path-0.800" fill="#DBDBDB"></use><use clip-path="url(#star-clip-0.800)" xlink:href="#star-path-0.800"></use></svg>
											</span>
										</div>
									</div>
									<img class="post--reviews__contents__img" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=72" srcSet="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=80 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=144 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/expert_reviews/158553169628668610.jpg?gif=1&amp;w=160 3x"/></div>
								</div><!-- row post--reviews__list -->
							</a>
						</div><!--row post--reviews__list-->
				</section><!--end 고객리뷰-->

				<!--포트폴리오-->
				<section class="post post--projects">
					<h5 class="post__title">포트폴리오 <strong>17</strong>
						<a class="post__title__show-all" href="/users/5007120/projects">전체보기</a>
					</h5>
					<div class="post--contents__list-wrap">
						<div class="row post--contents__list" style="transform:translateX(-0px)">
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">Lorem ipsum dolor sit amet</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 col-md-3 post--contents__item-wrap">
								<a href="/projects/31203?affect_type=ExpertUserHome&amp;affect_id=5007120">
									<div class="post--contents__item">
										<div style="position:relative">
											<img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/>
										</div>
										<p class="post--contents__item__title">01</p>
									</div>
								</a>
							</div>
							<div class="col-6 post--contents__item--more--sm"><div><a href="/users/5007120/projects"><span class="icon--page-mypage" style="margin-bottom:10px;background-position-x:-0px;background-position-y:-120px;width:40px;height:40px"></span>더 보기</a></div></div><div class="col-6 col-md-3 post--contents__item--more-wrap"><a href="/users/5007120/projects"><div class="post--contents__item post--contents__item--more"><img class="post--contents__item__img" src="/images/default/portfolio_thumb.png"/><p class="post--contents__item__count">+<!-- -->10</p></div></a></div>
							
							

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
						<a class="layout-footer__outbound__item" href="https://itunes.apple.com/kr/app/oneul-uijib-intelieo-gong/id1008236892" target="_blank" rel="noreferrer noopener" title="앱스토어" aria-label="앱스토어"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M22.34 15.57a5.6 5.6 0 0 0 3.42 5.15c-.02.1-.53 1.84-1.78 3.62-1.05 1.57-2.15 3.1-3.9 3.13-1.69.04-2.26-1-4.2-1-1.96 0-2.57.97-4.2 1.04-1.65.06-2.92-1.67-4-3.23-2.18-3.17-3.87-8.93-1.6-12.85a6.23 6.23 0 0 1 5.24-3.2c1.66-.03 3.2 1.12 4.22 1.12 1 0 2.91-1.38 4.88-1.17.82.02 3.17.32 4.68 2.52-.13.08-2.8 1.64-2.76 4.87zm-3.2-9.48a4.8 4.8 0 0 1-3.8 1.8c-.18-1.46.54-3 1.34-3.95A5.81 5.81 0 0 1 20.44 2c.17 1.5-.43 3-1.3 4.09z"></path></svg></a>
						<a class="layout-footer__outbound__item" href="https://play.google.com/store/apps/details?id=net.bucketplace" target="_blank" rel="noreferrer noopener" title="플레이스토어" aria-label="플레이스토어"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill-rule="evenodd" d="M4.22 26.95A2.35 2.35 0 0 1 4 25.9V3.8c0-.42.08-.77.22-1.05l12.1 12.1-12.1 12.1zm.74.68l12.07-12.07 3.7 3.7-14.2 8.1c-.6.34-1.14.42-1.57.27zm15.78-17.2l-3.71 3.71L4.96 2.07c.14-.04.3-.07.45-.07.34 0 .72.1 1.12.34l14.2 8.1zm.9.52l4.32 2.46c1.39.8 1.39 2.09 0 2.88l-4.32 2.46-3.9-3.9 3.9-3.9z"></path></svg></a>
						<a class="layout-footer__outbound__item" href="https://story.kakao.com/ch/bucketplace" target="_blank" rel="noreferrer noopener" title="카카오스토리" aria-label="카카오스토리"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M19.02 6h-8.04a.96.96 0 0 0-.98.93v8.16c0 .51.44.93.98.93h3.7c-.02.9-.4 1.9-.99 2.77a10.3 10.3 0 0 1-2 2.06l-.03.03c-.11.1-.2.22-.2.38 0 .12.07.21.14.31l.02.02 2.57 2.76s.13.12.23.15c.12.02.25.03.34-.04A12.25 12.25 0 0 0 20 14.79V6.93a.96.96 0 0 0-.98-.93"></path></svg></a>
						<a class="layout-footer__outbound__item" href="https://www.facebook.com/interiortoday" target="_blank" rel="noreferrer noopener" title="페이스북" aria-label="페이스북"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M16.67 26V15H20v-3.38h-3.33V9.07c-.02-.76.08-1.29 1.66-1.7H20V4h-3.33c-3.2 0-4.46 1.84-4.17 5.08v2.53H10V15h2.5v11h4.17z"></path></svg></a>
						<a class="layout-footer__outbound__item" href="https://www.instagram.com/todayhouse" target="_blank" rel="noreferrer noopener" title="인스타그램" aria-label="인스타그램"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M15 3c3.26 0 3.67.02 4.95.08 1.27.05 2.14.26 2.9.55a5.88 5.88 0 0 1 2.13 1.39 5.88 5.88 0 0 1 1.39 2.12c.3.77.5 1.64.55 2.91.06 1.28.08 1.7.08 4.95s-.02 3.67-.08 4.95a8.78 8.78 0 0 1-.55 2.9 5.88 5.88 0 0 1-1.39 2.13 5.88 5.88 0 0 1-2.12 1.39c-.77.3-1.64.5-2.91.55-1.28.06-1.7.08-4.95.08s-3.67-.02-4.95-.08a8.78 8.78 0 0 1-2.9-.55 5.88 5.88 0 0 1-2.13-1.39 5.88 5.88 0 0 1-1.39-2.12c-.3-.77-.5-1.64-.55-2.91C3.02 18.67 3 18.25 3 15s.02-3.67.08-4.95c.05-1.27.26-2.15.55-2.9a5.88 5.88 0 0 1 1.39-2.13 5.88 5.88 0 0 1 2.12-1.39c.76-.3 1.64-.5 2.91-.55C11.33 3.02 11.75 3 15 3zm0 2.17c-3.2 0-3.58 0-4.85.07-1.17.05-1.8.24-2.22.4-.56.23-.96.49-1.38.9a3.7 3.7 0 0 0-.9 1.39 6.64 6.64 0 0 0-.41 2.22A82.92 82.92 0 0 0 5.17 15c0 3.2 0 3.58.07 4.85.05 1.17.24 1.8.4 2.22.23.56.49.96.9 1.38.43.42.83.68 1.39.9.42.17 1.05.36 2.22.41 1.27.06 1.65.07 4.85.07 3.2 0 3.58 0 4.85-.07a6.67 6.67 0 0 0 2.23-.4c.56-.23.96-.49 1.38-.9.42-.43.68-.83.9-1.39.16-.42.35-1.05.4-2.22.06-1.27.07-1.65.07-4.85 0-3.2 0-3.58-.06-4.85a6.66 6.66 0 0 0-.42-2.23 3.72 3.72 0 0 0-.9-1.38 3.7 3.7 0 0 0-1.37-.9 6.64 6.64 0 0 0-2.23-.4A82.92 82.92 0 0 0 15 5.15zm0 3.67a6.16 6.16 0 1 1 0 12.32 6.16 6.16 0 0 1 0-12.32zM15 19a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm7.84-10.4a1.44 1.44 0 1 1-2.88 0 1.44 1.44 0 0 1 2.88 0z"></path></svg></a>
						<a class="layout-footer__outbound__item" href="http://naver.me/51ckkDZh" target="_blank" rel="noreferrer noopener" title="네이버 포스트" aria-label="네이버 포스트"><svg class="icon" width="30" height="30" viewBox="0 0 30 30" preserveAspectRatio="xMidYMid meet"><path fill="#757575" fill-rule="evenodd" d="M8.5 5h13v13h-13V5zm7.45 4v2.52L14.05 9H12v5h2.05v-2.52l1.9 2.52H18V9h-2.05zm3.11 13h-8.12L8.5 19h13l-2.44 3zm-.81 1L15 27l-3.25-4h6.5z"></path></svg></a>
					</div>
				</div>
				<ul class="layout-footer__shortcut">
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/brand-story" target="_blank">브랜드 스토리</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/" target="_blank">회사소개</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="http://bucketplace.co.kr/recruit" target="_blank">채용정보</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/usepolicy" target="_blank">이용약관</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/privacy" target="_blank">개인정보처리방침</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/customer_center" target="_blank">고객센터</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new" target="_blank">고객의 소리</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="https://pro.ohou.se/?utm_source=ohouse&amp;utm_medium=web&amp;utm_campaign=prosignup&amp;utm_content=footer" target="_blank">전문가 등록</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/b2b" target="_blank">사업자 구매회원</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/contacts/new?type=request" target="_blank">제휴/광고 문의</a></li>
					<li><a class="layout-footer__shortcut__item" rel="noopener" href="/partner/applications/new" target="_blank">입점신청 문의</a></li>
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
    <script src="/js/common/popper.min.js"></script>
    <script src="/js/common/owl.carousel.min.js"></script>
    <script src="/js/common/jquery.waypoints.min.js"></script>
    <script src="/js/common/jquery.fancybox.min.js"></script>
    <script src="/js/common/main.js"></script>

    
	<!-- ICON -->
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  </body>
</html>