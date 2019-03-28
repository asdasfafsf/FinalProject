<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_account.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/registerUserAccount.js"></script> <!-- 통장인증 js --> 

<link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css">
<link rel="stylesheet" href="/test/resources/css/reward/RewardWrite.css">

<script src="/test/resources/js/common/context.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>
<script src="/test/resources/js/common/Alert.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>


<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<h2>결제정보 변경</h2>
            <div id = 'account-container'>
            	<form action="" id="registerAccountForm">
	            	<div id='account-content' style="text-align:left;border:none;margin-left:60px;margin-top:20px;">
							<input type="hidden" name="user_token" id="user_token" value="${account[0].ACCESS_TOKEN }" readonly="readonly"/>
							<input type="hidden" name="user_refresh_token" id="user_refresh_token" value="${account[0].REFRESH_TOKEN }" readonly="readonly"/>
							<input type="hidden" name="user_seq_no" id="user_seq_no" value="${account[0].USER_SERIAL_NO }" readonly="readonly"/>
							<input type="hidden" name="fintech_use_num" id="fintech_use_num" value="${account[0].FIN_NO }" readonly="readonly"/>
							<input type="hidden" name="bank_code_std" id="bank_code_std" value="${account[0].BANK_NO }" readonly="readonly"/>
						<c:if test="${account !=null }"> 
							<div style="font-family:NanumSquareRound">은행이름 <input type='text' readonly name='bank_name' id='bank_name' value="${account[0].BANK_NAME }" style="width:300px;padding-left: 5px;font-family:NanumSquareRound"/></div><br>
							<div style="font-family:NanumSquareRound">　예금주 <input type='text' readonly name='account_holder_name' id='account_holder_name' value="${account[0].ACCOUNT_USER_NAME}" style="width:300px;padding-left: 5px;font-family:NanumSquareRound"/></div><br>
							<div style="font-family:NanumSquareRound">통장이름 <input type='text' readonly name='account_alias' id='account_alias' value="${account[0].ACCOUNT_NAME}" style="width:300px;padding-left: 5px;font-family:NanumSquareRound"/></div><br>
							<div style="font-family:NanumSquareRound">계좌번호 <input type='text' readonly name = 'account_num_masked' id = 'account_num_masked' value="${account[0].ACCOUNT_NO}" style="width:300px;padding-left: 5px;font-family:NanumSquareRound"></div>	        			    
		    	        </c:if>
		    	        <c:if test="${account ==null }"> 
							<input type='hidden' readonly name='bank_name' id='bank_name' class='bankEl' value="${account[0].BANK_NAME }"/>
							<input type='hidden' readonly name='account_holder_name' id='account_holder_name' class='bankEl' value="${account[0].ACCOUNT_USER_NAME}"/>
							<input type='hidden' readonly name='account_alias' id='account_alias' class='bankEl' value="${account[0].ACCOUNT_NAME}"/>
							<input type='hidden' readonly name = 'account_num_masked' id = 'account_num_masked' value="${account[0].ACCOUNT_NO}">	        			    
		    	        </c:if>
	
	            	</div>
	            	<button type="button" class="reward-btn-ok" onclick="clickRegisterAcctount();" style="margin-top:20px;">
	            		계좌인증
	            	</button>

            		
            	</form>
            </div>
            <!--  사용자 통장 등록 창 만들기 form -->
                <form id="authCodeReqFrm" class="auth-form">
					
						<!-- <div>Client ID:</div> -->
						<div><input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xx6d3f293ff0434fe688e43049b3b0b0a8"></input></div>
					
						<!-- <div>Client Secret:</div> -->
						<div><input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="cde4c721f31040f4a98e7f44ca4613d7"></input><!-- <span> (토큰발급시 필요)</span> --></div>

						<!-- <div style="width:120px; float:left; margin-left:0px">Response Type:</div> -->
						<input type="hidden" class="input-sm" id="response_type" name="response_type" style="width:55px"  value="code" readonly="readonly" />						
						
						<!-- <div>Scope:</div> -->
						<div><input type="hidden" class="input-sm" id="scope" name="scope" style="width:150px" value="transfer login inquiry" /> <!-- 공백문자(" ")를 구분자로 하여 multi scope 요청 가능 (예: login transfer) --></div>
									
						<!-- <div>Redirect URI:</div> -->
						<div><input type="hidden" class="input-sm" id="redirect_uri" name="redirect_uri" style="width:392px" value="http://localhost:9090/test/callback" /></div>
					
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
				
				<!-- 실명인증 -->
				<input type="hidden" class="input-sm" id="code" name="code" style="margin-left:4px"></input>
				
				<!-- 사용자일련번호 -->
				<input type="hidden" class="input-sm" id="user_seq_no" name="user_seq_no" style="width:110px"></input>					
									
				<!-- Access Token: -->
				<input type="hidden" class="input-sm" id="token" name="token"></input>
				
				<input type="hidden" class="input-sm" id="refresh_token" name="refresh_token"></input>
				
				<textarea id="inquiryUserInformResult" class="form-control" style="display:none; width:100%; height:150px; margin-left:3px" ></textarea>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>

