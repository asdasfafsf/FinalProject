<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/address.css">
    <section>
        <div id='address-container'>

            <h2>주소록 설정</h2>
            
            <div>새로운 주소를 등록하시려면 : <button id='addAddress'>주소록 추가</button></div>

            <table id='address-table'>
                <tr>
                    <th>배송지명</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>선택</th>
                </tr>
                <tr>
                    <td class='addressName'></td>
                    <td class='name'></td>
                    <td class='address'></td>
                    <td class='phone'></td>
                    <td class='select'>
                        <button class='edit'>수정</button>
                        <button class='delete'>삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" id='plusAccount'>
                        + 추가
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <footer></footer>
</body>
</html>