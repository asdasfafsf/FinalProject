<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_enroll_form.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_enroll_basic.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_small'>
			<h2>회원가입</h2>
			<form class='user_enroll_form' class='user'>
				
				<div id='terms_agree'>
                    <input type='checkbox' id='agree' name = 'agree'>
                    <div>
                    	<p>전체동의</p>
                    	<small>너나들이 서비스 이용약관</small>
                	</div>
                    <p id='see-terms-more'>></p>
                </div>
	
                <div class='inputDiv'>
                    <input type='email' id='email' class='inputBox_with_btn' name='email' placeholder="이메일 아이디" required oninput='emailCheckUp();'/>
                    <input type='button' id='emailConfirm' class='btn-confirm' value='인증'/>
                </div>
                <br/><small><span id='email-result' class='display-error'>&nbsp;</span></small>
	    			
	    			
    			<div class='inputDiv' id='confirmNo'>
    				<input type='text' id='confirmInput' class='inputBox_with_timer' name='confirmNo' placeholder='인증번호 확인' required/>
                    <label id='timer'>300</label>
                    <input type='button' id='confirm' class='btn-confirm' value='확인'/>
    			</div>
    			<br/><small><span id='confirm-result' class='display-error'>&nbsp;</span></small>
	                
	                
                <div class='pwInputDiv'>
                    <input type='password' id='pw'  class='inputBox' name='password' placeholder="대소문자, 숫자, 특수문자를 각각 1자리 이상 포함한 8자 이상" required oninput='passwordCheck();'/>
                </div>
                
                <div class='inputDiv'>
                    <input type='password' id='pw2' class='inputBox' name='pw2' placeholder="비밀번호 확인" required oninput='passwordCheck();'/>
                </div>
                <br/><small><span id='password-result' class='display-error'>영문 대문자, 소문자, 숫자, 특수문자를 각 1자리 이상 포함한 8자 이상 </span></small>
	
	
                <div class='inputDiv'>
                    <input type='text' id='name' class='inputBox' name='name' placeholder="이름" required oninput='nameCheck();'/>
                </div>
                <br/><small><span id='name-result' class='display-error'>&nbsp;</span></small>
	
	
                <div id='btn-container'>
                    <div class='submitBtn' id='enrollBtn'>등록</div>
                </div>
                
			</form>
		</div>
	</div>
</div>
</body>
</html>