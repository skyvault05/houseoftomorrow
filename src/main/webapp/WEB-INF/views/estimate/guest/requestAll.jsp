<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!doctype html> 
<html lang="ko"> 
  <head>
    <title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <!-- estimate style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/channel/channel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estimate/estimate.css">
  <script src="${pageContext.request.contextPath}/js/estimate/estimate.js"></script>

  </head>
  
  <body>
  <sec:authentication property="principal" var="user"/>
  


<!-- ↑↑↑↑↑↑↑↑↑↑ 이 윗부분 터치ㄴㄴ ↑↑↑↑↑↑↑↑ -->
<!--☆★☆★☆ ↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 여기부터 수정가능 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ ★☆★☆★-->

<div class="estimateDetail-main-wrap">
	<div class="container pt-5">
		<div class="estimateBoard"><!--start 견적게시판-->
			<div class="table-responsive req-detail" style="overflow:hidden;">
                <table class="table">
                    <thead>
                        <tr class="row">
                            <th class="text-center col-sm-2">#</th>
                            <th class="text-center col-sm-6">견적사항</th>
                            <th class="text-center col-sm-2">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${list}" var="item" varStatus="status">
                        <tr class="row">
                            <td class="text-center col-sm-2">${item.estNo}</td>
                            <td class="text-center col-sm-6"><a href="/viewEstimateDetail/${item.estNo}" class="est-title">${user.username}님의 요청사항입니다</a></td>
                            <td class="text-center col-sm-2">${item.estRegdate}</td>
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
    
		</div><!--end 견적게시판-->

	</div>
	

</div><!--end main-wrap-->

<!--☆★☆★☆ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 수정가능 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ★☆★☆★-->
<!-- ↓↓↓↓↓↓↓↓↓ 이 밑부분 터치ㄴㄴ ↓↓↓↓↓↓↓↓↓-->
<div class="empty-space"></div>


  </body>
</html>