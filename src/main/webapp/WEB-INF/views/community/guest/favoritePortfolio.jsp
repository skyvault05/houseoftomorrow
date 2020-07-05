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
<c:forEach items="${fport}" var="port">
<img src="${port.portfolio.portImg}"/><p>
${port.portfolio.portTitle}<p>
${port.portfolio.channel.constructor.conName}
</c:forEach>
</body>
</html>