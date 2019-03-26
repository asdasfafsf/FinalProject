<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
<link rel="stylesheet" href="/test/resources/css/reward/RewardPayment.css"/>
    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    <script src="/test/resources/js/common/context.js"></script>
    <script src="/test/resources/js/common/LoginCheck.js"></script>
    <script src="/test/resources/js/reward/RewardPayment.js"></script>
    <script src="/test/resources/js/reward/RewardPaymentValidate.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/registerAccount.js"></script> <!-- 통장인증 js --> 


    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <div class='reward-payment-wrapper'>

		<br><br><br>
        <div class='reward-payment-select-wrapper'>
            <div class='reward-payment-select'>
                <p style='margin:0px;'>리워드 선택</p>
            </div>

            <p style='display:inline-block; font-size:0.9em; margin:0px; font-weight:bolder;'>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해드립니다.

        </div>
        <div class='reward-payment-reward-wrapper'>
     		<c:forEach items="${reward.itemList }" var="item">
            <div class='
            	<c:if test="${item.remainNum == 0 }">reward-payment-reward-disabled</c:if>
            	<c:if test="${item.remainNum != 0 }">reward-payment-reward</c:if>      
            '>
                <div class='reward-payment-reward-left'>
                    <div class='reward-payment-check-icon payment-no-check'></div>
                </div>
                <div class='reward-payment-reward-right'>
                    <div class='reward-payment-price'>
                        <div style='font-family:Do-Hyeon; font-size:1.5em; display:inline-block;'>${item.price }</div> 원 펀딩합니다.
                        <input type="hidden" class='itemPrice' value='${item.price }'>
                    </div>
                    	
                    <div class='reward-payment-name'>${item.name }</div>
                    <div class='reward-payment-remainnum'>(<div style='display:inline-block;'>${item.remainNum }</div>개 남음)</div>
                  
                    <div class='reward-payment-introduce'>${item.introduce }</div>
                    <div class='reward-payment-delivery'>
                        배송비 <div style='display:inline-block;'class='reward-payment-delivery-prices'>2500</div> 원 | 예상 배송일     	<fmt:formatDate value="${item.deliveryStartDate }" pattern="yyyy-MM-dd"/>
                    	~
                    	<fmt:formatDate value="${item.deliveryEndDate }" pattern="yyyy-MM-dd"/>

                    </div>

                    <div class='reward-payment-hidden-area' style='display:none;'>
                        

                        <div style='margin-bottom:20px;' class='reward-payment-num-area'>
                            <div class='reward-payment-num-left'>
                                <div class='reward-payment-num'>수량</div>
                                <div class='reward-payment-num-minus'></div>
                                <input type='number' style='width:120px; display:inline-block; vertical-align: middle;' value='1' max='<c:if test="${item.remainNum < 10 }">${item.remainNum }</c:if><c:if test="${item.remainNum >= 10 }">10</c:if>'/>
                                <div class='reward-payment-num-plus'></div>
                            </div>
                            
                            
                            
							<c:if test="${!empty item.selectOptionList }">
                            <div class='reward-payment-num-right'>
                                    <div class='reward-payment-num'>옵션</div>

                                    <select style="min-width:200px;">
                                    	<c:forEach items="${item.selectOptionList }" var="selectOption">
                                        <option name='selectOptionNo' value='${selectOption.no }'>${selectOption.content }</option>
                                        </c:forEach>
                                    </select>
                            </div>
                            </c:if>
                        </div>

						<c:if test="${!empty item.inputOptionList }">
                        <div class='reward-input-option-area'>

                            <div class='reward-payment-num'>추가 옵션</div>
							<c:forEach items="${item.inputOptionList }" var="inputOption">
                            <div class='reward-input-option'>${inputOption.content }</div>
                            <input style='display:inline-block; width:300px;' value=''name='inputOptionText' maxlength='40' type='text'>
                            <input type="hidden" name='inputOptionNo' value='${inputOption.no }'>
                            </c:forEach>
                        </div>
                        </c:if>

                    </div>

                    
                </div>
                <input type="hidden" name='itemNo' value='${item.no }'/>
            </div>
            </c:forEach>
    

        </div>

        <br><br>

        <div class='reward-payment-select-wrapper'>
                <div class='reward-payment-select'>
                    <p style='margin:0px;'>추가 후원금</p>
                </div>
    
                <p style='display:inline-block; font-size:0.9em; margin:0px; font-weight:bolder;'> 
                    후원금을 더하여 펀딩할 수 있습니다. 추가로 후원하시겠습니까?
                </p>

                <br>

                <input id='addtional-donation' value='' style='margin-left:120px;' max='20000000' type="number">
                <p style='display:inline-block; font-size:0.9em; margin:0px; font-weight:bolder;'> 
                        원을 추가로 후원합니다.
                    </p>
            </div>

        </div>
        <br><Br><Br><Br>

        <div class='reward-payment-wrapper'>
            
        <div class='reward-payment-select'>
                <p style='margin:0px;'>주문서</p>
        </div>
        <p style='display:inline-block; font-size:0.9em; margin:0px; font-weight:bolder;'> 
                주문서를 확인하세요!
            </p>

            <br><br><br><br>


            <div class='reward-payment-content'>
                <div class='reward-payment-line' style='background-color:black;'></div>
                <div class='reward-payment-item-list'>
 
            </div>

                <div class='reward-payment-line'></div>

                <div class='reward-payment-addtional-support'>
                    <div style='font-weight:bold; font-family:"NanumSquareRound"; display:inline-block; width:49%;'>추가 후원금</div>
                    <div style='display:inline-block; width:50%; font-family:"NanumSquareRound"; text-align: right;'>0 원</div>
                </div>

                <div class='reward-payment-line'></div>

                <div class='reward-payment-delivery-price'>
                        <div style='font-weight:bold; font-family:"NanumSquareRound"; display:inline-block; width:49%;'>배송비</div>
                        <div style='display:inline-block; width:50%; font-family:"NanumSquareRound"; text-align: right;'>0 원</div>

                </div>

                <div class='reward-payment-line'></div>

                
                <div class='reward-payment-all-price'>
                        <div style='font-weight:bold; font-family:"NanumSquareRound"; display:inline-block; width:49%;'>총 결제금액</div>
                        <div style='display:inline-block; width:50%; font-family:"NanumSquareRound"; text-align: right;'>0 원</div>

                </div>

                <div class='reward-payment-line' style='background-color:black;'></div>

            </div>

            <br><Br><br>
            <div class='reward-payment-info-area'>
                <div style='max-width:28%;' class="reward-payment-delivery-guide">
                        <div style='font-size:0.9em; font-family:NanumSquareRound; font-weight:bolder;' >펀딩스토리 리워드 배송 안내</div>
                        <div style='font-size:0.8em; font-family:NanumSquareRound;'>
                                펀딩에 대한 보답으로 메이커는 리워드를 약속한 배송일에 제공하기 위해 노력을 다합니다.
                        
                                리워드의 배송은 메이커가 담당하는 의무로 프로젝트 스토리에 안내한 배송시작일에 배송 시작을 원칙으로 합니다.

                                <br>
                                <br>
                                
                                다만, 프로젝트 진행 중 예기치 못한 사정으로 리워드 제작 및 배송 일정 변경이 있을 수 있음을 알려드립니다. 변경되는 배송일은 새소식으로 메이커가 직접 전해드립니다.
                                
                                <br>
                                <br>

                                리워드 제품의 불량 또는 배송오류에 대한 문의 접수 및 교환 처리는 리워드를 제공하는 메이커가 직접 담당하고 있습니다. 메이커에게 문의하기에 기재된 연락처로 직접 소통할 수 있습니다.
                                
                                기부•후원 프로젝트인 경우, 리워드가 발송되지 않지만 배송지를 입력해야 펀딩이 완료됩니다.
                        </div>

                </div>

                <div style='padding:15px;min-width:27%; max-width:27%; background-color:rgba(248,248,248,1); border-radius: 3px;' class='reward-payment-supporter-info'>
                        <div class='reward-payment-select'>
                                <p style='margin:0px; font-size:0.9em; font-family:NanumSquareRound;'>서포터 정보</p>
                        </div>
                        <br><br>
                        <div style='margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>서포터 이름</div>
                        <div style='margin-bottom:10px; padding:5px; font-size:0.9em; font-family:NanumSquareRound;'>${user.USER_NAME }</div>

                        <div style='margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>서포터 이메일</div>
                        <div style='margin-bottom:10px;padding:5px; font-size:0.9em; font-family:NanumSquareRound;'>${user.USER_EMAIL }</div>

                </div>

                <div style='max-width:34%; min-width:34%; padding:15px;'class='reward-payment-address'>
                        <div class='reward-payment-select'>
                                <p style='margin:0px; font-size:0.9em; font-family:NanumSquareRound;'>리워드 배송지</p>
                        </div>

                        <br><br>
                        <div class='reward-payment-line' style='height:2px;'></div>
                        <br>
                        <div style='display:inline-block; max-width:72px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
                            <label class='address-label active-label'></label>
                            <span style='max-width:46px; font-size:0.8em; font-family:NanumSquareRound; vertical-align: top;'>직접입력</span>
                        </div>
						<c:forEach items='${userAddress }' var='address'> 
                        <div style='display:inline-block; max-width:72px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
                                <label class='address-label non-active-label'></label>
                                <span style='max-width:46px; font-size:0.8em; font-family:NanumSquareRound; vertical-align: top;'>${userAddress.ADDRESS_NAME }</span>
                        		<input type='hidden' name='addressNo' value='${userAddress.ADDRESS_NO }'>
                        </div>
                        </c:forEach>
                        
                        <input type='hidden' name='addressZipNo'>
                        <input type='hidden' name='addressWhole'>
                        <input type='hidden' name='addressPhone'>
                        <input type='hidden' name='addressDetail'>
                        <input type='hidden' name='addressReceiverName'>

                     
                        <div style='margin-top:15px; margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>이름</div>
                        <input type='text' name='deliveryUserName' style=''>

                        <div style='margin-top:15px; margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>휴대폰 번호</div>
                        <input type='text' name='deliveryUserPhone' style=''>

                        <div style='margin-top:15px; margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>주소</div>
                        <div class='reward-payment-select' style='display: block;' onClick="findAddress()">
                                <p style='margin:0px; font-size:0.9em; font-family:NanumSquareRound;'>주소 검색</p>
                        </div>
                        
                        <div style='margin-top:15px; margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>상세 주소</div>
                        
                        <input type='text' name='deliveryAddressDetail' style=''>

                        <div style='margin-top:15px; margin-bottom:3px; font-weight:bold; font-size:1em; font-family:NanumSquareRound;'>배송시 요청사항</div>
                        <input type='text' name='deliveryRequest' style=''>

                        <br><br>
                        <div class='reward-payment-line' style='height:1px;'></div>

                        <input type='hidden' name='addressType' value='0'>
                </div>

            </div>

        </div>
        
			<div style="width:400px;margin-right:auto; margin-left: auto;margin-bottom: 50px;background-color: rgba(243,243,243,1);border-radius: 3px;">
                    
                    <p class="assist" style="font-weight:bold;font-family:NanumSquareRound;padding: 20px">프로젝트가 성공하면 돈을 지불할 계좌를 설정합니다!</p>

                    <div style="margin: -20px 20px 20px 20px;">

							<input type="hidden" name="user_token" id="user_token" value="${rewardAccount[0].ACCESS_TOKEN }" readonly="readonly"/>
							<input type="hidden" name="user_refresh_token" id="user_refresh_token" value="${rewardAccount[0].REFRESH_TOKEN }" readonly="readonly"/>
							<input type="hidden" name="user_seq_no" id="user_seq_no" value="${rewardAccount[0].USER_SERIAL_NO }" readonly="readonly"/>
							<br>
							<div style="font-weight:bold;font-family:NanumSquareRound">통장이름 <input type="text" name="account_alias" id="account_alias" value="${rewardAccount[0].ACCOUNT_NAME }" style="width:290px;" readonly="readonly"/></div>
							<br>
							<div style="font-weight:bold;font-family:NanumSquareRound">　예금주 <input type="text" name="account_holder_name" id="account_holder_name" value="${rewardAccount[0].ACCOUNT_USER_NAME }" style="width:290px;" readonly="readonly"/></div>
							<br>
							<input type="hidden" name="fintech_use_num" id="fintech_use_num" value="${rewardAccount[0].FIN_NO }" readonly="readonly"/>
							<div style="font-weight:bold;font-family:NanumSquareRound">계좌번호 <input type="text" name="account_num_masked" id="account_num_masked" value="${rewardAccount[0].ACCOUNT_NO }" style="width:290px;" readonly="readonly"/></div>
							<br>
							<div style="font-weight:bold;font-family:NanumSquareRound">은행이름 <input type="text" name="bank_name" id="bank_name" value="${rewardAccount[0].BANK_NAME }" style="width:290px;" readonly="readonly"/></div>
							<input type="hidden" name="bank_code_std" id="bank_code_std" value="${rewardAccount[0].BANK_NO }" readonly="readonly"/>
						<div>
							<button type="button" class="reward-payment-select" onclick="loadUserAccount();" style="outline:none;border:none;cursor:pointer;font-size: 13px;margin: 20px 10px 20px 140px">정보 불러오기</button>
                            <button type="button" class="reward-payment-select" onclick="clickRegisterAcctount();" style="outline:none;border:none;cursor:pointer;font-size: 13px;margin-top: 20px;">설정</button>
                        </div>
                       
                    </div>
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
					
           <div class='reward-payment-next-btn' onclick='requestSupportAjax()'>후원하기</div>
            
            
            <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>
            
            <c:if test="${!empty itemIndex}">
            	<script>
            	
            	$(function(){
            		onClickRewardPaymentReward();
            		$('.reward-payment-reward-wrapper > div:eq(' + ${itemIndex} + ')').trigger('click');
            	});
            	</script>
            
            </c:if>


