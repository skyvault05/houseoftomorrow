<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


	<section id="one"><a href="/community/member/createCommunity?commCategoryNo=4">
	<img src="/plugins/images/icon_camera.png"/>
	<div class="word">사진</div>
	</a></section>
	<section id="two"><a href="/community/member/createCommunity?commCategoryNo=5">
	<img src="/plugins/images/icon_idea.png"/>
	<div class="word">노하우</div>
	</a></section>
</form>
</body>
</html>