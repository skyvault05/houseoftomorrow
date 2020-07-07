<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>



</head>
<body>

<%-- <div class="container">
    <div class="post--contents__list-wrap">
                  <div class="row post--contents__list" style="transform:translateX(-0px)">
                     <c:forEach items="${list}" var="list">
                        <div class="col-md-4 post--contents__item-wrap">
                           <a href="#">
                              <div class="post--contents__item">
                                 <div style="position:relative">
                                    <img class="post--contents__item__img" src="${list.chImg}"/>
                                 </div>
                                 <p class="post--contents__item__title">${list.constructor.conName}</p>
                                 <p class="post--contents__item__grades">${list.chGrades}</p>
                              </div>
                           </a>
                        </div>
                     </c:forEach>
                  </div> <!-- row -->
               </div>  --%>
<br><br>
<!--  페이징 처리  -->

    <section class="recommendation portfolio">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                  <h2 class="portfolio-title mb-4">시공사 </h2>
                 </div>
             </div>     
             <div class="row">              
  			 <c:forEach items="${list}" var="list" begin="0" end="7">
                    <div class="main_recomm card col-3 pb-3">
                    	<a class="main_index__link" href="${pageContext.request.contextPath}/channel/guest/channelDetail/${list.chNo}">
	                        <div class="card-img">
	                        	<img src="${list.chImg}" class="card-img-top rounded" alt="" style="width: 255px; height: 255px;">
	
	                        </div>
	                        <div class="card-body">
	                          <p class="card-text title">${list.constructor.conName}</p>
	                          <div class="card-text content">${portList.channel.constructor.conName}★ ${list.chGrades}</div>
                        	</div>
                        </a>
                    </div>
			 </c:forEach> 
  	
                </div><!--end card --> <!-- 포트폴리오 한줄 -->
            </div>
            </div><!--end row-->
        </div><!--end container-->
    </section>



<!-- 페이징 처리 -->
<div id="page" style="text-align: center; margin-top:10px; margin-bottom:10px;">
<c:forEach begin="0" end="${totalPage-1}" var="i">
	<c:choose>
		<c:when test="${i==nowPageNum }">
			<a class="paginator__page selected" href="${pageContext.request.contextPath}/channel/channelAll?nowPage=${i}"> ${i+1} </a> &nbsp;
			
		</c:when>
		<c:otherwise>
			<a class="paginator__page" href="${pageContext.request.contextPath}/channel/channelAll?nowPage=${i}">${i+1}</a> &nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>  
</div>

 
</body>
</html>