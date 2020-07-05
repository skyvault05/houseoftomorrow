<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>

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

</head>
<body>

<div class="container">
<br><br>
<div class="row justify-content-center">
<h2></h2>
&nbsp;
<h5 class="post__title"><strong></strong></h5>
</div> <!-- row -->
<div class="row" style="transform:translateX(-0px)"><br><br>
                <c:forEach items="${list}" var="list" varStatus="status">
                   <div class="col-md-3">
                   <div style="relative">
                        <a href="${pageContext.request.contextPath}/channel/guest/channelDetail/${list.chNo}"><img src="${list.chImg}" class="card-img-top rounded" alt="blog" width="255px" height="255px"></a>
                        
                          <p class="card-text title">${list.constructor.conName}</p>
                          <div class="card-text content">${portList.channel.constructor.conName}★ ${list.chGrades}</div>
                        
                    <c:if test="${ status.count%4 == 0 }" >★<div class="rows"></div></c:if>
                    </div>
                	 </div>
                 </c:forEach>
</div> <!-- row -->
</div> <!-- container -->


</body>
</html>