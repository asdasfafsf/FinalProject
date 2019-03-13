<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/editBasic.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/editBasic.css">
    <section>
        <div id='enroll-container'>

            <h2>회원정보 변경</h2>

            <form id='editForm'>
                <div class='inputDiv'>
                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='registInput' required oninput='emailLookUp();'/>
                    <input type='button' id='emailConfirm' onclick='sendEmail();' value='인증' disabled/>
                </div>
                <br/>
                <small><span id='emailResult' class='displayError'></span></small>
                <div class='inputDiv confirm'>
                    <input type="text" id='confirmNo' class="confirm registInput" placeholder="인증번호를 입력해 주세요" required/>
                    <input type="button" id="confirmSubmit" onclick='submitEmail();' value='확인'/>
                </div>
                <small><span id='confirmResult' class='displayError'></span></small>
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