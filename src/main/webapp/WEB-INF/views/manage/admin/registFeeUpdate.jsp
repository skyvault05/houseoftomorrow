<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">



</script>
</head>
<body>
<h1>등록비 수정 폼</h1>

<form action="${pageContext.request.contextPath }/admin/price" method="POST"> 
<input type="text" name="priceName"> Price_name <p>
<input type="text" name="priceAmount"> Price_amount <p>

<input type="submit" value="입력하기(수정)">
</form>





</body>
</html>