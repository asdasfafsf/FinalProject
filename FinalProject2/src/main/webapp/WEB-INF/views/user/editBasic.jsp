<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/registFrm.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/registFrm.css">
    <section>
        <div id='enroll-container'>

            <h2>회원정보 변경</h2>

            <form id='editForm'>
                <div class='inputDiv'>
                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='registInput2' required oninput='emailLookUp();'/>
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
                    <input type='text' id='name' name='name' placeholder="이름" class='registInput' required oninput='nameCheck();'/>
                </div>
                <br/>
                <small><span id='nameCheck' class='displayError'></span></small>

                <div id='btn-container'>
                    <div id='submitBtn' onclick='enroll_validate();'>변경</div>
                </div>

            </form>
        </div>
    </section>
    <footer></footer>
</body>
</html>