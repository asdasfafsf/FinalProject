<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->

<body>

			<h3>잔액확인</h3>
			    <div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token3" name="token" value="052465af-5298-43fe-bc75-1505085624b5"></input> (inquiry scope token 필요)
					</div>
				</div>
					
				<form id="balanceFrm">
	
					<div class="fieldRow">
						<div title="fintech_use_num">핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px" value="199003849057724774002728"></input></div>
					</div>
					<div class="fieldRow">
						<div>요청일시</div>
						<div><input type="text" class="input-sm" id="tran_dtime" name="tran_dtime" style="width:135px"></input></div>
					</div>
					
				</form>
			<button type="button" id="btnRealNameInquiry" class="btn btn-sm btn-primary" style="margin-left:4px">잔액조회 수행</button>
			잔액조회 결과
			<textarea id="resultTextArea3" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
				

</body>
<script>

	$(document).ready(function(){
		
		//잔액조회 요청일시 채우기
		$('#tran_dtime').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
	});
	
	//잔액조회
	$('#btnRealNameInquiry').on('click', function(e){ 
		if(isEmptyElem('token3')){
				alert('Access Token을 먼저 획득해 주십시오.');
		return;
		}
	
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/account/balance',
			type: 'get',
			headers: {
				'Authorization': ('Bearer ' + $('#token3').val())
			},
			data: $('#balanceFrm').serialize()
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#resultTextArea3').val(js(data));
		});
	});
</script>
</html>