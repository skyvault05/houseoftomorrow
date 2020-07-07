<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$(".checkIcon").css("fill","#00ffbf");
});

</script>
</head>
<body>

<div class="container">
	<div class="row">
	<h3>시공사 등록 요청</h3>
		<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">채널 번호</th> 
      <th scope="col">시공사 명</th>
      <th scope="col">채널 설명</th>
      <th scope="col">수락</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${channelList}" var="channel">
    <tr>
      <th scope="row">${channel.chNo}</th>
      <td><a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${channel.chNo}" style="color:black;">${channel.constructor.conName}</a></td>
      <td>${channel.chDescription}</td>
      <td><a href="${pageContext.request.contextPath}/manage/admin/updateChannelStatus/${channel.chNo}"><svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path class="checkIcon" fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
		  </svg></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
	</div>
</div>

</body>
</html>