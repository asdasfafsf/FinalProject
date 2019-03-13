<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/editPw.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/editPw.css">
    <section>
        <div id='enroll-container'>

            <h2>비밀번호 변경</h2>

            <form id='enrollFrm'>
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
    </section>
    <footer></footer>
</body>
</html>