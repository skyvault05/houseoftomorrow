<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.floating-menu { position: fixed; right: 90px; top: 50%; z-index: 100; width: 20%;  margin: -220px 0 0 0;  /*background: url("") 0 0 no-repeat;*/ }
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
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
	<div id="contents">
	<img src="${community.commImg}">

	${community.commDescription}
    <div class="floating-menu">
        <ul>
            <li class="m">
            <span id="title"><b>${community.commTitle}</b></span><p>
            <span><fmt:formatDate value="${community.commRegdate}" pattern="yyyy-MM-dd HH:mm"/></span><p>
            <span>조회수: ${community.commReadnum}</span><p>
            
            <span>글쓴이: ${community.member.memberName}</span><p>
            ★★글쓴이 링크를 둘지 고민하귀★★
            </li>
        </ul>
    </div>
    <sec:authentication var="user" property="principal" />
    <%-- 글쓴이: ${community.member.memberNo}<p>
    로그인한사람: ${user.memberNo} --%>
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		<c:choose>
			<c:when test="${community.member.memberNo == user.memberNo}">
				<a href="${pageContext.request.contextPath}/community/updateCommunity?commNo=${community.commNo}"}>게시글 수정하기</a>
				<a href="${pageContext.request.contextPath}/community/delete?commNo=${community.commNo}&commCategoryNo=${community.commCategory.commCategoryNo}">게시글 삭제하기</a>
			</c:when>
<%--   <c:when test="${community.member.memberNo != user.memberNo}">
			달라용
			</c:when> --%>
		</c:choose>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
	<div class="container">
        <label for="content">comment 덧글</label>
        <form id = "commentInsertForm" name="commentInsertForm" method="post" action="${pageContext.request.contextPath}/community/insertComment">
            <div class="input-group">
               <input type="hidden" name="comNo" value="${community.commNo}"/>
               <input type="hidden" name="membNo"  value="${user.memberNo}"/>
               <input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
               <input type="text" class="form-control" id="content" name="commCommentDescription" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    </sec:authorize>
    <br><br>
    	<h3>덧글 모음</h3>
    	<c:forEach items="${comment}" var="comment" varStatus="status">
    	
    	<script>
			$(document).ready(function(){
				  $("#update").click(function(){
				    	$("#content").val("${comment.commCommentDescription}")
				    	$("#commentInsertForm").attr("action", "${pageContext.request.contextPath}/community/updateComment?commNo=${comment.community.commNo}");
				  });
				});
		</script>
    	
	<div id="id${status.count}">${comment.commCommentDescription}</div> | ${comment.member.memberName} | <fmt:formatDate value="${comment.commCommentRegdate}" pattern="yyyy-MM-dd HH:mm"/>
	<sec:authentication var="user" property="principal" />
    <sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
		
		<c:if test="${comment.member.memberNo == user.memberNo}">
<%-- 			<a id="update"  href="${pageContext.request.contextPath}/community/updateCommentForm?commentNo=${comment.commCommentNo}&commNo=${comment.community.commNo}" >덧글 수정하기</a>  --%>
			<button id="update" value="id${status.count}">수정하기</button>
			<a href="${pageContext.request.contextPath}/community/deleteComment?commentNo=${comment.commCommentNo}&commNo=${comment.community.commNo}">덧글 삭제하기</a>
		</c:if>
	</sec:authorize>
	<p>
</c:forEach>
	
	<!-- 이건 필요 없는 부분이에요 -->
    <div class="section-01 scroll">
        <h2>섹션 1</h2>
    </div>
	
	</div>
	
	<div class="footer">
	    푸터단
	</div>
	<!-- 이건 필요 없는 부분이에요 : 여기까지-->
</body>
</html>