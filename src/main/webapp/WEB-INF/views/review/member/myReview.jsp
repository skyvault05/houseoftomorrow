<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src=“/plugins/jquery/jquery-3.4.1.min.js”></script>
<link rel=“stylesheet” href=“/plugins/bootstrap/bootstrap.min.css”>
<script src=“/plugins/bootstrap/bootstrap.min.js”></script>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    .row {
      margin-bottom: 10px;
    }
    [class|="col"] {
      background: #d2d2ff;
      border: 1px solid #eaeaed;
      height: 50px;
      font-size: .9em;
      line-height: 50px;
      text-align: center;
      color: white;
      font-weight: 700;
    }
    p.bg-info {
      font-weight: bold;
      padding: 10px;
      margin-right: -15px;
      margin-left: -15px;
    }
    
     
      
  </style>
</head>
<body>

<p>&nbsp; <p>&nbsp; <p>&nbsp; <p>&nbsp;
   
   <div class="container">
   <div class="row">
   <div class="col-xs-12" >리뷰list</div>
   </div>
   <div class="row">
   <div class="col-md-4">리뷰 채널</div>
   <div class="col-md-4">평점</div>
   <div class="col-md-4">날짜</div>
   </div>
   
   <c:forEach items="${requestScope.list}" var="review" >
   
   <div class="row">
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}">${review.channel.constructor.conName}</a></div>
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}">${review.reviewGrade}</a></div>
   <div class="col-xs-12 col-sm-4 "><a href="${pageContext.request.contextPath}/review/readReview/${review.reviewNo}"><fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd HH:mm"/></a></div>
   </div>
   </c:forEach>
   
   
   </div>

</body>   
</html>