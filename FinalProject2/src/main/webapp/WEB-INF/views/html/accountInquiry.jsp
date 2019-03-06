<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
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

</head>
<body>
	<div class="fieldRow">
		<div>Client ID:</div>
		<div><input type="text" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"></input></div>
	</div>

	<div class="fieldRow">
		<div>Client Secret:</div>
		<div><input type="text" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"></input><span> (토큰발급시 필요)</span></div>
	</div>
	<input type="text" class="input-sm" id="token" name="token"></input>
	<button type="button" id="btnToken" class="btn btn-sm btn-primary">토큰발급</button> (oob scope token)
	<button id="inquiryAccount">계좌실명조회</button>
	<textarea id="resultTextArea" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
	
</body>
	<script>
	
	//토큰 발급
	$('#btnToken').on('click',function(){
		$.ajax({
			url: /* getSvrProps('base_api_uri') +  */'https://testapi.open-platform.or.kr/oauth/2.0/token',
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
			$('#token').val(data.access_token);
		});
	});
	
	$('#inquiryAccount').on('click',function(){
		 var data1 = {
				"bank_code_std": "004",
				"account_num": "1234567890123456",
				"account_holder_info": "940411       ",
				"tran_dtime": "20190212142138"
				}; 
		
		$.ajax({
			url: /* getSvrProps('base_api_uri') +  */'https://testapi.open-platform.or.kr/inquiry/real_name',
			type: 'post',
			headers: {
				'Authorization': ('Bearer ' + $('#token').val())
			},
			data: js($.extend({},{
				"bank_code_std": "004",
				"account_num": "1234567890123456",
				"account_holder_info": "940411       ",
				"tran_dtime": "20190212142138"
				}, {
				// additional parameters
			})),
			success:function(data){
				console.log(data);
			//console.log(js(data));
				
			},
			error:function(xhr,status){
				alert("eafaewfea");
			}
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			// UI에 결과값 바인딩
			$('#resultTextArea').val(js(data));
		});
	});
	
	</script>

</html>