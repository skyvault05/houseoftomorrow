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
<br><br>



    <section class="recommendation portfolio">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                  <h2 class="portfolio-title mb-4">포트폴리오 </h2>
                 </div>
             </div>     
             <div class="row">              
  			 <c:forEach items="${portList}" var="list" begin="0" end="7">
                    <div class="main_recomm card col-3 pb-3">
                    	<a class="main_index__link" href="${pageContext.request.contextPath}/channel/guest/portfolioDetail/${list.portNo}">
	                        <div class="card-img">
	                        	<img src="${list.portImg}" class="card-img-top rounded" alt="" style="width: 255px; height: 255px;">
	
	                        </div>
	                        <div class="card-body">
	                          <p class="card-text title">${list.portTitle}</p>
	                          <div class="card-text content">${list.channel.constructor.conName}★</div>
	                          
	                          <c:if test="${ status.count%4 == 0 }" ><div class="rows"></div></c:if>
                        	</div>
                        </a>
                    </div>
			 </c:forEach> 
  	
                </div><!--end card --> <!-- 포트폴리오 한줄 -->
            </div>
            </div><!--end row-->
        </div><!--end container-->
    </section>
    
    

   


<div id="page" style="text-align:center; margin-top:10px; margin-bottom:10px;">
<c:forEach begin="0" end="${totalPage-1}" var="i">
	<c:choose>
		<c:when test="${i==nowPageNum }">
			[<a href="${pageContext.request.contextPath}/channel/guest/portfolioAll?nowPage=${i}" style="color:red"> ${i+1} </a>] &nbsp;
		</c:when>
		<c:otherwise>
			[<a href="${pageContext.request.contextPath}/channel/guest/portfolioAll?nowPage=${i}">${i+1}</a>] &nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>  
</div> <!-- 로우 끝 -->
    
    
</div>
</body>
</html>