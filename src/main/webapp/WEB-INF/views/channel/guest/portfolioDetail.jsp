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
  <link rel="stylesheet" type="text/css" href="/css/channel/channel.css">

  <!-- WebFont -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">
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
	         url:"${pageContext.request.contextPath}/channel/favoritePortfolio/check",
	         data: "membNo="+${user.memberNo}+"&&portfNo="+${portNo},
	         dataType:"json",
	         success:function(result){
	            var image = document.getElementById("favoritePortfolio");
	            if (result==1) {
	                image.src = "/plugins/images/heart_on.png";
	              } else {
	                image.src = "/plugins/images/heart_off.png";
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
.floating-menu { position: fixed; right: 90px; top: 50%; z-index: 100; width: 20%;  margin: -220px 0 0 0; /*background: url("") 0 0 no-repeat;*/ }
.floating-menu li { margin: 0; *float: left; }
.floating-menu a { display: block; width: 123px; padding: 10px 0;color: #fff; text-align: center; border: 1px solid #464646; text-decoration: none;}
.floating-menu a.menu-04 { height: 20px; background: none; }
.floating-menu li.on a { background-color: #333; color: #fff;/*background: url("") 0 0 no-repeat;*/ }
.floating-menu li.on a.menu-01 {/* background-position: -131px 0;*/ }
.floating-menu li.on a.menu-02 {/* background-position: -131px -104px;*/ }
.floating-menu li.on a.menu-03 { /*background-position: -131px -219px;*/ }

.footer { height: 100px; background-color: #707070;}
a{
	color: #33f0c0;
	text-decoration: none;
}
a:hover{
	color: black;
	text-decoration: none;
}
#title{
	font-size: 30px;
}

img{
	width: 92%;
	height: 400px;
}
#topTitle{
	font-size: 20px;
}
#commentList{
	font-size: 20px;
}
.click{
	font-size: 20px;
	color: #33f0c0;
	font-weight: bold;
}
#content{
	width: 70%;
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
#line{
	margin-left: 10px;
  	border: 2px solid lightgray;
 }
.user_proifle__image{
	height: 10%;
}
</style>

</head>
<body>
<div class="container">
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

<div class="col-md-4">

   <div class="rows floating-menu" style="margin-right: 130px;">
        <ul>
            <li class="m" style="margin-left: 100px;">
			<p id="topTitle"><b>포트폴리오 상세보기</b></p>
			<span id="title"><b>${port.portTitle}</b></span><p>
            <span><fmt:formatDate value="${port.portRegdate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></span><p>
            <span>시공사: ${port.channel.constructor.conName}</span><p>
            <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">            
                     <img style="cursor: pointer; width: 8%; height: 8%;" id="favoritePortfolio"  src="/plugins/images/heart_off.png"/>
                     <strong>${fn:length(favPort)}</strong>
            </sec:authorize>
            </li>
        </ul>
    </div>

</div>

 </div>
 
</body>
</html>