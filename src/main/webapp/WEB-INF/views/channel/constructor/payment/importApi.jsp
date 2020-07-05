<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
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
</script>


<title> 결제 API </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<h2> 결제 페이지 </h2>
	<script>
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init("imp17102225");
		var msg;
		
		IMP.request_pay({
			pg: 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '내일의 집 시공 결제',
            amount : <%=totalPrice%>,
         				
		}, function(rsp) { 
			if( rsp.success ) {
			   alert("Ajax 바로 앞")
				$.ajax({
					url: "${pageContext.request.contextPath}/channel/constructor/payment/complete",
					type: 'POST',
					contentType : 'application/json; charset=UTF-8',
					dataType:'text',
					data: {						
						"pay_method" : rsp.pay_method,
						"status" : rsp.status,
						"pg_provider" : rsp.pg_provider
					},
					success:function(data){
						console.log('Ajax 성공 :');
						alert('Ajax 성공 && data : ' + data);
						
						msg = '결제가 완료되었습니다.';
						msg +='\n 고유 ID ' + rsp.imp_uid;
						msg +='\n 상점 거래 ID : ' + rsp.merchant_uid;
						msg +='\n결제 금액 : ' + rsp.paid_amount;
						msg +='\n카트 승인번호 : ' + rsp.apply_num;
						msg +='\n결제 방법 : ' + rsp.pay_method;
						msg +='\n상태값 : ' + rsp.status;
						msg +='\n제공자? : ' + rsp.pg_provider;
						alert(msg);
						console.log(msg);
						
						
						alert('최종 성공 알림'+msg);	
				        opener.document.portForm.submit();
		                self.close();
											
					} 
					
				}); //ajax 끝 부분 
				
			  /*   var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        
		        msg += '결제수단 : ' + rsp.pay_method
		        msg += '결제상태 : ' + rsp.status
		        alert(msg);	 */
		        
				
						
				
			}else{ // if 끝 
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href="${pageContext.request.contextPath}/channel/constructor/myChannel";
				alert(msg);
			} 
			
			
			
		}); //IMP_request.pay 끝
		
		
		
	}); //function 끝

	
	
	
	
	
	
	</script>
 
</body>
</html>