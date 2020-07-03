<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
  <!-- bootstrap-->
	<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
	    
	<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
	<script src="/plugins/bootstrap/bootstrap.min.js"></script>

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
	div:hover{
		color: #cfb997;
		background-color: beige;
	}
	a:hover{
		color: #cfb997;
		text-decoration: none;
	}
	.div{
		float: left;
		margin-left:5%;
		text-align: center;
		padding: 20px;
		border-radius: 50%;
		font-size: 30px;
		overflow: hidden;
		background-color: #dddddd;
	}
</style>
</head>
<body>
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
</form>
</body>
</html>