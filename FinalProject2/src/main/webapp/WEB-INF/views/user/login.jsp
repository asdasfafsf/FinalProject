<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/login.css">
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<section id='userSession'>
		<div id='userContainer'>
             <div id='login-container'>

	            <h2>로그인</h2>
	            
	            <form id='loginFrm' method='post'>
		           	<div class='inputDiv'>
		                <input type='email' id='email' class='loginInput' name='email' placeholder='이메일 아이디'/>
		            </div>
		            <div id='emailError' class='displayError'></div>
		
		            <div class='inputDiv'>
		                <input type='password' id='password' class='loginInput' name='password' placeholder='비밀번호(영문,숫자,특수문자 포함 8자 이상)'/>
		            </div>
		            <div id='loginError' class='displayError'></div>
					
		            <div style='height:25px; margin: 10px;'>
		                <label style='float:left;'><input type="checkbox" id='rememberId' name='rememberId' value='remember'/><small>아이디 저장</small></label>
		                <a href='${path }/find/pw' style="float: right;"><small>아이디/비밀번호 찾기 ></small></a>
		            </div>
			
		            <div id='loginBtn-container'>
		                <button type="submit" id='loginBtn' class='loginBtn'>로그인</button>
		                <small>또는</small>
		                <div id="naver_id_login"></div>
		                <div id='kakaoLogin' class='loginBtn'>카카오 로그인</div>
		            </div>
				</form>
	
	            <div style='margin-top:15px; margin-bottom: 15px;'>
	                <small>아직 계정이 없으시다면 <a href='${path }/welcome'>회원가입</a></small>
	            </div>
	        </div>
        </div>
	</section>
    <footer></footer>
    
    <script src="/test/resources/js/user/login.js"></script>
    <script>
	var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/enroll/naverCallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3 ,40);
	naver_id_login.setDomain("http://localhost:9090/test");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
    </script>
</body>
</html>