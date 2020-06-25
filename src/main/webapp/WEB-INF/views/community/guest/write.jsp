<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
	h1{
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
	section{
		float: left;
		boarder: 1px solid;
	}
	div:hover{
		color: blue;
	}
</style>
</head>
<body>
<h1>글쓰기</h1>
<br><br>
<form>


	<section id="one" class="col-sm-6"><a href="/community/member/createCommunity?commCategoryNo=4">
	<img src="/plugins/images/icon_camera.png"/>
	<div>사진</div>
	</a></section>
	<section id="two" class="col-sm-6"><a href="/community/member/createCommunity?commCategoryNo=5">
	<img src="/plugins/images/icon_idea.png"/>
	<div>노하우</div>
	</a></section>
	<section id="two" class="col-sm-6"><a href="/community/member/createCommunity?commCategoryNo=5">
	<img src="/plugins/images/icon_idea.png"/>
	<div>전문가/시공리뷰</div>
	</a></section>
	<section id="two" class="col-sm-6"><a href="/community/member/createCommunity?commCategoryNo=5">
	<img src="/plugins/images/icon_idea.png"/>
	<div>질문하기</div>
	</a></section>
</form>
</body>
</html>