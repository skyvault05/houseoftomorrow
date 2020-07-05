<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%
	 int totalPrice = 100;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<script src="/plugins/jquery/jquery-3.4.1.min.js"></script>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content"); 
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
function addInput(form, name, value){
	$("<input />").attr("type", "hidden")
    .attr("name", name)
    .attr("value", value)
    .appendTo(form);
}
</script>

<title> 결제 API </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<sec:authentication property="principal" var="user"/>
<h2> 결제 페이지 </h2>
	<script>
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init("imp17102225");
		var msg;
		
		IMP.request_pay({
			/* pg: 'inicis', */
			/* pay_method : 'card', */
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '내일의 집 포트폴리오 결제',
            amount : <%=totalPrice%>,
         				
		}, function(rsp) { 
			if(rsp.success) {
				
				opener.document.portForm.submit();
                self.close();			
			}else{ // if 끝 
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href="${pageContext.request.contextPath}/channel/guest/channelDetail/${user.chNo}";
				alert(msg);
			}
		}); //IMP_request.pay 끝	
	}); //function 끝
	</script>
</body>
</html>