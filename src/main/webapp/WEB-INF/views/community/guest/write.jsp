<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
  <!-- bootstrap-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/write/write.css">
<style>
/* 	h1{
		margin-left: 10%
	}
	a{
		color: black;
		text-decoration: none;
	}
	img{
		width: 15%;
		height: 15%;
	}
	div:hover{
		color: #cfb997;
		background-color: beige;
	}
	a:hover{
		color: #cfb997;
		text-decoration: none;
	}
	.div{
		//float: left;
		margin-left:5%;
		text-align: center;
		padding: 20px;
		border-radius: 50%;
		font-size: 30px;
		overflow: hidden;
		background-color: #dddddd;
	} */
</style>
</head>

<body>
<div class="empty-space"> </div>

<div class="container upload-types">
	<h2 class="text-black bold">글쓰기</h2>
	<div class="row justify-content-center">
		<section class="col-4 col-lg-3 col-xl-2 upload-types__item__wrap">
			<a href="/community/member/createCommunity?commCategoryNo=4" class="upload-types__item">
				<div class="upload-types__item__pictogram">
					<div class="upload-types__item__pictogram__contents">
						<ion-icon name="camera-outline" class="ion__icon"></ion-icon>
						<p class="text_bold">사진</p>
					</div>
				</div>
				<p class="upload-types__item__caption">예쁜 집 사진을 공유해서 많은 사람들에게 영감을 주세요.</p>
			</a>
		</section>
		
		<section class="col-4 col-lg-3 col-xl-2 upload-types__item__wrap">
			<a href="/community/member/createCommunity?commCategoryNo=5" class="upload-types__item">
				<div class="upload-types__item__pictogram">
					<div class="upload-types__item__pictogram__contents">
						<ion-icon name="bulb-outline" class="ion__icon"></ion-icon>
						<p class="text_bold">노하우</p>
					</div>
				</div>
				<p class="upload-types__item__caption">여러분이 알고 있는 인테리어 노하우를 공유해주세요.</p>
			</a>
		</section>
		
	<%-- 	<section class="col-4 col-lg-3 col-xl-2 upload-types__item__wrap">
			<a href="/channel/check/impossibleReview?memberNo=${user.memberNo}&chNo=${user.cnNo}" class="upload-types__item">
				<div class="upload-types__item__pictogram">
					<div class="upload-types__item__pictogram__contents">
						<ion-icon name="construct-outline" class="ion__icon"></ion-icon>
						<p class="text_bold">리뷰등록</p>
					</div>
				</div>
				<p class="upload-types__item__caption">이용하신 시공업체의 리뷰를 등록해보세요.</p>
			</a>
		</section> --%>
		
		<section class="col-4 col-lg-3 col-xl-2 upload-types__item__wrap">
			<a href="/community/manage/member/QNAForm" class="upload-types__item">
				<div class="upload-types__item__pictogram">
					<div class="upload-types__item__pictogram__contents">
						<ion-icon name="help-circle-outline" class="ion__icon"></ion-icon>
						<p class="text_bold">고객센터</p>
					</div>
				</div>
				<p class="upload-types__item__caption">질문 또는 건의 사항이 있으신가요? 친절히 답변 드리겠습니다.</p>
			</a>
		</section>
		
	
	
	
	</div> <!-- end row -->


</div> <!-- end container -->


<%-- 
<h1>글쓰기</h1>
<br><br>
<form>

	<div id="one" class="div col-md-3"><a href="/community/member/createCommunity?commCategoryNo=4">
	<img src="/plugins/images/icon_camera.png"/>
	<br>
	<div><b>사진</b></div>
	</a></div>
	<div id="two" class="div col-md-3"><a href="/community/member/createCommunity?commCategoryNo=5">
	<img src="/plugins/images/icon_idea.png"/>
	<br>
	<div><b>노하우</b></div>
	</a></div>
	<div id="three" class="div col-md-3"><a href="${pageContext.request.contextPath}/community/manage/member/QNAForm">
	<img src="/plugins/images/icon_question.png"/>
	<br>
	<div><b>질문하기</b></div>
	</a></div>
</form> --%>


</body>
</html>