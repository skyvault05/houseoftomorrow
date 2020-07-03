<%@page import="java.lang.reflect.Field"%>
<%@page import="hot.member.domain.MemberRole"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
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
</head>
<body>
<form>
<sec:authentication var="user" property="principal" />
<h1>
<sec:authorize access="isAuthenticated()">
user:${user.memberNo}
</sec:authorize>
</h1>
<sec:authorize access="hasRole('ROLE_MEMBER') and isAuthenticated()">
<h1>authorized</h1>
</sec:authorize>
<form><textarea id="summernote"></textarea>
</form>
<form method="POST" action="/logout">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="logout">

<%
Map<String, String> map = new HashMap<>();
map.put("first", "val1");
map.put("second", "val2");
map.put("third", "val3");
String str = "str1";
pageContext.setAttribute("map", map);
MemberRole mr = new MemberRole();
mr.setMemberRoleName("dd");

Field field = mr.getClass().getDeclaredField("memberRoleName");
field.setAccessible(true);
pageContext.setAttribute("fieldName", field.getName());
pageContext.setAttribute("field", field.get(mr));
%>
${map}<p>
${map.second}<p>
${map.third}<p>
field:${field}<p>

</form>
<div th:replace="/header :: header">
</body>
</html>