<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
<style>
	a{
		color: black;
		text-decoration: none;
	}
	table{
		width: 80%;
		margin-left: 15%;
		font-size: 20px;
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
	  font-size: 20px;
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
	  
</style>

</head>
<body>
<div id="tab" class="tab">
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/14'">결제</button>
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/15'">환불</button>
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/16'">회원정보 변경</button>
  <button class="tablinks" onclick="location.href='${pageContext.request.contextPath}/qna/list/17'">서비스 / 기타</button>
</div>
<br><br>
<table>
<c:forEach items="${list}" var="list">
	<tr>
	<td class="col-md-4"><b>Q</b>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.qnaTitle}</a></td>
	<td class="col-md-4"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}">${list.member.memberName}</a></td>
	<td class="col-md-4"><a href="${pageContext.request.contextPath}/qna/detail/${list.qnaNo}"><fmt:formatDate value="${list.qnaRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>