<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- bootstrap-->
  

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/jquery.fancybox.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	
  <!-- Theme Style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/main.css">
  
  <!-- WebFont -->
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;900&display=swap" rel="stylesheet">

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script>
   var token = $("meta[name='_csrf']").attr("content");
   var header = $("meta[name='_csrf_header']").attr("content"); 
   $(document).ajaxSend(function(e, xhr, options) {
     xhr.setRequestHeader(header, token);
   });
</script>
<script src="/plugins/bootstrap/bootstrap.min.js"></script>
<link href="/plugins/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="/plugins/summernote/summernote-lite.min.js"></script>
<script src="/plugins/summernote/setsummernote.js"></script>

<script> 
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); } 
</script>
<script>

</script>

<style>

	
	h2{	
	
		width:300px;
		
		font-weight: bold;
	}
	
	
	#image_container{
	
		border:1px;
	
	}
	#menu{
		
		width:600px;
		height:100px;
		margin-top:5px;
		margin-bottom:5px;
	}
	
	
	#summernote{
		
	}
	
	button{
		
		float:right;		
	}
	#commTitle{
		
		
		height: 40px;
		font-size: 20px;
	}
	#commImg{
		margin:5px;
		float:right;
	}
	#image_container{
		margin-left: 10%;
	}
	input[type=submit]{
		cursor: pointer;
	}
	
	
	}
	
	
</style>
</head>
<body>
 

<c:choose>
	<c:when test="${param.commCategoryNo == 4}">
	<div class="container pt-6">
		<h2> 사진 올리기 </h2>
		
	<form class="form-inline" >	
	<div class="form-group" style="margin:5px;">
	<select class="form-control" id="1" style="margin-right:5px;">
	  <option>평수</option>
	  <option>10평</option>
	  <option>20평</option>
	  <option>30평</option>
	  <option>40평</option>
	</select>
	
	<select class="form-control" id="2" style="margin-right:5px;">
	  <option>주거형태</option>
	  <option>원룸&오피스텔</option>
	  <option>아파트</option>
	  <option>빌라&연립</option>
	  <option>단독주택</option>
	</select>
	
	<select class="form-control" id="3"> 
	  <option>스타일</option>
	  <option>모던</option>
	  <option>북유럽</option>
	  <option>빈티지</option>
	  <option>내추럴</option>
	  <option>프로방스&로맨틱</option>
	  <option>클래식&앤틱</option>
	  <option>한국&아시아</option>
	  <option>유니크</option>
	</select>
	</div>
	</form>
	
	<form action="">
	<div id="picture">
	<input type="file" name="file"  id="commImg" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(event); "> 
	 </div>
	 
	 
	 <div  id="image_container"></div>
	<div id="title" class="form-group">
	<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요">
	</div>
	
	
	<div id="write">
	<textarea id="summernote">
	
	</textarea>
	
	</div>
	
	<input type="hidden" name="commCategoryNo"  value="${param.commCategoryNo}"/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<div id="register">
		<button type="submit" class="btn btn-primary">등록</button>
	</div>	
	
</form>
</div>
</c:when>


<c:when test="${param.commCategoryNo == 5}">

	<div class="container pt-6">
		<h2>노하우 올리기</h2>
		
	<br><br>
<form name="insertForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/community/insert" >
	<div class="form-group">
	<b> 제목: <b> <input type="text" class="form-control" name="commTitle"  id="commTitle" placeholder="  올릴 게시글의 제목을 입력해주세요"/><p>
	</div>
		<input type="file" name="file"  id="commImg" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(event);"> 
	<div  id="image_container"></div>

	<br><br>
	<sec:authentication var="user" property="principal" />
	<input type="hidden" name="membNo"  value="${user.memberNo}"/>

	<%-- <%=request.getParameter("commCategoryNo")%>${param.commCategoryNo} --%>
	<input type="hidden" name="commCategoryNo"  value="${param.commCategoryNo}"/>
	<input type="hidden" name=${_csrf.parameterName} value="${_csrf.token}"/>
	<textarea id="summernote" name="commDescription"></textarea>
	<br><br>

	
	<button class="btn btn-primary" id="insert"  type="submit" > 등록 </button>
	
	
</form>

</div>
</c:when>
</c:choose>








</body>
</html>