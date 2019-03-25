<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_address.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<h2>주소록 설정</h2>
            <div id='addAddressDiv'>새로운 주소를 등록하시려면 : <button id='addAddress'>주소록 추가</button></div>
            <table class='user-table'>
                <tr>
                    <th class='addressName'>배송지명</th>
                    <th class='name'>이름</th>
                    <th class='address'>주소</th>
                    <th class='phone'>연락처</th>
                    <th class='select'>선택</th>
                </tr>
                <c:forEach items="${userAddress }" var="addr">
	                <tr>
	                    <td class='addressName'>${addr.ADDRESS_NAME }</td>
	                    <td class='name'>${addr.ADDRESS_RECEIVER_NAME }</td>
	                    <td class='address'>${addr.ADRESS_WHOLE }</td>
	                    <td class='phone'>${addr.ADDRESS_PHONE }</td>
	                    <td class='select'>
	                        <button class='edit'>수정</button>
	                        <button class='delete' onclick='deleteAddress(${addr.ADDRESS_NO })'>삭제</button>
	                    </td>
	                </tr>
                </c:forEach>
                <c:if test="${empty userAddress }">
                	<tr>
                		<td colspan='5' id='nothingInHere'>
                			<div>
	                			등록된 주소록이 없습니다. 상단의 버튼을 눌러 주소록을 추가해보세요!
                			</div>
               			</td>
                	</tr>
                </c:if>
            </table>
        </div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>