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
	
</head>
<body>
		<h3>출금이체</h3>

					<div>Access Token:</div>
	
						<input type="text" class="input-sm" id="token4" name="token" value="67e55d47-117a-4359-9e84-ea3cab09bf00"></input> (transfer scope token 필요)

				<form id="withdrawFrm">
	
					<div class="fieldRow">
						<div>핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px" value="199003849057724774092534"></input></div>
					</div>
					<div class="fieldRow">
						<div>입금계좌인자내역</div>
						<div><input type="text" class="input-sm" id="dps_print_content" name="dps_print_content" style="width:410px" value="통장기재내용"></input></div>
					</div>
					<!-- <div class="fieldRow">
						<div>출금계좌인자내역</div>
						<div><input type="text" class="input-sm" id="print_content" name="print_content" style="width:410px"></input></div>
					</div>  -->
					<div class="fieldRow">
						<div>요청일시</div>
						<div><input type="text" class="input-sm" id="tran_dtime2" name="tran_dtime" style="width:135px"></input></div>
					</div>
					<!-- <div class="fieldRow">
						<div>CMS번호</div>
						<div><input type="text" class="input-sm" id="cms_no" name="cms_no" style="width:135px"></input></div>
					</div>  -->
					<div class="fieldRow">
						<div>거래금액</div>
						<div>
							<input type="text" class="input-sm" id="tran_amt" name="tran_amt" style="width:135px"></input>
							<button type="button" id="btnWithdraw" class="btn btn-sm btn-primary">출금이체 수행</button>
						</div>
					</div>
					<div class="fieldRow">
						<div></div>
						<div> 
							※ 출금이체 시뮬레이터 데이터 입력 안내 <br />
   							- 테스트베드 > 마이페이지 > 테스트 데이터 관리 > "출금이체" 데이터 추가<br />
     						&nbsp;&nbsp;· 송금인 실명 : 출금되는 사용자 계좌의 예금주명으로 입력   ex)홍길동<br />
     						&nbsp;&nbsp;· 출금계좌 인자내역 : 기본값("통장기재내용") 입력<br />
						    &nbsp;&nbsp;· 수취인 성명 : 기본값("예금주명") 입력<br />
						</div>
					</div>					
				</form>
						
			출금이체 결과
			<textarea id="resultTextArea4" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
					
</body>

	<script>
		$(document).ready(function(){
			
			//출금이체
			$('#tran_dtime2').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
			
		});
		
		//출금이체
		$('#btnWithdraw').on('click', function(e){
			if(isEmptyElem('token4')){
					alert('Access Token을 먼저 획득해 주십시오.');
				return;
			}
			
			$.ajax({
				url: 'https://testapi.open-platform.or.kr/transfer/withdraw',
				type: 'post',
				headers: {
					'Authorization': ('Bearer ' + $('#token4').val())
				},
				data: js($.extend({}, getFormParamObj('withdrawFrm'), {
					// additional parameters
				}))
			})
			.done(function(data, textStatus, jqXHR){
				if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
				
				// UI에 결과값 바인딩
				$('#resultTextArea4').val(js(data));
			});	
		});
		
	</script>

</html>