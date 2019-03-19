<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/account.css">
    <section>
        <div id='account-container'>
            <h2>결제정보 변경</h2>
            <table id='account-table'>
                <tr>
                    <th>은행명</th>
                    <th>계좌번호</th>
                    <th>선택</th>
                </tr>
                <c:forEach items='${userAccount }' var='account'>
	                <tr>
	                    <td class='bankName'>${account.BANK_NO }</td>
	                    <td class='accountNo'>${account.ACCOUNT_NO }</td>
	                    <td class='selectBtn'>
	                        <button onclick='deleteAccount(${account.FIN_NO })'>삭제</button>
	                    </td>
	                </tr>
                </c:forEach>
                <tr>
                    <td colspan="3" id='plusAccount'>
                        + 추가
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <footer></footer>
</body>
</html>