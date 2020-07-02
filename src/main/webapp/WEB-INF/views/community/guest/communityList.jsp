<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

	<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
	    
	<link rel="stylesheet" href="/plugins/bootstrap/bootstrap.min.css">
	<script src="/plugins/bootstrap/bootstrap.min.js"></script>

<style>
	h1{
		margin-left: 10%;
		font-weight: bold;
	}
	img{
 		width: 20%; 
 		height: 20%;
	}
	a{
		color: black;
		text-decoration: none;
	}
	a:hover{
		color: black;
		text-decoration: none;
	}
	.scale  img {
		-webkit-transform:scale(1);
		-moz-transform:scale(1);
		-ms-transform:scale(1);	
		-o-transform:scale(1);	
		transform:scale(1);
		-webkit-transition:.3s;
		-moz-transition:.3s;
		-ms-transition:.3s;
		-o-transition:.3s;
		transition:.3s;
	}
	.scale:hover  img {
		-webkit-transform:scale(1.2);
		-moz-transform:scale(1.2);
		-ms-transform:scale(1.2);	
		-o-transform:scale(1.2);
		transform:scale(1.2);
	}
	.scale{
		overflow: hidden;
	}
	.list{
		text-align: center;
		float: left;
	}
	section{
		margin-left: 10%;
		margin-right: 10%
	}
	img{
		width: 500px;
		height:300px;
	}
	/* Style the tab */
	.tab {
	margin-left: 10%;
	width: 80%;
	  overflow: hidden;
	  border: 1px solid #ccc;
	  background-color: #f1f1f1;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	  background-color: inherit;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  transition: 0.3s;
	  font-size: 20px;
	  width: 50%
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	  background-color: #ddd;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	  background-color: #ccc;
	}
	
	/* Style the tab content */
	.tabcontent {
	  display: none;
	  padding: 6px 12px;
	  border: 1px solid #ccc;
	  border-top: none;
	  }
</style>

</head>
<body>


<h1>커뮤니티</h1>
<br><br>
<div id="tab" class="tab">
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/community/list/4'">사진</button>
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/community/list/5'">노하우</button>
</div>
<br><br>
<section>
	<c:forEach items="${requestScope.list}" var="list" >
	<div class="list col-md-4"><a href="${pageContext.request.contextPath}/community/detail/${list.commNo}">
	<div class="scale"><img src="${list.commImg}"></div><!-- 이미지 크기 조정 --><br>
	<b>${list.commTitle}</b><p>
	${list.member.memberId}<p>
	조회수: ${list.commReadnum }<p>
	</a>
	</div>
	</c:forEach>
</section>
</body>
</html>