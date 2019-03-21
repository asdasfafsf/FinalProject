<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/test/resources/js/user/editAddress.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/address.css">
	<section id='userSession'>
		<div id='userContainer'>
	        <div id='address-container'>
	
	            <h2>주소록 설정</h2>
	            
	            <div>새로운 주소를 등록하시려면 : <button id='addAddress'>주소록 추가</button></div>
	
	            <table id='address-table'>
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
	                	<tr class='nothingInHere'>
	                		<td colspan='5' class='nothingInHere'>
	                			<div class='nothingInHere'>
		                			등록된 주소록이 없습니다.
	                			</div>
	               			</td>
	                	</tr>
	                </c:if>
	                <tr>
	                    <td colspan="5" id='plusAccount'>
	                        + 추가
	                    </td>
	                </tr>
	            </table>
	        </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>