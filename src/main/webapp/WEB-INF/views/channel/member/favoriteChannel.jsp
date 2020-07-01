<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의 집</title>
</head>
<body>
<c:forEach items="${fvChannel}" var="fvChannel">
<img src="${fvChannel.channel.chImg}"/>
${fvChannel.channel.constructor.conName}
</c:forEach>
</body>
</html>