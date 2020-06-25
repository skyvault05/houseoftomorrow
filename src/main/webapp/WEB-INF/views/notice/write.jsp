<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
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
      background: #2db34a;
      border: 1px solid #eaeaed;
      height: 50px;
      font-size: .8em;
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
  <div class="container">
    <p class="bg-info">Viewport width가 992px 이상이면 3열, 768px~991px이면 2열, 768px미만이면 1열로 정렬된다</p>
    <div class="row">
      <div class="col-xs-12 col-sm-6 col-md-4">1</div>
      <div class="col-xs-12 col-sm-6 col-md-4">2</div>
      <div class="col-xs-12 col-sm-6 col-md-4">3</div>
      <div class="col-xs-12 col-sm-6 col-md-4">4</div>
      <div class="col-xs-12 col-sm-6 col-md-4">5</div>
      <div class="col-xs-12 col-sm-6 col-md-4">6</div>
    </div>
  </div>
</body>
</html>