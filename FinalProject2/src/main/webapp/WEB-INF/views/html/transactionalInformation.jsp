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
<h3>거래내역</h3>
			<div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token6" name="token" value="dbac22af-5c27-48ee-8380-28eb8fb6affc"></input> (inquiry scope token 필요)
					</div>
				</div>
					
				<form id="transaction_listFrm">
	
					<div class="fieldRow">
						<div>핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px"></input></div>
					</div>

					<div class="fieldRow">
						<div>조회구분코드</div>
						<div>
							<select id="inquiry_type" name="inquiry_type" class="form-control" style="height:26px; font-size:14px; padding:1px 3px">
								<option value="A" selected="selected">ALL(A)</option>
								<option value="I">입금(I)</option>
								<option value="O">출금(O)</option>
							</select>
						</div>
					</div>
					
					<div class="fieldRow">
						<div>조회시작일자</div>
						<div>
							<input type="text" class="input-sm" id="from_date" name="from_date" style="width:95px"></input>
						</div>
					</div>

					<div class="fieldRow">
						<div>조회종료일자</div>
						<div>
							<input type="text" class="input-sm" id="to_date" name="to_date" style="width:95px"></input>
						</div>
					</div>

					<div class="fieldRow">
						<div>정렬순서</div>
						<div>
							<select id="sort_order" name="sort_order" class="form-control" style="height:26px; font-size:14px; padding:1px 3px">
								<option value="D">역순(D)</option>
								<option value="A">순차(A)</option>
							</select>						
						</div>
					</div>

					<div class="fieldRow">
						<div>페이지번호</div>
						<div><input type="text" class="input-sm" id="page_index" name="page_index" style="width:80px" value="1"></input></div>
					</div>

					<div class="fieldRow">
						<div>요청일시</div>
						<div><input type="text" class="input-sm" id="tran_dtime6" name="tran_dtime" style="width:135px"></input></div>
					</div>

					<div class="fieldRow">
						<div>직전조회추적정보</div>
						<div><input type="text" class="input-sm" id="befor_inquiry_trace_info" name="befor_inquiry_trace_info" style="width:220px"></input></div>
					</div>

					<div class="fieldRow">
						<div>최종거래내역순번</div>
						<div><input type="text" class="input-sm" id="list_tran_seqno" name="list_tran_seqno" style="width:220px"></input></div>
					</div>
					
				</form>
				
					거래내역조회 결과
					<button type="button" id="btnTransactionList" class="btn btn-sm btn-primary" style="margin-left:4px">거래내역조회 수행</button>
					<textarea id="resultTextArea6" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
				
</body>
	<script>
	$(document).ready(function(){
		
		//거래내역
		$('#tran_dtime6').val(new Date().format('yyyyMMddHHmmss'));
		$('#to_date').val(new Date().format('yyyyMMdd'));
		$('#from_date').val(new Date().format('yyyyMMdd'));
		
	});
	
	//거래내역
	$('#btnTransactionList').on('click', function(e){
		if(isEmptyElem('token6')){
				alert('Access Token을 먼저 획득해 주십시오.');
			return;
		}
		
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/account/transaction_list',
			type: 'get',
			headers: {
				'Authorization': ('Bearer ' + $('#token6').val())
			},
			data: $('#transaction_listFrm').serialize()
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			
			// UI에 결과값 바인딩
			$('#resultTextArea6').val(js(data));
		});
	});
	
	</script>
</html>