/**
 * 
 */


	//callback에서 씀
	function bindAuthResults(o){
	
		for(key in o){
			setElemVal(key, o);
		}
	} 	
	
	//실명인증
	function clickRegisterAcctount(){
		
		event.stopPropagation();
		
		var frm = $('#authCodeReqFrm')[0], $frm = $(frm);
		var params = getFormParamObj('authCodeReqFrm');
		params['invoke_type'] = 'ajax'; // 이 경우, GW에서는 302 redirect 응답이 아닌 json 응답을 주도록 처리한다.
	
		// 현재 활성화된 header 필드만 골라서 headers 파라미터 객체를 생성한다.
		var headers = {};
		var $activeHeaderInputs = null; 	 
		
		/*console.log('## params: '+js(params));
		console.log('## headers: '+js(headers));*/
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/authorize2',
			type: 'get',
			headers: headers,
			data: params
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
			/*console.log('## data: '+js(data));*/
	
			var tmpWin = window.open('about:blank',"","width=600,height=600,left=600,top=100");
			tmpWin.location.href = data.location; // 프로바이더 페이지 호출
		});			
		
	
	}; 
	
	// 사용자조회 접근토큰, 갱신토큰, 사용자조회 이벤트
	function authorizeUser(){
		
		
		if(isEmptyElem('code')){
			alert('Authorization Code 를 먼저 획득해 주십시오.');
			return;
		}	
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/token',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'code': $('#code').val(), // auth code 필요
				'client_id': $('#client_id').val(),
				'client_secret': $('#client_secret').val(),
				'redirect_uri': $('#redirect_uri').val(),
				'grant_type': 'authorization_code'
			}
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#token').val(data.access_token);
			$('#refresh_token').val(data.refresh_token);
			$('#user_seq_no').val(data.user_seq_no);
			
			if(isEmptyElem('token')){
				alert('Access Token 을 먼저 획득해 주십시오.');
				return;
			}
			
			var option = {};
			
			$.ajax({
				url: 'https://testapi.open-platform.or.kr/v1.0/user/me',
				type: 'get',
				headers: {
					'Authorization': ('Bearer ' + $('#token').val())
				},
				
				data: $.extend(true, {
					'user_seq_no': $('#user_seq_no').val(),
					'tran_dtime': new Date().format('yyyyMMddHHmmss')
				}, option)
				
			})
			.done(function(data, textStatus, jqXHR){
				if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
				$('#user_token').val($('#token').val());
				$('#user_refresh_token').val($('#refresh_token').val());
				/*$('#user_name').val(data.user_name);*/
				$('#user_seq_no').val(Number(data.user_seq_no));
				$('#account_alias').val(data.res_list[0].account_alias);
				$('#account_holder_name').val(data.res_list[0].account_holder_name);
				$('#fintech_use_num').val(Number(data.res_list[0].fintech_use_num));
				$('#account_num_masked').val(data.res_list[0].account_num_masked);
				$('#bank_name').val(data.res_list[0].bank_name);
				$('#bank_code_std').val(data.res_list[0].bank_code_std);
				
				$('#inquiryUserInformResult').val(/*"접근토큰 : "+$('#token').val()+"  갱신토큰 : "+$('#refresh_token').val()+
						"\n계정 이름 : "+data.user_name+" 사용자일련번호 : "+data.user_seq_no+
						"\n통장별명 : "+data.res_list[0].account_alias+"\n통장주인 : "+data.res_list[0].account_holder_name+
						"\n핀번호 : "+data.res_list[0].fintech_use_num+
						"\n은행 : "+data.res_list[0].bank_name+" 은행번호 : "+data.res_list[0].bank_code_std+
						"\n계좌번호 : "+data.res_list[0].account_num_masked*/$('#user_token').val()+" "+
						$('#user_refresh_token').val()+" "+
						$('#user_name').val()+" "+
						$('#user_seq_no').val()+" "+
						$('#account_alias').val()+" "+
						$('#account_holder_name').val()+" "+
						$('#fintech_use_num').val()+" "+
						$('#account_num_masked').val()+" "+
						$('#bank_name').val()+" "+
						$('#bank_code_std').val());
				
				if($('#inquiryUserInformResult').val()==''){
					/*인증실패*/
				}
				else{
					/*인증성공*/
					/*console.log($('#user_token').val()+" "+
					$('#user_refresh_token').val()+" "+
					$('#user_name').val()+" "+
					$('#user_seq_no').val()+" "+
					$('#account_alias').val()+" "+
					$('#account_holder_name').val()+" "+
					$('#fintech_use_num').val()+" "+
					$('#account_num_masked').val()+" "+
					$('#bank_name').val()+" "+
					$('#bank_code_std').val());*/
				}
			});	
			
		});
	}
	

	/* //사용자조회 토큰 갱신
	$('#btnTokenByRT').on('click', function(){
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/token',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'client_id': $('#client_id').val(),
				'client_secret': $('#client_secret').val(),
				'refresh_token': $('#refresh_token').val(), // refresh token 필요
				'scope': $('#scope').val(),
				'grant_type': 'refresh_token'
			}
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#token').val(data.access_token);
			$('#refresh_token').val(data.refresh_token);
			$('#user_seq_no').val(data.user_seq_no);
		});
	
	}); */
