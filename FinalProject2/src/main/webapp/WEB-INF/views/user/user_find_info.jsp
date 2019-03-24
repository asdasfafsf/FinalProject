<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_find_info.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_find_info.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background'>
	<div class='user_full_screen'>
		<div class='user_contents_small'>
			<h2 id='type'>${type}찾기</h2>
			<div class='sub-menu'>
				<div class='btn-for-menu' id='find_id'>아이디찾기</div>
				<div class='btn-for-menu' id='find_pw'>비밀번호찾기</div>
			</div>
			<p>${explain }</p>
			<form id='user_find_container' class='user'>
				<div class='inputDiv'>
					<input class='inputBox' type='email' id='email' name='email' placeholder="email을 입력해주세요"/>
				</div>
				<button type='submit' class='submitBtn'>찾기</button>
			</form>
			<c:if test="${!empty result_msg})">
				<div id='div-result'>${result_msg }</div>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>