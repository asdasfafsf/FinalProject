<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="/test/resources/js/user/login.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_small'>
			<h2>로그인</h2>
			<form id='loginFrm' class='user' method='post'>
	           	<div class='inputDiv'>
	                <input type='email' id='email' class='inputBox' name='email' placeholder='이메일 아이디'/>
	            </div>
	            <div id='emailError' class='displayError'></div>
	
	            <div class='inputDiv'>
	                <input type='password' id='password' class='inputBox' name='password' placeholder='비밀번호(영문,숫자,특수문자 포함 8자 이상)'/>
	            </div>
	            <div id='loginError' class='displayError'></div>
				
	            <div id='#extra_menu'>
	               <!--  <label style = "float : left;">
	                	<input type="checkbox" id='rememberId' name='rememberId' value='remember'/>
                		<small>로그인 유지</small>
	                </label> -->
	                <a id='btn-find-user'><small>아이디/비밀번호 찾기 ></small></a>
	            </div>
		
	            <div class='btn-container'>
	                <button type="submit" class='submitBtn'>로그인</button>
	                <div id="naver_id_login"></div>
	                <a id='kakao-login-btn'></a>
	            </div>
			</form>
            <div id='login-container'>
                <small>아직 계정이 없으시다면 : <a href='${path }/welcome'>회원가입</a></small>
            </div>
		</div>
	</div>
</div>
<script>
	var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://192.168.20.40:9090/test/user/naver.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3 ,45);
	naver_id_login.setDomain("http://192.168.20.40:9090/test");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</body>
</html>