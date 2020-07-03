<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>