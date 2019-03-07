<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->
</head>
<body>
<h3>계좌해지</h3>
				<div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token7" name="token" value="dbac22af-5c27-48ee-8380-28eb8fb6affc"></input> (login scope token 필요)
					</div>
				</div>
					
				<form id="cancelFrm">
	
					<div class="fieldRow">
						<div>scope</div>
						<div><input type="text" class="input-sm" id="scope" name="scope" style="width:125px"></input></div>
					</div>

					<div class="fieldRow">
						<div title="fintech_use_num">핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px"></input></div>
					</div>
					<div class="fieldRow">
						<div></div>
						<div> 
							※ 출금계좌 해지 테스트를 원하시면 테스트데이터관리에서 '출금동의여부 : N, 제3자 제공동의여부 : 공백'
      						    <br/>&nbsp;&nbsp;&nbsp;조회계좌 해지 테스트를 원하시면 테스트데이터관리에서 '출금동의여부 : 공백, 제3자 제공동의여부 : N'
     				<br/>&nbsp;&nbsp;&nbsp;으로 넣어 주시기 바랍니다.
						</div>
					</div>				
							
				</form>
				
				계좌해지 결과
					<button type="button" id="btnCancelAccount" class="btn btn-sm btn-primary" style="margin-left:4px">계좌해지 수행</button>
					<textarea id="resultTextArea7" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
				
</body>
<script>
//계좌해지
$('#btnCancelAccount').on('click', function(e){
	if(isEmptyElem('token7')){
				alert('Access Token을 먼저 획득해 주십시오.');
		return;
	}
	
	$.ajax({
		url: 'https://testapi.open-platform.or.kr/account/cancel',
		type: 'post',
		headers: {
			'Authorization': ('Bearer ' + $('#token7').val())
		},
		data: js($.extend({}, getFormParamObj('cancelFrm'), {
			// additional parameters
		}))
	})
	.done(function(data, textStatus, jqXHR){
		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
		
		// UI에 결과값 바인딩
		$('#resultTextArea7').val(js(data));
	});
});
</script>
</html>