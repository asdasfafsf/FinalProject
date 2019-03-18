<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/editProfile.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/editProfile.css">
    <section>
        <div id='myProfile-container'>
            <div id='myInfo-container'>
            	<div id='myPhoto-container'>
	            	<img id='deletePhoto' class='photoBtn' src='${path }/resources/images/user/error.png'/>
	            	<img id='editPhoto' class='photoBtn' src='${path }/resources/images/user/edit.png'/>
	            	<form id='photoFrm' method="post">
		            	<input type='file' name='selectedPhoto' id='selectedPhoto'/>
	            	</form>
	                <img id='profilePhoto' src="${path }${user.USER_PROFILEPHOTO}"/>
            	</div>
            	<div id='myName-container'>
	                <h1 id='userName'>${user.USER_NAME }</h1>
	                <img id='editNameBtn' src='${path }/resources/images/user/edit.png'/>
	                <input id='editUserName' name='editUserName' type='text'/>
	                <img id='selectNameBtn' src='${path }/resources/images/user/tick.png'/>
	                <small id='displayError'></small>
            	</div>
            </div>
            <div id='myProfile-menu'>
                <span><label>내정보 설정</label></span>
                <c:if test='${user.USER_LINK_TYPE eq 1 }'>
	                <div id='editUserProfile'>
	                    <label>
	                        <div class='myProfile-text'>
	                            <img/>회원정보 변경
	                            <br/>
	                            <small>이메일, 패스워드 변경</small>
	                        </div>
	                        <div class='myProfile-btn'>
	                            <span>></span>
	                        </div>
	                    </label>
	                </div>
             	</c:if>
                <div id='editAddress'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            주소록 설정
                            <br/>
                            <small>배송지 추가, 변경, 삭제</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <div id='editAccount'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            결제정보 변경
                            <br/>
                            <small>결제 계좌 변경</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <div id='editPassword'>
                    <label>
                        <div class='myProfile-text'>
                            <img/>
                            비밀번호 변경
                            <br/>
                            <small>비밀번호 재설정</small>
                        </div>
                        <div class='myProfile-btn'>
                            <span>></span>
                        </div>
                    </label>
                </div>
                <br/>
                <a id='outUser' href="${pageContext.request.contextPath }/leave"><small>회원탈퇴</small></a>
            </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>