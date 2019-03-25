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
            <div id = 'account-container'>
            	<div id='account-content'>
					<c:if test="${myList !=null }">
						<input type='text' readonly id='bankName' class='bankEl'/>
						<input type='text' readonly id='accountUserName' class='bankEl'/>
						<input type='text' readonly id='accountNickName' class='bankEl'/>
						<input type='text' readonly id = 'accountNo'/>	        			    
	    	        </c:if>
	    	        <c:if test="${empty myList }">
	    	        	<div id = 'nothingInHere'>
	    	        		등록된 계좌가 없습니다. <a href="javascript:void(0)" class='addBtn'>추가해주세요!</a>
	    	        	</div>
	    	        </c:if>
            	</div>
            	<c:if test="${empty myList }">
	            	<button class='addBtn'>
	            		추가
	            	</button>
            	</c:if>
            	<c:if test="${myList !=null }">
            		<button class='delBtn'>
            			삭제
            		</button>
            	</c:if>
            </div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>