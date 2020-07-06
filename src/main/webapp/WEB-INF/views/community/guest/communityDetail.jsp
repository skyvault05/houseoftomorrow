<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
  <script src="/plugins/jquery/jquery-3.4.1.min.js"></script>

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

<!-- --------------------------------------------------------------------- -->
<style>
* { margin: 0; padding: 0; }
body { width: 1000px; margin: 0 auto;}
body { background: #fff;padding: 0; }
img { border: 0; }
ul, ol { list-style: none; }
.header { position: relative; height: 200px; background-color: #ffccec;}
/* contents */
.section-01,.section-02,.section-03 { position: relative; height: 600px; }
.section-01 { background-color: #ffc8a2;}

/* floating menu */
/* .floating-menu { position: fixed; right: 90px; top: 50%; z-index: 100; width: 20%;  margin: -220px 0 0 0;  /*background: url("") 0 0 no-repeat;*/ }
/*
	.floating-menu li { margin: 0; *float: left; }
	.floating-menu a { display: block; width: 123px; padding: 10px 0;color: #fff; text-align: center; border: 1px solid #464646; text-decoration: none;}
	.floating-menu a.menu-04 { height: 20px; background: none; }
	.floating-menu li.on a { background-color: #333; color: #fff;/*background: url("") 0 0 no-repeat;*/ } 
/*	.floating-menu li.on a.menu-01 {/* background-position: -131px 0;*/ } 
/*	.floating-menu li.on a.menu-02 {/* background-position: -131px -104px;*/ }
/*	.floating-menu li.on a.menu-03 { /*background-position: -131px -219px;*/ } 
	
/*	.footer { height: 100px; background-color: #707070;} 
*/
#title{
	font-size: 30px;
}

img{
	width: 500px;
	height: 400px;
}

hr{
	width: 960px;
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
	color: #33f0c0;
    background-color: transparent;
    background-image: none;
    border-color: #33f0c0;
}
#content{
	height: 40px;
	width: 80%;
	font-size:20px;
}
#btn{
	height: 40px;
	width: 100%;
	font-size: 20px;
	cursor: pointer;
}
</style>
<!-- ------------------------------------------------------------------------------------ -->

</head>
  
<body>

 

<div class="container pt-5">
<div class="expert-calculate__content col-12 ">   <!-- col-12 col-md-7 col-lg-3 -->
					<br><h1>커뮤니티</h1><p>
					
				</div>
				
<div id="contents" >
<div class="ditailImg-wrap row">
<div class="ditailImg col-7" >
	<img src="${community.commImg}">
	<br><br>
	<hr><br>
	${community.commDescription}
</div>    
    <div class="floating-menu col-5">
        <ul>
            <li class="m">
            <c:choose>
				<c:when test="${community.commCategory.commCategoryNo == 5}">
					<p id="topTitle"><b>온라인 집들이</b></p>
				</c:when>
			</c:choose>
            <span id="title"><b>${community.commTitle}</b></span><p>
            <span><fmt:formatDate value="${community.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></span><p>
            <span>조회수: ${community.commReadnum}</span><p>
            <br>
            <span>글쓴이: ${community.member.memberName}</span><p>
            ★★글쓴이 링크를 둘지 고민하귀★★
            </li>
        </ul>
    </div>
    </div><!-- end ditailImg-wrap -->
   </div>

	<br>
	<a class="click" href="${pageContext.request.contextPath}/community/list/${community.commCategory.commCategoryNo}">목록으로</a><p>
	
    <sec:authentication var="user" property="principal" />
    글쓴이: ${community.member.memberNo}<p>
    로그인한사람: ${user.memberNo}
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose>
			<c:when test="${community.member.memberNo == user.memberNo}">
				<a class="click" href="${pageContext.request.contextPath}/community/updateCommunity?commNo=${community.commNo}"}>게시글 수정하기</a> | 
				<a class="click" onclick="return delchk()" href="${pageContext.request.contextPath}/community/delete?commNo=${community.commNo}&commCategoryNo=${community.commCategory.commCategoryNo}">게시글 삭제하기</a>
			</c:when>
  <c:when test="${community.member.memberNo != user.memberNo}">
			달라용
			</c:when>
		</c:choose>
	</sec:authorize>
	<br><br>
	<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<div class="container">
        <form id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/community/insertComment">
            <div class="input-group">
               <input type="hidden" name="comNo" value="${community.commNo}"/>
               <input type="hidden" name="membNo"  value="${user.memberNo}"/>
               <input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
               <input type="text" class="form-control" id="content" name="commCommentDescription" placeholder="  덧글을 입력하세요.">
               <span class="input-group-btn">
                    <button id="btn" class="btn btn-outline-primary" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    </sec:authorize>
    <br><br>
    	<h2></h2>
    	<br>
    	<c:forEach items="${comment}" var="comment" varStatus="status">  	
	<p id="commentList">${comment.commCommentDescription} | ${comment.member.memberName} | <fmt:formatDate value="${comment.commCommentRegdate}" pattern="yyyy-MM-dd HH:mm"/>
	<sec:authentication var="user" property="principal" />
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		
		<c:if test="${comment.member.memberNo == user.memberNo}">
			<a class ="click" href="${pageContext.request.contextPath}/community/deleteComment?commentNo=${comment.commCommentNo}&commNo=${comment.community.commNo}">덧글 삭제하기</a></p>
		</c:if>
	</sec:authorize>
	<p>
</c:forEach>
</div>
</div>
 --%>




<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->


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
.floating-menu { position: fixed; right: 90px; top: 50%; z-index: 100; width: 20%;  margin: -220px 0 0 0; /*background: url("") 0 0 no-repeat;*/ }
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
	width: 92%;
	height: 400px;
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
 .delComment{
 	color: #33f0c0;
	font-weight: bold;
 	
 }
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
<div class="container">
<div class="row col-md-12">
	<img src="${community.commImg}">
</div><br><br>
<span class="row border col-md-11">
${community.commDescription}
</span><!-- span row end -->
	
    <div class="rows floating-menu">
        <ul>
            <li class="m">
            <c:choose>
				<c:when test="${community.commCategory.commCategoryNo == 5}">
					<p id="topTitle"><b>온라인 집들이</b></p>
				</c:when>
			</c:choose>
            <span id="title"><b>${community.commTitle}</b></span><p>
            <span><fmt:formatDate value="${community.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></span><p>
            <span>조회수: ${community.commReadnum}</span><p>
            <span>글쓴이: ${community.member.memberName}</span><p>
            </li>
        </ul>
    </div>
    <br><br>
    <div class="rows">
    <hr id = "line" class="col-md-10"><br>
    </div>
    
	<div class="rows">
	<a class="click" href="${pageContext.request.contextPath}/community/list/${community.commCategory.commCategoryNo}">목록으로</a><p>
	</div>
	<div class="rows">
    <sec:authentication var="user" property="principal" />
    글쓴이: ${community.member.memberNo}<p>
    <%-- 로그인한사람: ${user.memberNo} --%>
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose>
			<c:when test="${community.member.memberNo == user.memberNo}">
				<a class="click" href="${pageContext.request.contextPath}/community/updateCommunity?commNo=${community.commNo}"}>게시글 수정하기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a class="click" onclick="return delchk()" href="${pageContext.request.contextPath}/community/delete?commNo=${community.commNo}&commCategoryNo=${community.commCategory.commCategoryNo}">게시글 삭제하기</a>
			</c:when>
  <c:when test="${community.member.memberNo != user.memberNo}">
			달라용
			</c:when>
		</c:choose>
	</sec:authorize>
	</div>
	<br><br>
	<div class="rows">
	<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<div class="container">
        <form id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/community/insertComment">
            <div class="input-group col-md-11">
               <input type="hidden" name="comNo" value="${community.commNo}"/>
               <input type="hidden" name="membNo"  value="${user.memberNo}"/>
               <input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
               <input type="text" class="form-control" id="content" name="commCommentDescription" placeholder="  덧글을 입력하세요.">
               <span class="input-group-btn">
                    <button id="btn" class="btn btn-outline-primary" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    </sec:authorize>
    </div>
    <br><br>
    <div class="rows" style="display: inline;">
    	<h2>comment</h2> [ ${fn:length(comment)} ] 개 	
    </div>
   	<br>  
    <div class="rows">
	<table id="table" class="table">
	<c:forEach items="${comment}" var="comment" varStatus="status">  	
		<tr>
		<td style="width: 50%">${comment.commCommentDescription}</td>
		<td style="width: 20%">${comment.member.memberName}</td>
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
</div>
</body> 

</html>