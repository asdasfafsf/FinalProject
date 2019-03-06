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
</head>
<body>
	<form id="authCodeReqFrm" class="auth-form">
				
					<div class="fieldRow">
						<div>Client ID:</div>
						<div><input type="text" class="input-sm" id="client_id" name="client_id"></input></div>
					</div>

					<div class="fieldRow">
						<div>Client Secret:</div>
						<div><input type="text" class="input-sm" id="client_secret" name="client_secret"></input><span> (토큰발급시 필요)</span></div>
					</div>
					
					<div class="fieldRow">
						<div style="width:120px; float:left; margin-left:0px">Response Type:</div>
						<div style="float:left; margin-left:23px"><input type="text" class="input-sm" id="response_type" name="response_type" style="width:55px"  value="code" readonly="readonly" /></div>						
						<!-- <div style="width:43px; float:left; margin-left:30px">Lang:</div>
						<div style="float:left">
							<select id="lang" name="lang" class="form-control" style="height:26px; font-size:14px; padding:1px 3px; margin-top:-2px">
								<option value=""></option>
								<option value="kor">kor</option>
								<option value="eng">eng</option>
								<option value="vnm">vnm</option>
								<option value="idn">idn</option>
								<option value="khm">khm</option>
								<option value="phl">phl</option>
								<option value="npl">npl</option>
								<option value="bgd">bgd</option>
								<option value="pak">pak</option>
								<option value="rus">rus</option>
								<option value="uzb">uzb</option>
							</select>
						</div>
						<div style="width:83px; float:left; margin-left:30px">edit_option:</div> -->
						<div style="float:left">
							<select id="edit_option" name="edit_option" class="form-control" style="height:26px; font-size:14px; padding:1px 3px; margin-top:-2px">
								<option value=""></option>
								<option value="">on</option>
								<option value="">off</option>
							</select>
						</div>
					</div>				
					<div style="clear:both;"></div><!-- float 중단 -->

					<div class="fieldRow">
						<div>Scope:</div>
						<div><input type="text" class="input-sm" id="scope" name="scope" style="width:150px" value="transfer login inquiry" /> 공백문자(" ")를 구분자로 하여 multi scope 요청 가능 (예: login transfer)</div>
					</div>				
	
					<div class="fieldRow">
						<div>Redirect URI:</div>
						<div><input type="text" class="input-sm" id="redirect_uri" name="redirect_uri" style="width:392px" value="http://localhost:9090/test/gagam" /></div>
					</div>
					
					<div class="fieldRow">
						<div>Client Info:</div>
						<div><input type="text" class="input-sm" id="client_info" name="client_info" style="width:392px" value="test whatever you want" /></div>
					</div>			

					<div class="fieldRow">
						<div>Auth type:</div>
						<div>
							<select id="auth_type" name="auth_type" class="form-control" style="height:26px; font-size:14px; padding:1px 3px">
								<option value="0" selected="selected">CASE 1 (0)</option>
								<option value="1">CASE 2 (1)</option>
								<option value="2">CASE 3 (2)</option>
							</select>
						</div>
					</div>				

					<div class="fieldRow" style="height:25px">
						<div style="width:60px; float:left; margin-left:145px">BG color:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="bg_color" name="bg_color" style="width:85px" value="#FAFAFA"/></div>
						<div style="width:70px; float:left; margin-left:15px">TXT color:</div>
						<div style="float:left"><input type="text" class="input-sm" id="txt_color" name="txt_color" style="width:85px" value="#050505"/></div>						
						<div style="width:75px; float:left; margin-left:15px">BTN1 color:</div>
						<div style="float:left"><input type="text" class="input-sm" id="btn1_color" name="btn1_color" style="width:85px" value="#006DB8"/></div>						
						<div style="width:75px; float:left; margin-left:15px">BTN2 color:</div>
						<div style="float:left"><input type="text" class="input-sm" id="btn2_color" name="btn2_color" style="width:85px" value="#818487"/></div>						
					</div>
					<div style="clear:both;"></div><!-- float 중단 -->

				</form>
				
				<!-- <form id="headerFrm">
				
					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-UserSeqNo:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserSeqNo" name="Kftc-Bfop-UserSeqNo" style="width:130px" /></div>
						<div style="width:160px; float:left; margin-left:25px">Kftc-Bfop-UserCI:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserCI" name="Kftc-Bfop-UserCI" style="width:392px" /></div>						
					</div>				
					<div style="clear:both;"></div>float 중단

					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-UserName:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserName" name="Kftc-Bfop-UserName" style="width:130px" /></div>
						<div style="width:160px; float:left; margin-left:25px">Kftc-Bfop-UserInfo:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserInfo" name="Kftc-Bfop-UserInfo" style="width:130px" /></div>						
					</div>				
					<div style="clear:both;"></div>float 중단

					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-UserCellNo:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserCellNo" name="Kftc-Bfop-UserCellNo" style="width:130px" /></div>
						<div style="width:160px; float:left; margin-left:25px">Kftc-Bfop-PhoneCarrier:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-PhoneCarrier" name="Kftc-Bfop-PhoneCarrier" style="width:130px" /></div>						
					</div>				
					<div style="clear:both;"></div>float 중단

					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-UserEmail:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-UserEmail" name="Kftc-Bfop-UserEmail" style="width:180px" /></div>						
					</div>				
					<div style="clear:both;"></div>float 중단

					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-BankCodeStd:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-BankCodeStd" name="Kftc-Bfop-BankCodeStd" style="width:130px" /></div>
						<div style="width:160px; float:left; margin-left:25px">Kftc-Bfop-AccountNum:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-AccountNum" name="Kftc-Bfop-AccountNum" style="width:180px" /></div>						
					</div>				
					<div style="clear:both;"></div>float 중단

					<div class="fieldRow">
						<div style="width:155px; float:left; margin-left:145px">Kftc-Bfop-AccessToken:</div>
						<div style="float:left; margin-left:10px"><input type="text" class="input-sm" id="Kftc-Bfop-AccessToken" name="Kftc-Bfop-AccessToken" style="width:330px" /></div>
					</div>				
					<div style="clear:both;"></div>float 중단
	
				</form>	 -->			

	</br>
	<input type="text" class="input-sm" id="token" name="token"></input>
	<button type="button" id="btnToken" class="btn btn-sm btn-primary">토큰발급</button> (oob scope token)
	<button id="gaga">계좌실명조회</button>
	<textarea id="resultTextArea" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
	
	<hr>
	실명인증
	<input type="text" class="input-sm" id="code" name="code" style="margin-left:4px"></input>
	<button type="button" id="btnAuthCode" class="btn btn-sm btn-primary">사용자인증</button>
	사용자일련번호<input type="text" class="input-sm" id="user_seq_no" name="user_seq_no" style="width:110px"></input>					
						
	<div class="fieldRow">
		<div>Access Token:</div>
		<div>
			<input type="text" class="input-sm" id="token2" name="token"></input>
			<button type="button" id="btnToken2" class="btn btn-sm btn-primary">토큰발급</button>
		</div>
	</div>
				
	<div class="fieldRow">
		<div>Refresh Token:</div>
		<div>
			<input type="text" class="input-sm" id="refresh_token" name="refresh_token"></input>
			<button type="button" id="btnTokenByRT" class="btn btn-sm btn-primary" title="Refresh Token 을 사용한다.">토큰갱신</button> (Refresh Token 필요)
		</div>
	</div>
	
	<button type="button" id="btnUserMe" class="btn btn-sm btn-primary" style="margin-left:4px">사용자정보조회</button> (login scope token, 사용자일련번호 필요)
	<textarea id="resultTextArea2" class="form-control" style="display:table-cell; width:100%; height:150px; margin-left:3px " ></textarea>
	
	<h3>잔액확인</h3>
			    <div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token3" name="token"></input> (inquiry scope token 필요)
					</div>
				</div>
					
				<form id="balanceFrm">
	
					<div class="fieldRow">
						<div title="fintech_use_num">핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px"></input></div>
					</div>
					<div class="fieldRow">
						<div>요청일시</div>
						<div><input type="text" class="input-sm" id="tran_dtime" name="tran_dtime" style="width:135px"></input></div>
					</div>
					
				</form>
			<button type="button" id="btnRealNameInquiry" class="btn btn-sm btn-primary" style="margin-left:4px">잔액조회 수행</button>
			잔액조회 결과
			<textarea id="resultTextArea3" class="form-control" style="display:table-cell; width:100%; height:100%; margin-left:3px"></textarea>
				
				
			<h3>출금이체</h3>

					<div>Access Token:</div>
	
						<input type="text" class="input-sm" id="token4" name="token"></input> (transfer scope token 필요)

					
				<form id="withdrawFrm">
	
					<div class="fieldRow">
						<div>핀테크이용번호</div>
						<div><input type="text" class="input-sm" id="fintech_use_num" name="fintech_use_num" style="width:220px"></input></div>
					</div>
					<div class="fieldRow">
						<div>입금계좌인자내역</div>
						<div><input type="text" class="input-sm" id="dps_print_content" name="dps_print_content" style="width:410px"></input></div>
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
					
					
			<h3>입금핀번호이체</h3>
			<div class="fieldRow">
					<div>Client ID:</div>
					<div><input type="text" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"></input></div>
				</div>

				<div class="fieldRow">
					<div>Client Secret:</div>
					<div><input type="text" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"></input><span> (token 발급시 사용)</span></div>
				</div>

				<div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token5" name="token"></input>
						<button type="button" id="btnToken5" class="btn btn-sm btn-primary">토큰발급</button> (oob scope token)
					</div>
				</div>
					
				<form id="depositFrm">
	
					<div class="fieldRow">
						<div>입금이체암호문구</div>
						<div><input type="text" class="input-sm" id="wd_pass_phrase" name="wd_pass_phrase" style="width:220px" value="NONE"></input>&nbsp;&nbsp;(기본값 : NONE)</div>
					</div>
					<div class="fieldRow">
						<div>출금계좌인자내역</div>
						<div><input type="text" class="input-sm" id="wd_print_content" name="wd_print_content" style="width:410px" value="출금인자 01"></input>&nbsp;&nbsp;(이용기관의 입금이체용 계좌)</div>
					</div>
					<div class="fieldRow">
						<div>수취인성명 확인여부</div>
						<div><input type="text" class="input-sm" id="name_check_option" name="name_check_option" style="width:100px" value="on"></input>&nbsp;&nbsp;(기본값:on)</div>
					</div>
					<div class="fieldRow">
						<div>요청일시</div>
						<div><input type="text" class="input-sm" id="tran_dtime5" name="tran_dtime" style="width:135px"></input></div>
					</div>
					
					<input type="hidden" id="req_cnt" name="req_cnt" />
					
				</form>
				
				<div class="fieldRow" style="overflow-x:auto">
					<div>&nbsp;</div>					
						<div style="width:750px"> 
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
									<td><input type="text" class="input-sm" id="print_content_0" name="print_content_0"></td>
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
				
				
				<h3>계좌해지</h3>
				<div class="fieldRow">
					<div>Access Token:</div>
					<div>
						<input type="text" class="input-sm" id="token7" name="token" value="3e84cc84-f27b-415d-a534-c1b17e24905a"></input> (login scope token 필요)
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
		
		$(document).ready(function(){
					
			$('#client_id').val('l7xx6d3f293ff0434fe688e43049b3b0b0a8');
			$('#client_secret').val('cde4c721f31040f4a98e7f44ca4613d7');
			
			//잔액조회 요청일시 채우기
			$('#tran_dtime').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
			
			//출금이체
			$('#tran_dtime2').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
			
			//입금이체
			$('#tran_dtime5').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
			
			//거래내역
			$('#tran_dtime6').val(new Date().format('yyyyMMddHHmmss'));
			$('#to_date').val(new Date().format('yyyyMMdd'));
			$('#from_date').val(new Date().format('yyyyMMdd'));
			
		});
		
		
		$('#gaga').on('click',function(){
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
		
		
		/**
 * header 값을 넘길 목적으로 생성한 input 중에서 현재 auth_type 에 따라 활성화된 input의 집합만 선별하여 리턴한다.
 */
function getActiveHeaderInputs(){
	
	var val = $('#auth_type').val(), $hips = $('input[id^=Kftc-Bfop-]');
	switch(val){
	case '0': // 모든 header 값을 넘기지 않는다.
		return null; 
		break;
	case '1': // 몇몇 항목을 제외한 header 값을 넘긴다.
		return $hips.not('#Kftc-Bfop-AccessToken'); 
		break;
	case '2': // 몇몇 항목을 제외한 header 값을 넘긴다.
		return $hips.not('#Kftc-Bfop-UserName, #Kftc-Bfop-UserInfo, #Kftc-Bfop-UserCellNo, #Kftc-Bfop-PhoneCarrier, #Kftc-Bfop-UserEmail, #Kftc-Bfop-BankCodeStd, #Kftc-Bfop-AccountNum');
		break;
	}
}
function bindAuthResults(o){

	for(key in o){
		setElemVal(key, o);
	}
}		
		//실명인증
		$('#btnAuthCode').on('click', function(){ 

			var frm = $('#authCodeReqFrm')[0], $frm = $(frm);
			var params = getFormParamObj('authCodeReqFrm');
			params['invoke_type'] = 'ajax'; // 이 경우, GW에서는 302 redirect 응답이 아닌 json 응답을 주도록 처리한다.

			// 현재 활성화된 header 필드만 골라서 headers 파라미터 객체를 생성한다.
			var headers = {};
			var $activeHeaderInputs = getActiveHeaderInputs();
			if($activeHeaderInputs != null){
				$activeHeaderInputs.each(function(i){
					var input = this, $input = $(input), id = input.id, val = $input.val();
					if(id == 'Kftc-Bfop-UserName'){ val = encodeURIComponent(val); }
					headers[id] = val;
				});
			}	 
			
			console.log('## params: '+js(params));
			console.log('## headers: '+js(headers));
			
			$.ajax({
				url: /* getSvrProps('base_api_uri') +  */'https://testapi.open-platform.or.kr/oauth/2.0/authorize2',
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
		
		// 사용자조회 토큰발급
		$('#btnToken2').on('click', function(){
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
				$('#token2').val(data.access_token);
				$('#refresh_token').val(data.refresh_token);
				$('#user_seq_no').val(data.user_seq_no);
			});
		});
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
		
		//사용자정보조회
		$('#btnUserMe').on('click', function(e){ 
			if(isEmptyElem('token2')){
				alert('Access Token 을 먼저 획득해 주십시오.');
				return;
			}
			
			var uri = getSvrProps('base_api_uri');
			var option = {};
			switch(e.target.id){
			case 'btnUserMe': uri += '/v1.0/user/me'; 
				break;
			case 'btnAccountList': uri += '/v1.0/account/list';
				option = {
					'include_cancel_yn': $('#include_cancel_yn').val(),	
					'sort_order': $('#sort_order').val()	
				} 
				break;
			}
			$.ajax({
				url: uri,
				type: 'get',
				headers: {
					'Authorization': ('Bearer ' + $('#token2').val())
				},
				
				data: $.extend(true, {
					'user_seq_no': $('#user_seq_no').val(),
					'tran_dtime': new Date().format('yyyyMMddHHmmss')
				}, option)
				
			})
			.done(function(data, textStatus, jqXHR){
				if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
				
				$('#resultTextArea2').val(js(data));
			});		
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
			if(isEmptyElem('token5')){
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
			});
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