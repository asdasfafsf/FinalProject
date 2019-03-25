<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_enroll_form.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/user/user_edit_basic.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<c:if test="${!empty loginMsg }">
	<script>
	$(function(){
		alertBox(function(){location.href="/test/mainPage"},"${loginMsg}");
	});	
	</script>
</c:if>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_small'>
            <h2 id='title'>${title }</h2>
				<c:if test='${userNo != null}'>
            		<form id='editForm' class='user'>	
		                <div class='inputDiv'>
		                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='inputBox_with_btn' required oninput='emailLookUp();' value='${user.USER_EMAIL }'/>
		                    <input type='button' id='emailConfirm' class='btn-confirm' onclick='sendEmail();' disabled="disabled" value='인증'/>
		                </div>
		                <br/>
		                <small><span id='emailResult' class='display-error'></span></small>
		                
		    			<div class='inputDiv' id='confirmNo'>
		    				<input type='text' id='confirmInput' name='confirmNo' placeholder='인증번호 확인' class='inputBox_with_timer' required/>
		                    <label id='timer'>300</label>
		                    <input type='button' id='btn-confirm' class='btn-confirm' onclick='checkKey();' value='확인'/>
		    			</div>
		    			<br/>
		                <small><span id='confirm-result' class='display-error'></span></small>
		                
		                <div class='inputDiv'>
		                    <input type='password' id='cor_pw' name='cor_pw' placeholder="현재비밀번호" class='inputBox' required/>
		                </div>
		                <br/>
		                <div class='inputDiv'>
		                    <input type='password' id='pw' name='pw' placeholder="비밀번호" class='inputBox' required oninput='passwordCheck();'/>
		                </div>
		                <br/>
		                <small><span id='pwRegResult' class='display-error'></span></small>
		
		                <div class='inputDiv'>
		                    <input type='password' id='pw2' name='pw2' placeholder="비밀번호 확인" class='inputBox' required oninput='passwordCheck();'/>
		                </div>
		                <br/>
		                <small><span id='pwResult' class='display-error'>영문, 숫자, 특수문자를 조합한 8자 이상</span></small>
		                
		                <div id='btn-container'>
		                    <button class='submitBtn' type='submit'>등록</button>
		                </div>
	            	</form>
            	</c:if>
            	<c:if test='${tempUserNo != null }'>
            		<form id='resetPwFrm' class='user'>
		                <div class='inputDiv'>
		                    <input type='password' id='pw' name='pw' placeholder="비밀번호" class='inputBox' required oninput='passwordCheck();'/>
		                </div>
		                <br/>
		                <small><span id='pwRegResult' class='display-error'></span></small>
		
		                <div class='inputDiv'>
		                    <input type='password' id='pw2' name='pw2' placeholder="비밀번호 확인" class='inputBox' required oninput='passwordCheck();'/>
		                </div>
		                <br/>
		                <small><span id='pwResult' class='display-error'>영문, 숫자, 특수문자를 조합한 8자 이상</span></small>
		                
		                <div id='btn-container'>
		                    <button class='submitBtn' type = 'submit'>등록</button>
		                </div>
            		</form>
            	</c:if>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>