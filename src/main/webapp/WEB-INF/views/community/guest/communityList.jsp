 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 

<!doctype html>
<html lang="ko">
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

 
<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->
  



<!-- recommendation portfolio -->


    <section class="recommendation portfolio pt-4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                  <h2 class="portfolio-title mb-4"> </h2>
                 </div>
             </div>     
             <div class="row">              
  			 <c:forEach items="${requestScope.list}" var="list" begin="0" end="7">
                    <div class="main_recomm card col-3 pb-3">
                    	<a class="main_index__link" href="${pageContext.request.contextPath}/community/guest/detail/${list.commNo}">
	                        <div class="card-img">
	                        	<img src="${list.commImg}" class="card-img-top rounded" alt="" style="width: 255px; height: 255px;">
	
	                        </div>
	                        <div class="card-body">
	                          <p class="card-text title">${list.commTitle}</p>
	                          <div class="card-text content">조회수 ${list.commReadnum}</div>
                        	</div>

                        </a>
                    </div>
			 </c:forEach> 
  	
                </div><!--end card --> <!-- 포트폴리오 한줄 -->
            </div>
            </div><!--end row-->
        </div><!--end container-->
    </section>






   <!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->

  </body>
</html>