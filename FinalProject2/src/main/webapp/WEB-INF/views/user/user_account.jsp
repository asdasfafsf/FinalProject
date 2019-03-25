<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_account.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<h2>결제정보 변경</h2>
            <table class='user-table'>
                <tr>
                    <th class='bankName'>은행명</th>
                    <th class='nickName'>별칭</th>
                    <th class='accountNo'>계좌번호</th>
                    <th class='selectBtn'>선택</th>
                </tr>
                <c:forEach items='${userAccount }' var='account'>
	                <tr>
	                    <td class='bankName'>${account.BANK_NO }</td>
	                    <td class='nickName'>${account.ACCOUNT_NAME }</td>
	                    <td class='accountNo'>${account.ACCOUNT_NO }</td>
	                    <td class='selectBtn'>
	                        <button onclick='deleteAccount(${account.FIN_NO })'>삭제</button>
	                    </td>
	                </tr>
                </c:forEach>
                <c:if test="${userAccount eq null }">
                	<tr>
                		<td colspan='4' id='nothingInHere'>
                			<div>등록된 계좌가 없습니다. 추가해주세요!</div>
                		</td>
                	</tr>
                </c:if>
                <tr>
                    <td colspan="4" id='plusAccount' onclick="registerUserAccount();">
                        + 추가
                    </td>
                </tr>
            </table>		
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>

<script>
	function registerUserAccount(){
		
	}
</script>