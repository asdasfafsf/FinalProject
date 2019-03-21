<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/editBasic.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/registFrm.css">
	<section id='userSession'>
		<div id='userContainer'>
       	    <div id='enroll-container'>
	            <h2 id='title'>${user.TITLE }</h2>
	            <form id='editForm'>
					<c:if test='${userNo != null}'>
		                <div class='inputDiv'>
		                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='registInput2' required oninput='emailLookUp();' value='${user.USER_EMAIL }'/>
		                    <input type='button' id='emailConfirm' class='btn-confirm' onclick='sendEmail();' disabled="disabled" value='인증'/>
		                </div>
		                <br/>
		                <small><span id='emailResult' class='displayError'></span></small>
		    			<div class='inputDiv' id='confirmNo'>
		    				<input type='text' id='confirmInput' name='confirmNo' placeholder='인증번호 확인' class='registInput2' required/>
		                    <label id='timer'> </label>
		                    <input type='button' id='confirm' class='btn-confirm' onclick='checkKey();' value='확인'/>
		    			</div>
		    			<br/>
		                <small><span id='confirm-result' class='displayError'></span></small>
		                
		                <div class='inputDiv'>
		                    <input type='password' id='cor_pw' name='cor_pw' placeholder="현재비밀번호" class='registInput' required/>
		                </div>
		                <br/>
	               </c:if>
	                <div class='inputDiv'>
	                    <input type='password' id='pw' name='pw' placeholder="비밀번호" class='registInput' required oninput='passwordCheck();'/>
	                </div>
	                <br/>
	                <small><span id='pwRegResult' class='displayError'></span></small>
	
	                <div class='inputDiv'>
	                    <input type='password' id='pw2' name='pw2' placeholder="비밀번호 확인" class='registInput' required oninput='passwordCheck();'/>
	                </div>
	                <br/>
	                <small><span id='pwResult' class='displayError'>영문, 숫자, 특수문자를 조합한 8자 이상</span></small>
	                
	                <div id='btn-container'>
	                    <div id='submitBtn' onclick='enroll_validate();'>등록</div>
	                </div>
	            </form>
	        </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>