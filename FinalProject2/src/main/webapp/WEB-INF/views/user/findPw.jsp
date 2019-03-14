<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/findPw.css">
    <section>
    <h2>ID찾기</h2>
        <div id='submenu-container'>
            <div class='btn-submenu' onclick="location.href='${path }/find/id';">ID찾기</div>
            <div class='btn-submenu' onclick="location.href='${path }/find/pw';">PW찾기</div>
        </div>
        <div id='findId-container'>
            <div class='inputDiv'>
                 <input class='input' type="email" id='email' placeholder="email입력">
            </div>
            <br/>
            <div id='btn-search2'>찾기</div>
        </div>
    </section>
    <script src="/test/resources/js/user/findUser.js"></script>
</body>
</html>