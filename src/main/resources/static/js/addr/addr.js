$(function(){
	//카카오 주소 API
	$("#userAddrBtn").click(
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			function () {
	        	new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("roadAddress").value = roadAddr;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }

//		                var guideTextBox = document.getElementById("guide");
//		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//		                if(data.autoRoadAddress) {
//		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//		                    guideTextBox.style.display = 'block';
//		                } else {
//		                    guideTextBox.innerHTML = '';
//		                    guideTextBox.style.display = 'none';
//		                }
		            }
		        }).open();
	    	}
	);//주소 API 끝
	
	//onSubmit 주소 합치기
	function addAddr(){
		let addrStr = $('postcode').val()+","+$('roadAddress').val()+","+$('extraAddress').val()+","+$('detailAddress').val();
		let addr = $('<input>').attr('type', 'hidden').attr('name', 'conAddr').val(addrStr);
		$('form').append(addr);
		$('form').submit();
	}
	
	//contextPath
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	//아이디 중복체크
//	$('#idChk').click(function(){
//		if($('#userId').val() == null || $('#userId').val() == ""){
//			alert('아이디를 입력해주세요');
//			return false;
//		}
//		
//		let params = "key=idChk&userId="+$('#userId').val();
//		$.ajax({
//			dataType : "text",
//			url : getContextPath()+"/front?"+params,
//			success : function(result){
//				if(result==1){
//					alert("중복된 아이디입니다.");
//				}else{
//					$("#submit").removeAttr("disabled");
//					$("#submit").html("가입하기");
//					alert("사용 가능한 아이디입니다.");
//				}
//			}
//		});
//	});
//	
//	$('#userId').on("change", function(){
//		$("#submit").attr("disabled", true);
//		$("#submit").html("아이디 중복체크를 해주세요");
//	});
//	
//	$('#userPwd').on('keyup', function(){
//		if($('#userPwd').val() == $('#userPwdChk').val()){
//			$('#userPwdChkResult').css('visibility' ,'hidden');
//		}else{
//			$('#userPwdChkResult').css('visibility' ,'visible');
//		}
//	});
//	
//	$('#userPwdChk').on('keyup', function(){
//		if($('#userPwd').val() == $('#userPwdChk').val()){
//			$('#userPwdChkResult').css('visibility' ,'hidden');
//		}else{
//			$('#userPwdChkResult').css('visibility' ,'visible');
//		}	
//	});	
//	
//	$('#submit').on("click", function(){
//		if($('#userId').val() == null || $('#userId').val() == "" ||
//				$('#userPwd').val() == null || $('#userPwd').val() == "" ||
//				$('#userPwdChk').val() == null || $('#userPwdChk').val() == "" ||
//				$('#userName').val() == null || $('#userName').val() == "" ||
//				$('#roadAddress').val() == null || $('#roadAddress').val() == "" ||
//				$('#detailAddress').val() == null || $('#detailAddress').val() == "" ||
//				$('#userPhone').val() == null || $('#userPhone').val() == "" ||
//				$('#userEmail').val() == null || $('#userEmail').val() == "" ){
//			alert("항목을 확인해 주세요");
//			return false;
//		}
//	});
});

