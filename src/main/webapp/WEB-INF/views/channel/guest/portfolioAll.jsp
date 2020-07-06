<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  
</head>
<body>
<div class="container">
<br><br>
<div class="row justify-content-center">
<h2>포트폴리오</h2>
&nbsp;
<h5 class="post__title"><strong>${fn:length(portList)}개</strong></h5>
</div>
<div class="row"><br><br></div>
    <section class="recommendation portfolio">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-md-3">
                <c:forEach items="${portList}" var="portList" varStatus="status">               
                  <div class="card-wrap card">              
                    <div class="main_recomm">
                        <div class="card-img">
                            <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${portList.portNo}"><img src="${portList.portImg}" class="card-img-top rounded" alt="blog"></a>
                            <div class="social_connect_overlay rounded">
                                <a href="#"><span class="ti-instagram"></span></a> 
                            </div>
                        </div>
                        <div class="card-body">
                        <a href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${portList.portNo}">
                          <p class="card-text title">${portList.portTitle}</p>
                          <div class="card-text content">${portList.channel.constructor.conName}${status.count}</div>
                        </a>
                        </div>
                    </div>
                    <c:if test="${ status.count%4 == 0 }" >★<div class="rows"></div></c:if>
                    
                 </div><!-- end card-wrap -->
                 </c:forEach>
            </div>
        </div><!--end row-->
        </div><!--end container-->
    </section>
    <!-- END recommendation portfolio -->
</div>
</body>
</html>