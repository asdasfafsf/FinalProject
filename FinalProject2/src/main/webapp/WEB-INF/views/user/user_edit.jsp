<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_edit.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_edit.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_small'>
            <div id='myInfo-container'>
            	<div id='myPhoto-container'>
	            	<form id='photoFrm' method="post" class='user'>
		            	<input type='file' name='selectedPhoto' id='selectedPhoto'/>
	            	</form>
	                <div id='profilePhoto' style='background:url("${path }${user.USER_PROFILEPHOTO}") no-repeat; background-size:148px 148px;'>
		            	<img id='deletePhoto' class='photoBtn' src='${path }/resources/images/user/error.png'/>
		                <img id='editPhoto' class='photoBtn' src='${path }/resources/images/user/edit.png'/>
	                </div>
            	</div>
            	<div id='myName-container'>
	                <h2 id='userName'>${user.USER_NAME }</h2>
	                <button id='editNameBtn' class='smallBtn'>이름 수정</button>
	                <form id='nameFrm' method='post' class='user'>
		                <input id='editUserName' name='editUserName' type='text'/>
		                <button id='selectNameBtn' class='smallBtn' type='submit'>확인</button>
	                </form>
	                <small id='displayError'></small>
            	</div>
            </div>
            <div id='myProfile-menu'>
                <span><label>내정보 설정</label></span>
                <c:if test='${user.USER_LINK_TYPE eq 1 }'>
	                <div id='editUserProfile'>
	                    <label>
	                        <div class='myProfile-text'>
	                            	회원정보 변경
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
                           			 결제정보 변경
                            <br/>
                            <small>결제 계좌 변경</small>
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
	</div>
</div>
</body>
</html>