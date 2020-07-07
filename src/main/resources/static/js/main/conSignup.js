var pwdCheck = false;
		var idCheck = false;
		var phoneCheck = false;
		function isEmail(asValue) {
	
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
	
		}
		// 핸드폰 번호 체크 정규식
	
		function isCelluar(asValue) {
			var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
	
		}
		
		$(function(){
			$('input[name=conIsCompany]').on('change', function(){
				if($(this).val()==1){
					$('label[for=conCertification]').text('사업자 등록번호');
					$('#conCertification').attr('placeholder', '사업자 등록번호');
				}else{
					$('label[for=conCertification]').text('주민등록번호');
					$('#conCertification').attr('placeholder', '주민등록번호');
				}
			});
			
			$('#dupCheck').click(function(){//id체크
				if(!isEmail($('#memberId').val())){
					alert("올바르지 않은 이메일 형식입니다.");
					return false;
				}
				$.ajax({
					url: "/idCheck",
					type: "post",
					dataType: "text",
					data: {
						memberId : $('#memberId').val()
					},
					success: function(response){
						if(response == "possible"){
							alert("사용 가능한 아이디 입니다.");
							idCheck=true;
						}else{
							alert("중복된 아이디 입니다.");
						}
					},
					error: function(e){
						alert(e);
					}
				});
			});
	
			$('#phoneCheck').click(function(){//폰 번호 체크
				if(!isCelluar($('#phone').val())){
					alert("올바르지 않은 핸드폰 번호입니다.");
					return false;
				}
				$.ajax({
					url: "/phoneCheck",
					type: "post",
					dataType: "text",
					data: {
						memberPhone : $('#phone').val()
					},
					success: function(response){						
						if(response == "possible"){
							phoneCheck=true;
							alert('사용 가능한 핸드폰 번호입니다.');
						}else{
							alert('사용 불가능한 핸드폰 번호입니다.');
						}
					},
					error: function(e){
						alert(e);
					}
				});
			});
	
			$('#passwordCheck').keyup(function(){//비밀번호 체크
				if($('#password').val() == $(this).val()){
					$('span.checkSpan').hide();
					pwdCheck = true;
				}else{
					$('span.checkSpan').show();
					pwdCheck = false;
				}
			});
			
			$('#memberId').keyup(function(){
				idCheck=false;
			});
			
			$('#password').keyup(function(){
				if($('#passwordCheck').val() == $(this).val()){
					$('span.checkSpan').hide();
					pwdCheck = true;
				}else{
					$('span.checkSpan').show();
					pwdCheck = false;
				}
			});
			
			$('#phone').keyup(function(){
				phoneCheck=false;
			})
			
			$('#signupBtn').click(function(){
				if(!(idCheck && phoneCheck && pwdCheck)){
					if(!idCheck){
						alert("id를 확인해 주세요.");
					}else if(!phoneCheck){
						alert("전화번호를 확인해 주세요.");
					}else if(!pwdCheck){
						alert("비밀번호를 확인해 주세요.");
					}
					return false;
				}
			});
			
		});