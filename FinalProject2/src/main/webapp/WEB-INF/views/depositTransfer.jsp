<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->
	
	<script src="/test/resources/js/common/Alert.js"></script>
	<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>

</head>
<body>
	<!-- <h3>입금핀번호이체</h3>
			<div class="fieldRow">
					<div>Client ID:</div> -->
					<div><input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"/></div>
				<!-- </div>

				<div class="fieldRow">
					<div>Client Secret:</div> -->
					<div><input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"/><!-- <span> (token 발급시 사용)</span> --></div>
				<!-- </div>

				<div class="fieldRow">
					<div>Access Token:</div>
					<div> -->
						<input type="hidden" class="input-sm" id="token5" name="token"></input>
					<!-- 	<button type="button" id="btnToken5" class="btn btn-sm btn-primary">토큰발급</button> (oob scope token)
					</div>
				</div> -->
					
				<form id="depositFrm">
	
					<!-- <div class="fieldRow">
						<div>입금이체암호문구</div> -->
						<div><input type="hidden" class="input-sm" id="wd_pass_phrase" name="wd_pass_phrase" style="width:220px" value="NONE"/><!-- &nbsp;&nbsp;(기본값 : NONE) --></div>
					<!-- </div>
					<div class="fieldRow">
						<div>출금계좌인자내역</div> -->
						<div><input type="hidden" class="input-sm" id="wd_print_content" name="wd_print_content" style="width:410px" value="출금인자 01"/><!-- &nbsp;&nbsp;(이용기관의 입금이체용 계좌) --></div>
					<!-- </div>
					<div class="fieldRow">
						<div>수취인성명 확인여부</div> -->
						<div><input type="hidden" class="input-sm" id="name_check_option" name="name_check_option" style="width:100px" value="on"/><!-- &nbsp;&nbsp;(기본값:on) --></div>
					<!-- </div>
					<div class="fieldRow">
						<div>요청일시</div> -->
						<div><input type="hidden" class="input-sm" id="tran_dtime5" name="tran_dtime" style="width:135px"></input></div>
					<!-- </div> -->
					
					<input type="hidden" id="req_cnt" name="req_cnt" />
					
				</form>
				
				<!-- <div class="fieldRow" style="overflow-x:auto">
					<div>&nbsp;</div>					
						<div style="width:750px">  -->
						<!-- 다건 요청시 사용하는 폼 테이블 -->
						<table id="depositInputTable" class="table table-condensed multiInputTable">
							<thead>
								<tr>
									<th width="220px">핀테크이용번호</th>
									<th width="auto">입금계좌인자내역</th>
									<th width="120px">거래금액</th>
									<!-- <th width="120px">CMS번호</th> -->
									<th width="80px"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="input-sm" id="fintech_use_num_0" name="fintech_use_num_0"></td>
									<td><input type="text" class="input-sm" id="print_content_0" name="print_content_0" value="리워드 펀딩금"></td>
									<td><input type="text" class="input-sm ar" id="tran_amt_0" name="tran_amt_0"></td>
									<!-- <td><input type="text" class="input-sm" id="cms_no_0" name="cms_no_0"></td> -->

								</tr>
							</tbody>
						</table>
					</div>
				</div>				
				
						입금이체 결과
						<button type="button" id="btnDeposit" class="btn btn-sm btn-primary" style="margin-left:4px">입금이체 수행</button>
						<textarea id="resultTextArea5" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
					
</body>
	<script>
	$(document).ready(function(){
		
		//입금이체
		$('#tran_dtime5').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
		
	});
	
	//입금이체
	$('#btnToken5').on('click', function(){
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/token',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'client_id': $('#client_id').val(),
				'client_secret': $('#client_secret').val(),
				'grant_type': 'client_credentials',
				'scope': 'oob'
			}
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#token5').val(data.access_token);
		});
	});
	
	$('#btnDeposit').on('click', function(e){
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/oauth/2.0/token',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'client_id': $('#client_id').val(),
				'client_secret': $('#client_secret').val(),
				'grant_type': 'client_credentials',
				'scope': 'oob'
			}
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#token5').val(data.access_token);	

			$('#req_cnt').val(getJsonArrayFromTable($('#depositInputTable')).length); // 요청건수 계산
			
			$.ajax({
				url: 'https://testapi.open-platform.or.kr/transfer/deposit',
				type: 'post',
				headers: {
					'Authorization': ('Bearer ' + $('#token5').val())
				},
				data: js($.extend({}, getFormParamObj('depositFrm'), {
					req_list: getJsonArrayFromTable($('#depositInputTable'))
				}))
			})
			.done(function(data, textStatus, jqXHR){
				if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
				
				// UI에 결과값 바인딩
				$('#resultTextArea5').val(js(data));
				if(data.rsp_message==""){
					alertBox("",data.res_list[0].account_holder_name+"님의 "+data.res_list[0].bank_name+" "+data.res_list[0].account_num_masked+"로 "+data.res_list[0].print_content+" "+data.res_list[0].tran_amt+"원 입금되었습니다.");
				}else{
					alertBox("","입금 실패하였습니다");
				}
			});
		
		});
		
		/* if(isEmptyElem('token5')){
				alert('Access Token을 먼저 획득해 주십시오.');
			return;
		}

		$('#req_cnt').val(getJsonArrayFromTable($('#depositInputTable')).length); // 요청건수 계산
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/transfer/deposit',
			type: 'post',
			headers: {
				'Authorization': ('Bearer ' + $('#token5').val())
			},
			data: js($.extend({}, getFormParamObj('depositFrm'), {
				req_list: getJsonArrayFromTable($('#depositInputTable'))
			}))
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#resultTextArea5').val(js(data));
		}); */
	});
	
	
	</script>

</html>