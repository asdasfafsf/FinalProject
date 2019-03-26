<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_address.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_address.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function findAddr()
{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip-no').value = data.zonecode;
            document.getElementById("addrWhole").value = data.roadAddress;
            $('#extraAddr').val(data.buildingName);
        }
    }).open();
}
</script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<h2>주소록 설정</h2>
            <div id='addAddressDiv'>새로운 주소를 등록하시려면 : <button id='addAddress'>주소록 추가</button></div>
            <div id='reshow'>
            	<form id='addressForm'>
	            	<label>등록하실 배송지 이름 : </label><input type='text' id='addrName' maxlength="16" required="required" placeholder="배송지 명"/>
            		<br/>
            		<input type='text' id='receiver' maxlength="10" required='required' placeholder='받는 사람 이름'/>
            		<input type="tel" id='phone' required='required' maxlength="11" placeholder="연락처"/>
            		<br/>
            		<input type='text' id='zip-no' required="required" readonly/>
            		<input type='text' id='addrWhole' required="required" readonly/>
            		<input type='text' id='extraAddr' readonly/>
            		<br/>
            		<input type='text' id='addrDetail' placeholder="상세주소"/>
            		<br/>
            		<button id='cancel' class='addrBtn'>취소</button>
            		<button id='addAddr' class='addrBtn'>등록</button>
            	</form>
            </div>
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
	                        <button class='delete addrBtn' onclick='deleteAddress(${addr.ADDRESS_NO })'>삭제</button>
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