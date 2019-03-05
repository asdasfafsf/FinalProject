<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="../ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<script type="text/javascript" src="../ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
<script type="text/javascript" src="../js/constants.js"></script><!-- 상수 js -->
<script type="text/javascript" src="../js/common.js"></script><!-- 사용자정의 js -->
</head>

<body>

	<form id="authCodeReqFrm" class="auth-form">
				
					
						<!-- <div>Client ID:</div> -->
						<div><input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"></input></div>
					

					
						<!-- <div>Client Secret:</div> -->
						<div><input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"></input><!-- <span> (토큰발급시 필요)</span> --></div>
					
					
					
						<!-- <div style="width:120px; float:left; margin-left:0px">Response Type:</div> -->
						<input type="hidden" class="input-sm" id="response_type" name="response_type" style="width:55px"  value="code" readonly="readonly" />						
						
						<!-- <div style="float:left">
							<select id="edit_option" name="edit_option" class="form-control" style="height:26px; font-size:14px; padding:1px 3px; margin-top:-2px">
								<option value=""></option>
								<option value="">on</option>
								<option value="">off</option>
							</select>
						</div> -->
					
					
						<!-- <div>Scope:</div> -->
						<div><input type="hidden" class="input-sm" id="scope" name="scope" style="width:150px" value="transfer login inquiry" /> <!-- 공백문자(" ")를 구분자로 하여 multi scope 요청 가능 (예: login transfer) --></div>
									
									
					
						<!-- <div>Redirect URI:</div> -->
						<div><input type="hidden" class="input-sm" id="redirect_uri" name="redirect_uri" style="width:392px" value="http://localhost:8880/punding/html/callback.html" /></div>
					
					
					
						<!-- <div>Client Info:</div> -->
						<div><input type="hidden" class="input-sm" id="client_info" name="client_info" style="width:392px" value="test whatever you want" /></div>
											

						<!-- <div style="width:60px; float:left; margin-left:145px">BG color:</div> -->
						<div style="float:left; margin-left:10px"><input type="hidden" class="input-sm" id="bg_color" name="bg_color" style="width:85px" value="#FAFAFA"/></div>
						<!-- <div style="width:70px; float:left; margin-left:15px">TXT color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="txt_color" name="txt_color" style="width:85px" value="#050505"/></div>						
						<!-- <div style="width:75px; float:left; margin-left:15px">BTN1 color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="btn1_color" name="btn1_color" style="width:85px" value="#006DB8"/></div>						
						<!-- <div style="width:75px; float:left; margin-left:15px">BTN2 color:</div> -->
						<div style="float:left"><input type="hidden" class="input-sm" id="btn2_color" name="btn2_color" style="width:85px" value="#818487"/></div>						
					
				</form>
	</br>
	
	<!-- 실명인증 -->
	<input type="hidden" class="input-sm" id="code" name="code" style="margin-left:4px"></input>
	<button type="button" id="authorizeUserButton" class="btn btn-sm btn-primary">사용자인증</button>
	<!-- 사용자일련번호 -->
	<input type="hidden" class="input-sm" id="user_seq_no" name="user_seq_no" style="width:110px"></input>					
						
	<!-- Access Token: -->
	<input type="hidden" class="input-sm" id="token" name="token"></input>
	<!-- <button type="button" id="btnToken2" class="btn btn-sm btn-primary">토큰발급</button> -->

	<!-- Refresh Token:-->
	<input type="hidden" class="input-sm" id="refresh_token" name="refresh_token"></input>
	<!--<button type="button" id="btnTokenByRT" class="btn btn-sm btn-primary" title="Refresh Token 을 사용한다.">토큰갱신</button> (Refresh Token 필요) -->

	<!-- <button type="button" id="inquiryUserInform" class="btn btn-sm btn-primary" style="margin-left:4px">사용자정보조회</button> (login scope token, 사용자일련번호 필요) -->
	<textarea id="inquiryUserInformResult" class="form-control" style="display:table-cell; width:100%; height:150px; margin-left:3px " ></textarea>

</body>

<script>
	
	//callback에서 씀
	function bindAuthResults(o){
	
		for(key in o){
			setElemVal(key, o);
		}
	} 	
	
	//실명인증
	$('#authorizeUserButton').on('click', function(){
	
		var frm = $('#authCodeReqFrm')[0], $frm = $(frm);
		var params = getFormParamObj('authCodeReqFrm');
		params['invoke_type'] = 'ajax'; // 이 경우, GW에서는 302 redirect 응답이 아닌 json 응답을 주도록 처리한다.
	
		// 현재 활성화된 header 필드만 골라서 headers 파라미터 객체를 생성한다.
		var headers = {};
		var $activeHeaderInputs = null; 	 
		
		console.log('## params: '+js(params));
		console.log('## headers: '+js(headers));
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/authorize2',
			type: 'get',
			headers: headers,
			data: params
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
			console.log('## data: '+js(data));
	
			var tmpWin = window.open('about:blank',"","width=600,height=600,left=600,top=100");
			tmpWin.location.href = data.location; // 프로바이더 페이지 호출
		});			
		
	
	}); 
	
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
				console.log("접근토큰 : "+$('#token').val()+"  갱신토큰 : "+$('#refresh_token').val());
				console.log("계정 이름 : "+data.user_name+" 사용자일련번호 : "+data.user_seq_no);
				console.log("통장별명 : "+data.res_list[0].account_alias);
				console.log("통장주인 : "+data.res_list[0].account_holder_name);
				console.log("핀번호 : "+data.res_list[0].fintech_use_num);
				console.log("은행 : "+data.res_list[0].bank_name+" 은행번호 : "+data.res_list[0].bank_code_std);
				console.log("계좌번호 : "+data.res_list[0].account_num_masked);
				$('#inquiryUserInformResult').val("접근토큰 : "+$('#token').val()+"  갱신토큰 : "+$('#refresh_token').val()+
						"\n계정 이름 : "+data.user_name+" 사용자일련번호 : "+data.user_seq_no+
						"\n통장별명 : "+data.res_list[0].account_alias+"\n통장주인 : "+data.res_list[0].account_holder_name+
						"\n핀번호 : "+data.res_list[0].fintech_use_num+
						"\n은행 : "+data.res_list[0].bank_name+" 은행번호 : "+data.res_list[0].bank_code_std+
						"\n계좌번호 : "+data.res_list[0].account_num_masked);
			});	
		});
	}
	

	//사용자조회 토큰 갱신
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
	
	});


</script>

</html>