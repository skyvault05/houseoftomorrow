<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
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
<style>
	a{
		color: black;
		text-decoration: none;
		font-size: 15px;
	}
	/* Style the tab */
	.tab {
	margin-left: 15%;
	width: 70%;
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
	  font-size: 18px;
	  width: 25%
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
	  
	  /* table hover 색깔 바꾸기 */
	  #table:hover tbody tr:hover td {
		    background: #33f0c0;
		    color: white;
		}
</style>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
<h2>문의사항</h2>
</div>
<div class="row"><br><br></div>
<div class="row">
	<div id="tab" class="tab">
	  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/14'">결제</button>
	  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/15'">환불</button>
	  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/16'">회원정보 변경</button>
	  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/17'">서비스 / 기타</button>
	</div><!-- tab end -->
</div><!-- row end -->
<div class="row"><br><br><br></div>
<div class="row">
	<table id="table" class="table table-hover">
	<c:forEach items="${list}" var="list">
		<tr>
		<td style="width: 60%"><b>Q</b>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
		<td style="width: 20%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.member.memberName}</a></td>
		<td style="width: 20%"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
		</tr>
	</c:forEach>
	</table><!-- table end -->
</div><!-- row end -->
</div>
</body>
</html>